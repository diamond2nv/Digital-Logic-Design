`timescale 1ns / 1ps


module edge_detector(
    input clk,
    input signal,
    input reset,
    output reg outedge
    );
    
    wire slow_clk;
    reg [1:0] state;
    reg [1:0] next;
    
    clkdiv cl(.clk(clk), .reset(reset), .clk_out(slow_clk));
    
    always @(*) begin
        case(state)
            2'b00: begin
                outedge = 1'b0;
                if(~signal) next = 2'b00;
                else next = 2'b01;
            end
            2'b01: begin
                outedge = 1'b1;
                next = 2'b10;
            end
            2'b10: begin
                outedge = 1'b0;
                if(~signal) next = 2'b00;
                else next = 2'b10;
            end
            default: next = 2'b00;
        endcase
    end
    
    always @(posedge slow_clk) begin
        if(reset) state <= 2'b00;
        else state <= next;
    end
endmodule

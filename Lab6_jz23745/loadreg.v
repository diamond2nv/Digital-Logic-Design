`timescale 1ns / 1ps

module loadreg(
    input clk,
    input load,
    input [15:0] D,
    output reg [15:0] Q
    );
    initial Q = 0;
    always @(posedge clk) begin
        if(load) Q <= D;
        end
        
endmodule

`timescale 1ns / 1ps

module controller_datapath(
    input clk,
    input reset,
    input start_stop,
    input [1:0] mode,
    input [3:0] tens,
    input [3:0] ones,
    output [15:0] count
    );
    
    reg [4:0] state = 0;
    reg [4:0] next_state = 0;
    reg [15:0] count_input = 0;
    wire clkout;
    reg loadcount = 0;
    
    loadreg c1(.clk(clkout), .load(loadcount), .D(count_input), .Q(count));
    clkdiv2 cl1(.clk(clk), .clk_out(clkout));
    
    //state sequencer
    always @(*) begin
        case(state)
            4'b0000: begin
                     if(!reset) next_state = 4'b0000;
                     else next_state = 4'b1011;
                     end
                      
            4'b0001: begin 
                     if(reset) next_state = 4'b1011;
                     else if(!start_stop && !reset) next_state = 4'b0001;
                     else if(start_stop && !reset) next_state = 4'b0101;
                     end
                     
            4'b0010: begin
                     if(reset) next_state = 4'b1011;
                     else if(!start_stop && !reset) next_state = 4'b0010;
                     else if(start_stop && !reset) next_state = 4'b1100;
                     end
                     
            4'b0011: begin
                     if(mode == 0) next_state = 4'b1000;
                     else if(mode == 1) next_state = 4'b0100;
                     else if(mode == 2) next_state = 4'b0010;
                     else next_state = 4'b0001;
                     end
                     
            4'b0100: begin
                     if(reset) next_state = 4'b1011;
                     else if(!start_stop && !reset) next_state = 4'b0100;
                     else if(start_stop && !reset) next_state = 4'b1101;
                     end
                     
            4'b0101: begin
                     if(count != 0) next_state = 4'b1100;
                     else next_state = 4'b0000;
                     end
                     
            4'b0110: begin
                     if(count == 1) next_state = 4'b0000;
                     else if(count != 1 && !start_stop) next_state = 4'b0110;
                     else if(count != 1 && start_stop) next_state = 4'b1110;
                     end
                     
            4'b0111: begin
                     if(reset) next_state = 4'b1011;
                     else if(!start_stop && !reset) next_state = 4'b0111;
                     else if(start_stop && !reset) next_state = 5'b10000;
                     end
                     
            4'b1000: begin
                     if(reset) next_state = 4'b1101;
                     else if(!start_stop && !reset) next_state = 4'b1000;
                     else if(start_stop && !reset) next_state = 4'b1101;
                     end
                     
            4'b1001: begin
                     if(count == 9998) next_state = 4'b0000;
                     else if(count != 9998 && !start_stop) next_state = 4'b1001;
                     else if(count != 9998 && start_stop) next_state = 4'b1111;
                     end
                     
            4'b1010: begin
                     if(reset) next_state = 4'b1011;
                     else if(!start_stop && !reset) next_state = 4'b1010;
                     else if(start_stop && !reset) next_state = 5'b10001;
                     end
                     
            4'b1011: begin
                     if(!reset) next_state = 4'b0011;
                     else next_state = 4'b1011;
                     end
                     
            4'b1100: begin
                     if(!start_stop) next_state = 4'b0110;
                     else next_state = 4'b1100;
                     end
                     
            4'b1101: begin
                     if(!start_stop) next_state = 4'b1001;
                     else next_state = 4'b1101;
                     end
                     
            4'b1110: begin
                     if(!start_stop) next_state = 4'b0111;
                     else next_state = 4'b1110;
                     end
                     
            4'b1111: begin
                     if(!start_stop) next_state = 4'b1010;
                     else next_state = 4'b1111;
                     end
            5'b10000: begin
                     if(start_stop) next_state = 5'b10000;
                     else next_state = 4'b0110;
                     end
            5'b10001: begin
                     if(start_stop) next_state = 5'b10001;
                     else next_state = 4'b1001;
                     end
        endcase
    end
        
    //output for each state
    always @(*) begin
        case(state)
            4'b0001: begin
                     loadcount = 1;
                     count_input = tens*1000 + ones*100;
                     end
            4'b0010: begin
                     loadcount = 1;
                     count_input = 9999;
                     end
            4'b0100: begin
                     loadcount = 1;
                     count_input = tens*1000 + ones*100;
                     end
            4'b0110: begin
                     loadcount = 1;
                     count_input = count - 1;
                     end
            4'b1000: begin
                     loadcount = 1;
                     count_input = 0;
                     end
            4'b1001: begin
                     loadcount = 1;
                     count_input = count + 1;
                     end
            4'b1110: begin
                     loadcount = 1;
                     count_input = count + 1;
                     end
            4'b1111: begin
                     loadcount = 1;
                     count_input = count + 1;
                     end
            default: loadcount = 0;
        endcase
    end
    
    always @(posedge clkout) begin
        state <= next_state;
    end
endmodule

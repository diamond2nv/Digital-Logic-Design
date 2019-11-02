`timescale 1ns / 1ps

module clkdiv(
    input clk,
    input reset,
    output reg clk_out
    );
    
    // Initialize count register
    // Be sure to change the width of the counter
    // between simulation and on-board implementation
    reg [24:0] count = 0;
    
    //Use this line if you want to use bitmasking to create your divider.
    //assign clk_out = count[2];
    initial clk_out = 0;
    always @(posedge clk) begin
        if(reset) count <= 0;
        else count <= count + 1;
        
        //n*(10*10^-9) = 50*10^-3
        if(count == 5000000) begin
        count <= 0;
        clk_out <= ~clk_out;
        end
    end
endmodule

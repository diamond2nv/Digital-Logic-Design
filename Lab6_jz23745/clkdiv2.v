`timescale 1ns / 1ps

module clkdiv2(
    input clk,
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
        count <= count + 1;
        
        //2*5ns
        //5*10^-3/10*10^-9 = 500000
        if(count == 500000) begin
        count <= 0;
        clk_out <= ~clk_out;
        end
    end
endmodule

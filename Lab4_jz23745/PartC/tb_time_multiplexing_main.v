`timescale 1ns / 1ps

module tb_time_multiplexing_main;
reg clk = 0;
reg reset = 0;
reg [15:0] sw = 0;
wire [3:0] an;
wire [6:0] sseg;

time_multiplexing_main uut(
    .clk(clk),
    .reset(reset),
    .sw(sw),
    .an(an),
    .sseg(sseg)
    );
    
//Simulate clock signal
always #5 clk = ~clk;

initial begin
    #20 reset = 1;
    #20 reset = 0;
    #20 sw = 16'b0000000000000001;
    #20 sw = 16'b0000000000010001;
    #20 sw = 16'b0000000100010001;
    #20 sw = 16'b0001000100010001;
    #20 sw = 16'b0001000100010011;
    #20 sw = 16'b0001000100110011;
    #20 sw = 16'b0001001100110011;
    #20 sw = 16'b0011001100110011;
    #20 sw = 16'b0011001100110111;
    #20 sw = 16'b0011001101110111;
    #20 sw = 16'b0011011101110111;
    #20 sw = 16'b0111011101110111;
    #20 sw = 16'b0111011101111111;
    #20 sw = 16'b0111011111111111;
    #20 sw = 16'b0111111111111111;
    #20 sw = 16'b1111111111111111;
end
endmodule

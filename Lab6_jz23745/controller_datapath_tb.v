`timescale 1ns / 1ps

module controller_datapath_tb;

wire [15:0] count;
reg clk = 0;
reg reset = 0;
reg start_stop  = 0;
reg [1:0] mode = 0;
reg [3:0] tens = 0;
reg [3:0] ones = 0;

controller_datapath uut(.clk(clk), .reset(reset), .start_stop(start_stop), .mode(mode), .tens(tens), .ones(ones), .count(count));

always #5 clk = ~clk;

initial begin
    reset = 1;
    #20;
    reset = 0;
    #20;
    start_stop = 1;
    #100
    start_stop = 0;
end
endmodule

`timescale 1ns / 1ps

module tb_stopwatch;

wire [8:0] count;
reg clk = 0;
reg reset = 0;
reg start_stop  = 0;
reg [1:0] mode = 0;
reg [3:0] tens = 0;
reg [3:0] ones = 0;

stopwatch uut(.clk(clk), .reset(reset), .start_stop(start_stop), .mode(mode), .left(left), .right(right), .select(select), .an(an), .sseg(sseg), .dp(dp));

always #5 clk = ~clk;

initial begin
    reset = 1;
    #100
    reset = 0;
    #100
    start_stop = 1;
    #100
    start_stop = 0;
    
end
endmodule

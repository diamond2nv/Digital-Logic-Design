`timescale 1ns / 1ps

module tb_edge_detector;

reg clk = 0;
reg signal = 0;
reg reset = 0;
wire outedge;

edge_detector uut(
    .clk(clk),
    .signal(signal),
    .reset(reset),
    .outedge(outedge)
    );

//Simulate clock signal
always #5 clk = ~clk;

initial begin
    #100 reset = 1; signal = 0;
    #100 reset = 0; signal = 1;
    #100 reset = 0; signal = 1;
    #100 reset = 0; signal = 1;
    #100 reset = 0; signal = 0;
    #100 reset = 0; signal = 1;
    #100 reset = 0; signal = 0;
    #100 reset = 0; signal = 0;
    end
endmodule

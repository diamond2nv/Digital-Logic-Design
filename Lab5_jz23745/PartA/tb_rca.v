`timescale 1ns / 1ps


module tb_rca;

reg clk = 0;
reg load = 0;
reg [3:0] a = 0;
reg [3:0] b = 0;
reg Cin = 0;

wire [4:0] Q;

rca uut(.clk(clk), .load(load), .a(a), .b(b), .Cin(Cin), .Q(Q));

always #5 clk = ~clk;

initial begin
    load = 1;
    a = 4'b0001; b = 4'b0101; Cin = 0;
    
    #20
    
    a = 4'b0111; b = 4'b0111; Cin = 0;
    
    #20
    
    a = 4'b1000; b = 4'b0111; Cin = 1;
    
    #20
    
    a = 4'b1100; b = 4'b0100; Cin = 0;
    
    #20
    
    a = 4'b1000; b = 4'b1000; Cin = 1;
    
    #20
    
    a = 4'b1001; b = 4'b1010; Cin = 1;
    
    #20
    
    a = 4'b1111; b = 4'b1111; Cin = 0;
    end
endmodule

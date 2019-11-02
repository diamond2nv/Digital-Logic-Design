`timescale 1ns / 1ps

module rca(
    input clk,
    input load,
    input [3:0] a,
    input [3:0] b,
    input Cin,
    output [4:0] Q
    );
    
    wire s0, s1, s2, s3;
    wire co0, co1, co2, co3;
    
    loadreg loadreg0(.clk(clk), .load(load), .D(s0), .Q(Q[0]));
    loadreg loadreg1(.clk(clk), .load(load), .D(s1), .Q(Q[1]));
    loadreg loadreg2(.clk(clk), .load(load), .D(s2), .Q(Q[2]));
    loadreg loadreg3(.clk(clk), .load(load), .D(s3), .Q(Q[3]));
    loadreg loadreg4(.clk(clk), .load(load), .D(co3), .Q(Q[4]));
    
    adder adder0(.a(a[0]), .b(b[0]), .Cin(Cin), .S(s0), .Cout(co0));
    adder adder1(.a(a[1]), .b(b[1]), .Cin(co0), .S(s1), .Cout(co1));
    adder adder2(.a(a[2]), .b(b[2]), .Cin(co1), .S(s2), .Cout(co2));
    adder adder3(.a(a[3]), .b(b[3]), .Cin(co2), .S(s3), .Cout(co3));
    
    
    
endmodule

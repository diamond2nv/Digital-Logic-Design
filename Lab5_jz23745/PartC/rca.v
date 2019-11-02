`timescale 1ns / 1ps

module rca(
    input clk,
    input [3:0] a,
    input [3:0] b,
    input Cin,
    output [4:0] S
    );
    
    wire co0, co1, co2, co3;
    
    adder adder0(.a(a[0]), .b(b[0]), .Cin(Cin), .S(S[0]), .Cout(co0));
    adder adder1(.a(a[1]), .b(b[1]), .Cin(co0), .S(S[1]), .Cout(co1));
    adder adder2(.a(a[2]), .b(b[2]), .Cin(co1), .S(S[2]), .Cout(co2));
    adder adder3(.a(a[3]), .b(b[3]), .Cin(co2), .S(S[3]), .Cout(co3));
    
    assign S[4] = co3;
    
endmodule

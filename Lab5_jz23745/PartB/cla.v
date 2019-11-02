`timescale 1ns / 1ps

module cla(
    input clk,
    input load,
    input [3:0] a,
    input [3:0] b,
    input Cin,
    output [4:0] Q
    );
    
    wire [3:0] G, P, S;
    wire [4:0] C;
    assign C[0] = Cin;
    
    assign P[0] = a[0]^b[0];
    assign P[1] = a[1]^b[1];
    assign P[2] = a[2]^b[2];
    assign P[3] = a[3]^b[3];
    
    assign G[0] = a[0]&b[0];
    assign G[1] = a[1]&b[1];
    assign G[2] = a[2]&b[2];
    assign G[3] = a[3]&b[3];
    
    assign C[1] = G[0] | (P[0]&C[0]);
    assign C[2] = (P[1]&P[0]&C[0]) | (P[1]&G[0]) | G[1];
    assign C[3] = (P[2]&P[1]&P[0]&C[0]) | (P[2]&P[1]&G[0]) | (P[2]&G[1]) | G[2];
    assign C[4] = (P[3]&P[2]&P[1]&P[0]&C[0]) | (P[3]&P[2]&P[1]&G[0]) | (P[3]&P[2]&G[1]) | (P[3]&G[2]) | G[3];
    
    adder adder0(.P(P[0]), .C(C[0]), .S(S[0]), .Cout(C[1]));
    adder adder1(.P(P[1]), .C(C[1]), .S(S[1]), .Cout(C[2]));
    adder adder2(.P(P[2]), .C(C[2]), .S(S[2]), .Cout(C[3]));
    adder adder3(.P(P[3]), .C(C[3]), .S(S[3]), .Cout(C[4]));
    
    loadreg loadreg0(.clk(clk), .load(load), .D(S[0]), .Q(Q[0]));
    loadreg loadreg1(.clk(clk), .load(load), .D(S[1]), .Q(Q[1]));
    loadreg loadreg2(.clk(clk), .load(load), .D(S[2]), .Q(Q[2]));
    loadreg loadreg3(.clk(clk), .load(load), .D(S[3]), .Q(Q[3]));
    loadreg loadreg4(.clk(clk), .load(load), .D(C[4]), .Q(Q[4]));
    
    
endmodule

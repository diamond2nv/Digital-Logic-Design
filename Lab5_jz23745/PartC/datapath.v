`timescale 1ns / 1ps

module datapath(
    input clk,
    input load,
    input [3:0] a,
    input [3:0] b,
    input Cin,
    input select,
    output [9:0] Q
    );
    
    wire [9:0] S;
    wire [9:0] T;
    rca rca(.clk(clk), .a(a), .b(b), .Cin(Cin), .S({S[4],S[3],S[2],S[1],S[0]}));
    cla cla(.clk(clk), .a(a), .b(b), .Cin(Cin), .S({S[9],S[8],S[7],S[6],S[5]}));
    
    loadreg loadreg0(.clk(clk), .load(load), .D(S[0]), .Q(T[0]));
    loadreg loadreg1(.clk(clk), .load(load), .D(S[1]), .Q(T[1]));
    loadreg loadreg2(.clk(clk), .load(load), .D(S[2]), .Q(T[2]));
    loadreg loadreg3(.clk(clk), .load(load), .D(S[3]), .Q(T[3]));
    loadreg loadreg4(.clk(clk), .load(load), .D(S[4]), .Q(T[4]));
    loadreg loadreg5(.clk(clk), .load(load), .D(S[5]), .Q(T[5]));
    loadreg loadreg6(.clk(clk), .load(load), .D(S[6]), .Q(T[6]));
    loadreg loadreg7(.clk(clk), .load(load), .D(S[7]), .Q(T[7]));
    loadreg loadreg8(.clk(clk), .load(load), .D(S[8]), .Q(T[8]));
    loadreg loadreg9(.clk(clk), .load(load), .D(S[9]), .Q(T[9]));
    
    assign Q[0] = (select & 0) | (!select & T[0]);
    assign Q[1] = (select & 0) | (!select & T[1]);
    assign Q[2] = (select & 0) | (!select & T[2]);
    assign Q[3] = (select & 0) | (!select & T[3]);
    assign Q[4] = (select & 0) | (!select & T[4]);
    assign Q[5] = (!select & 0) | (select & T[5]);
    assign Q[6] = (!select & 0) | (select & T[6]);
    assign Q[7] = (!select & 0) | (select & T[7]);
    assign Q[8] = (!select & 0) | (select & T[8]);
    assign Q[9] = (!select & 0) | (select & T[9]);
endmodule

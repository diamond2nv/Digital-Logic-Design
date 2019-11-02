`timescale 1ns / 1ps

module adder(
    input a,
    input b,
    input Cin,
    output S,
    output Cout
    );
    
    assign S = a ^ b ^ Cin;
    assign Cout = (a & b) | (b & Cin) | (a & Cin);

endmodule

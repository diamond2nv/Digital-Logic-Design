`timescale 1ns / 1ps

module adder1(
    input P,
    input C,
    output S,
    output Cout
    );
    
    assign S = P ^ C; 
    
endmodule

`timescale 1ns / 1ps

module adder(
    input P,
    input C,
    output S,
    output Cout
    );
    
    assign S = P ^ C; 
    
endmodule

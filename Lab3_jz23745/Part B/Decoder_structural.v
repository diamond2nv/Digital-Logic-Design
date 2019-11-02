`timescale 1ns / 1ps


module Decoder_structural(
    input e,
    input a,
    input b,
    input c,
    output d0,
    output d1,
    output d2,
    output d3,
    output d4,
    output d5,
    output d6,
    output d7
    );
    
    // Defining wires for not signals
    wire a_not, b_not, c_not;
    
    // Instantiating Not gates as per the schematic
    not n0 (a_not, a);
    not n1 (b_not, b);
    not n2 (c_not, c);
    
    // Instantiating And gates as per the schematic
    and g0 (d0, e, a_not, b_not, c_not);
    and g1 (d1, e, a_not, b_not, c);
    and g2 (d2, e, a_not, b, c_not);
    and g3 (d3, e, a_not, b, c);
    and g4 (d4, e, a, b_not, c_not);
    and g5 (d5, e, a, b_not, c);
    and g6 (d6, e, a, b, c_not);
    and g7 (d7, e, a, b, c);
    
endmodule

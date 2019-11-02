`timescale 1ns / 1ps

module Multiplexer_structural(
    input i0,
    input i1,
    input i2,
    input i3,
    input [1:0] s,
    output d
    );
    
    //Defining wires for not signals
    wire s0_not, s1_not;
    
    //Defining wires for and signals
    wire d0, d1, d2, d3;
    //Instantiating not gates as per the schematic
    not n0 (s0_not, s[0]);
    not n1 (s1_not, s[1]);
    
    //Instantiating And gates as per the schematic
    and g0 (d0, i0, s1_not, s0_not);
    and g1 (d1, i1, s1_not, s[0]);
    and g2 (d2, i2, s[1], s0_not);
    and g3 (d3, i3, s[1], s[0]);
    
    or o0 (d,d0,d1,d2,d3);
    
endmodule

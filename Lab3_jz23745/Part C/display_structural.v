`timescale 1ns / 1ps

module display_structural(
    input [3:0] SW,
    output [3:0] an,
    output a,
    output b,
    output c,
    output d,
    output e,
    output f,
    output g
    );
    
    //Initialize values - only an0 should be on
    assign an[0] = 1'b0;
    assign an[1] = 1'b1;
    assign an[2] = 1'b1;
    assign an[3] = 1'b1;
    
    //Defining wires for not signals
    wire SW3_not, SW2_not, SW1_not, SW0_not;
    
    //Defining wires for and signals
    wire d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24;
    
    //Instantiating not gates
    not n0 (SW3_not, SW[3]);
    not n1 (SW2_not, SW[2]);
    not n2 (SW1_not, SW[1]);
    not n3 (SW0_not, SW[0]);
    
    //Instantiating and/or gates
    //Segment a
    and g0 (d0, SW3_not, SW2_not, SW1_not, SW[0]);
    and g1 (d1, SW3_not, SW[2], SW1_not, SW0_not);
    and g2 (d2, SW[3], SW2_not, SW[1], SW[0]);
    and g3 (d3, SW[3], SW[2], SW1_not, SW[0]);
    or o1 (a, d0, d1, d2, d3);
    
    //Segment b
    and g4 (d4, SW[3], SW[1], SW[0]);
    and g5 (d5, SW[2], SW[1], SW0_not);
    and g6 (d6, SW[3], SW[2], SW0_not);
    and g7 (d7, SW3_not, SW[2], SW1_not, SW[0]);
    or o2 (b, d4, d5, d6, d7);
    
    //Segment c
    and g8 (d8, SW3_not, SW2_not, SW[1], SW0_not);
    and g9 (d9, SW[3], SW[2], SW[1]);
    and g10 (d10, SW[3], SW[2], SW0_not);
    or o3 (c, d8, d9, d10);
    
    //Segment d
    and g11 (d11, SW3_not, SW[2], SW1_not, SW0_not);
    and g12 (d12, SW3_not, SW2_not, SW1_not, SW[0]);
    and g13 (d13, SW[2], SW[1], SW[0]);
    and g14 (d14, SW[3], SW2_not, SW[1], SW0_not);
    or o4 (d, d11, d12, d13, d14);
    
    //Segment e
    and g15 (d15, SW3_not, SW[0]);
    and g16 (d16, SW3_not, SW[2], SW1_not);
    and g17 (d17, SW2_not, SW1_not, SW[0]);
    or o5 (e, d15, d16, d17);
    
    //Segment f
    and g18 (d18, SW3_not, SW2_not, SW[0]);
    and g19 (d19, SW3_not, SW[1], SW[0]);
    and g20 (d20, SW3_not, SW2_not, SW[1]);
    and g21 (d21, SW[3], SW[2], SW1_not, SW[0]);
    or o6 (f, d18, d19, d20, d21);
    
    //Segment g
    and g22 (d22, SW[3], SW[2], SW1_not, SW0_not);
    and g23 (d23, SW3_not, SW[2], SW[1], SW[0]);
    and g24 (d24, SW3_not, SW2_not, SW1_not);
    or o7 (g, d22, d23, d24);
    
endmodule

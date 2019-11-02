`timescale 1ns / 1ps


module Multiplexer_behavioral(
    input i0,
    input i1,
    input i2,
    input i3,
    input [1:0] s,
    output reg d
    );
    
    always @(i0,i1,i2,i3,s)
    begin
    
    d = 1'b0;
    case (s)
        0 : d = i0;
        1 : d = i1;
        2 : d = i2;
        3 : d = i3;
        default : d = 1'b0;
    endcase
    end
endmodule

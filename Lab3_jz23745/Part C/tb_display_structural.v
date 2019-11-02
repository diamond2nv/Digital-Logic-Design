`timescale 1ns / 1ps


module tb_display_structural;
    //Inputs to be defined as registers
    reg [3:0] SW;
    
    //Outputs to be defined as wires
    wire [3:0] an;
    wire a;
    wire b;
    wire c;
    wire d;
    wire e;
    wire f;
    wire g;
    
    display_structural display(
        .SW(SW),
        .an(an),
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .e(e),
        .f(f),
        .g(g)
    );
    
    initial
        begin
        
            SW = 4'b0000;
            
            #50;
            
            SW = 4'b0001;
            
            #50;
            
            SW = 4'b0010;
            
            #50;
            
            SW = 4'b0011;
            
            #50;
            
            SW = 4'b0100;
            
            #50;
            
            SW = 4'b0101;
            
            #50;
            
            SW = 4'b0110;
            
            #50;
            
            SW = 4'b0111;
            
            #50;
            
            SW = 4'b1000;
            
            #50;
            
            SW = 4'b1001;
            
            #50;
            
            SW = 4'b1010;
            
            #50;
            
            SW = 4'b1011;
            
            #50;
            
            SW = 4'b1100;
            
            #50;
            
            SW = 4'b1101;
            
            #50;
            
            SW = 4'b1110;
            
            #50;
            
            SW = 4'b1111;
        end
endmodule

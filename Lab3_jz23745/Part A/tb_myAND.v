`timescale 1ns / 1ps

module tb_myAND;
    //Inputs to be defined as registers
    reg a;
    reg b;
    
    //Outputs to be defined as wires
    wire out;
    
    myAND and_gate0(
        .a(a),
        .b(b),
        .out(out)
    );
    
    initial
        begin
            
            //Stimulus - All input combinations followed by some wait time to observe the o/p
            a = 1'b0;
            b = 1'b0;
            
            #50;
            
            a = 1'b0;
            b = 1'b1;
            
            #50;
            
            a = 1'b1;
            b = 1'b0;
            
            #50;
            
            a = 1'b1;
            b = 1'b1;
            
        end
endmodule

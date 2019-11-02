`timescale 1ns / 1ps

module tb_Multiplexer_behavioral;
    //Inputs to be defined as registers
    reg i0;
    reg i1;
    reg i2;
    reg i3;
    reg [1:0] s;
        
    //Outputs to be defined as wires
    wire d;
    
    //Instantiate the unit under test
    Multiplexer_behavioral uut (
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .i3(i3),
        .s(s),
        .d(d)
    );
    
    initial begin
        //Initialize inputs
        i3 = 0;
        i2 = 0;
        i1 = 0;
        i0 = 0;
        s = 0;
       
       //Wait 50ns for global reset to finish
       #50;
       
       // Stimulus - All input combinations followed by some wait time to observe the o/p    
       i3 = 0;
       i2 = 0;
       i1 = 0;
       i0 = 1;
       s = 0;
       #50;
       $display("TC10");
       if ( d != 1'b1 ) $display ("Result is wrong");
       
       i3 = 0;
       i2 = 0;
       i1 = 1;
       i0 = 0;
       s = 1;
       #50;
       $display("TC21");
       if ( d != 1'b1 ) $display ("Result is wrong");
       
       i3 = 0;
       i2 = 1;
       i1 = 0;
       i0 = 0;
       s = 2;
       #50;
       $display("TC42");
       if ( d != 1'b1 ) $display ("Result is wrong");
       
       i3 = 1;
       i2 = 0;
       i1 = 0;
       i0 = 0;
       s = 3;
       #50;
       $display("TC83");
       if ( d != 1'b1 ) $display ("Result is wrong");
       
    end
endmodule

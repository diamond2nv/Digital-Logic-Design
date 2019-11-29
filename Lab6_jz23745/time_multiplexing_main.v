`timescale 1ns / 1ps

module time_multiplexing_main(
    input clk,
    input [15:0] sw,
    output [3:0] an,
    output [6:0] sseg,
    output dp
    );
    
    wire [6:0] in0, in1, in2, in3;
    wire slow_clk;
    
    //Module instantiation of hexto7segment decoder
    hex2seg c1 (.SW(sw[3:0]), .seg(in0));
    hex2seg c2 (.SW(sw[7:4]), .seg(in1));
    hex2seg c3 (.SW(sw[11:8]), .seg(in2));
    hex2seg c4 (.SW(sw[15:12]), .seg(in3));
    
    //Module instation of the clock divider
    clkdiv c5 (.clk(clk), .clk_out(slow_clk));
    
    //Module instantiation of the mux
    time_mux_state_machine c6(
        .clk(slow_clk),
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .an(an),
        .sseg(sseg),
        .dp(dp));
    
endmodule

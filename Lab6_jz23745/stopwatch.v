`timescale 1ns / 1ps

module stopwatch(
    input clk,
    input reset,
    input start_stop,
    input [3:0] left,
    input [3:0] right,
    input [1:0] select,
    output [3:0] an,
    output [6:0] sseg,
    output dp
    );
    
    //wire output from datapath
    wire [15:0] count;
    //wire user inputs
    wire resetreg;
    wire start_stopreg;
    reg [3:0] tens;
    reg [3:0] ones;
    reg [1:0] mode;
    wire [15:0] total;
    
    //latch input values
    loadinputreg lir1(.clk(clk), .load(1), .D(reset), .Q(resetreg));
    loadinputreg lir2(.clk(clk), .load(1), .D(start_stop), .Q(start_stopreg));
    
    controller_datapath c1(.clk(clk), .reset(resetreg), .start_stop(start_stopreg), .mode(mode), .tens(tens), .ones(ones), .count(count));
    
    time_multiplexing_main t1(.clk(clk), .sw(total), .an(an), .sseg(sseg), .dp(dp));
    
    assign total[3:0] =  count%10;
    assign total[7:4] = ((count/10)%10);
    assign total[11:8] = ((count/100)%10);
    assign total[15:12] = ((count/1000)%10);
    
    always @(*) begin
        if(left > 9) tens = 9;
        else tens = left;
        
        if(right > 9) ones = 9;
        else ones = right;
        
        mode = select;
    end
endmodule

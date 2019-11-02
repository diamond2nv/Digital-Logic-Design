`timescale 1ns / 1ps

module tb_call_system_dataflow;
    
    reg clk = 0;
    reg call = 0;
    reg cancel = 0;
    wire light_state;
    
    call_system_dataflow uut(
        .clk(clk),
        .call(call),
        .cancel(cancel),
        .light_state(light_state)
    );
    
    //simulate clock signal for FSM
    always #5 clk = ~clk;
    
    initial begin
        #20 call = 0; cancel = 0;
        #20 call = 1; cancel = 0;
        #20 call = 0; cancel = 1;
        #20 call = 1; cancel = 1;
        #20 call = 0; cancel = 0;
        #20 call = 1; cancel = 0;
        #20 cancel = 1;
        #20 cancel = 0;
        #20 call = 0; cancel = 1;
        #20 call = 0; cancel = 0;
        
    end
endmodule

`timescale 1ns / 1ps

module call_system_dataflow(
    input clk,
    input call,
    input cancel,
    output reg light_state
    );
    
    wire next_state; //holds next state
    initial light_state = 0;
    
    assign next_state = call | (~cancel&light_state);
    
    always @(posedge clk) begin
            light_state <= next_state;
    end 
endmodule
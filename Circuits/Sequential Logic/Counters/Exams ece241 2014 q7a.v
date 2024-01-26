module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); //
    reg[3:0] value;
    assign Q = value;
    
    always_ff @(posedge clk) begin
        if(reset || (value === 12 && enable)) begin
            value <= 1;
        end else if(enable) begin
            value <= value + 1;
        end
    end

    count4 the_counter (clk, c_enable, c_load, c_d);
    assign c_enable = enable;
    assign c_load = reset || (value === 12 && enable);
    assign c_d = c_load ? 1 : 0;
    
endmodule

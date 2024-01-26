module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);

    reg[3:0] value;
    assign q = value;

    always_ff @(posedge clk) begin
        if(reset || value === 9) begin
            value <= 0;
        end else begin
            value <= value + 1;
        end
    end
endmodule

module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);

reg[31:0] previous;

always_ff@(posedge clk) begin
    if(reset) begin
        out <= 0;
        previous <= in;
    end
    else begin
        out = out | (previous & ~in);
        previous = in;
    end
end

endmodule

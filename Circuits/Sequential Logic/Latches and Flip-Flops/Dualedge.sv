module top_module (
    input clk,
    input d,
    output q
);

wire rise_q, fall_q;

always_comb begin
    case(clk) 
        1 : q = rise_q;
        0 : q = fall_q;
    endcase
end

always_ff@(posedge clk) begin
    rise_q <= d;
end

always_ff@(negedge clk) begin
    fall_q <= d;
end

endmodule

module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
    MUXDFF(.clk(KEY[0]), .w(KEY[3]), .R(SW[i]), .E(KEY[1]), .L(KEY[2]), .Q(LEDR[3]));
    genvar i;
    generate
        for(i = 0; i < 3; i++) begin: multi_circuit
            MUXDFF(.clk(KEY[0]), .w(LEDR[i + 1]), .R(SW[i]), .E(KEY[1]), .L(KEY[2]), .Q(LEDR[i]));
        end
    endgenerate
endmodule


module MUXDFF (input clk, input w, R, E, L, output reg Q);
    wire mux1, mux2;
    assign mux1 = E ? w : Q;
    assign mux2 = L ? R : mux1;
    
    always_ff @(posedge clk) begin
        Q <= mux2;
    end
endmodule
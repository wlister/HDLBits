module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q
    
	reg Q0, Q1, Q2;
    wire in_Q0, in_Q1, in_Q2, L, clk;
    
    assign clk = KEY[0];
    assign L = KEY[1];
    assign LEDR = {Q2, Q1, Q0};
    
    assign in_Q0 = L ? SW[0] : Q2;
    assign in_Q1 = L ? SW[1] : Q0;
    assign in_Q2 = L ? SW[2] : (Q1 ^ Q2);
    
    always_ff @(posedge clk) begin
        Q0 <= in_Q0;
        Q1 <= in_Q1;
        Q2 <= in_Q2;
    end

endmodule
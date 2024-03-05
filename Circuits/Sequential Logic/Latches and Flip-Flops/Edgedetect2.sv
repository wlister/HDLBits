module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    
    reg[7:0] prev;
    
    always_ff@(posedge clk) begin
        /* 
        	XOR tells us if there is a difference between two bits, which is exactly what we want 
        */
        anyedge = in ^ prev;
        prev = in;
    end
endmodule
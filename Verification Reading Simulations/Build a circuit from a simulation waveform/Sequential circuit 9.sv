module top_module (
    input clk,
    input a,
    output [3:0] q );
    
    reg [3:0] to_q;
    assign q = to_q;
    
    always_ff@(posedge clk) begin
        if(a === 1'b1) to_q <= 4'd4;
        else begin
            if(to_q >= 4'd6) to_q = 4'd0;
            else to_q = to_q + 4'd1;
        end
    end
endmodule

module top_module(
    input clk,
    input load,
    input [511:0] data,
    output reg [511:0] q ); 
    
    always_ff@(posedge clk) begin
        if(load) q <= data;
        else begin
            for(int i = 1; i < 511; i++) begin
                q[i] <= q[i-1] ^ q[i+1];
            end
            q[0] <= 0 ^ q[1]; //boundaries are 0
            q[511] <= 0 ^ q[510]; //boundaries are 0
        end
    end

endmodule

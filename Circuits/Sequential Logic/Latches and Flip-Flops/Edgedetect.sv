module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    
    reg[7:0] prev;
    
    always_ff@(posedge clk) begin
        
        //case: turns from 0 to 1 -> needs to be 1
        //case: turns from 1 to 1 -> needs to be 0
        //case: turns from 1 to 0 -> needs to be 0
        for(int i = 0; i < 8; i++) begin
            if(prev[i] === 1'b0 && in[i] === 1'b1) begin
                pedge[i] <= 1'b1;
            end else begin
                pedge[i] <= 1'b0;
            end 
        end
        
        prev = in;
    end
endmodule
module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
	
    reg[3:0] value;
    assign q = value;
    
    always_ff @(posedge clk) begin
        /*
            We should only reset back to 0 if we are at 9 
            AND slowena is enabled (we aren't paused)
        */
        if(reset || (value === 9 && slowena)) begin
            value <= 0;
        end
        else if(slowena) begin
            value <= value + 1;
        end
    end
endmodule

module top_module(
	input clk, 
	input load, 
	input [9:0] data, 
	output tc
);
    reg[9:0] number;

    assign tc = (number === 10'd0) ? 1'b1 : 1'b0;
    
    always_ff @(posedge clk) begin
        if(load) begin
            number <= data;
        end else begin
            if(number > 10'd0) number <= number - 1;
        end
    end

endmodule
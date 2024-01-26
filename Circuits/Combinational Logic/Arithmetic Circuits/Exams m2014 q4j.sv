module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    
    wire [3:0] carry_out;
    
    full_adder(.a(x[3]), .b(y[3]), .cin(carry_out[2]), .cout(carry_out[3]), .sum(sum[3]));
    full_adder(.a(x[0]), .b(y[0]), .cin(1'b0), .cout(carry_out[0]), .sum(sum[0]));
    
    assign sum[4] = carry_out[3];
    
	genvar i;
    generate
        for(i = 1; i < 3; i++) begin: sum_loop
            full_adder(.a(x[i]), .b(y[i]), .cin(carry_out[i-1]), .cout(carry_out[i]), .sum(sum[i]));
        end
    endgenerate
endmodule

module full_adder( 
    input a, b, cin,
    output cout, sum );
	assign sum = a ^ b ^ cin;
    assign cout = (cin && b) || (b && a) || (a && cin);
endmodule
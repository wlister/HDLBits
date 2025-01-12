module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );
    
    wire [98:0] carry_out;
    
    full_adder(.a(a[99]), .b(b[99]), .cin(carry_out[98]), .cout(cout), .sum(sum[99]));
    full_adder(.a(a[0]), .b(b[0]), .cin(cin), .cout(carry_out[0]), .sum(sum[0]));
    
	genvar i;
    generate
        for(i = 1; i < 99; i++) begin: adding_loop
            full_adder(.a(a[i]), .b(b[i]), .cin(carry_out[i-1]), .cout(carry_out[i]), .sum(sum[i]));
        end
    endgenerate
endmodule

module full_adder( 
    input a, b, cin,
    output cout, sum );
	assign sum = a ^ b ^ cin;
    assign cout = (cin && b) || (b && a) || (a && cin);
endmodule
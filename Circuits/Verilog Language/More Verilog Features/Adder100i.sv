module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    
    wire[100:0] carrys;
    assign cout = carrys[100:1];
    
    full_adder first(.a(a[0]), .b(b[0]), .cin(cin), .out(sum[0]), .cout(carrys[1]));
    genvar i;
    generate
        for(i = 1; i < 100; i++) begin: adders
            full_adder ith(.a(a[i]), .b(b[i]), .cin(carrys[i]), .out(sum[i]), .cout(carrys[i+1]));
        end
    endgenerate
endmodule

module full_adder(input a, input b, input cin, output out, output cout);
    assign cout = (a&b) | (cin&a) | (cin&b);
    assign out = a ^ b ^ cin;
endmodule

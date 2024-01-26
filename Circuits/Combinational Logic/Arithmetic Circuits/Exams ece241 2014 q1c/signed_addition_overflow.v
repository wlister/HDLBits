module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); 
    wire [7:0] carry_out;
    
    assign overflow = (s[7] && ~a[7] && ~b[7]) || (~s[7] && a[7] && b[7]);
  	assign s = a + b;
endmodule

//could also use generate, but lets not do that...
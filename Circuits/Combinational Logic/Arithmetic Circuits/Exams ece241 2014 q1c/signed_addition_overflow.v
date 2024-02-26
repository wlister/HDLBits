module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); //
    assign s = a + b;
    assign overflow = (~a[7] & ~b[7] & s[7]) | (a[7] & b[7] & ~s[7]);
    /* 
     * In this case for 2s complement, will overflow if:
     * a[7] and b[7] are 0 (both positive numbers), but sum[7] is 1 (there is a carry in). This is overflow.
     * a[7] and b[7] are 1 (both negative numbers), but sum[7] is 0 (there is a carry in). This is underflow.
     */
endmodule
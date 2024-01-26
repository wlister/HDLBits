//original 
module top_module (
    input sel,
    input [7:0] a,
    input [7:0] b,
    output out  );

    assign out = (~sel & a) | (sel & b); //bitwise operators & and | do not work on vectors

endmodule


//my fixed
module top_module (
    input sel,
    input [7:0] a,
    input [7:0] b,
    output [7:0] out  );

    assign out = sel ? a : b;


endmodule

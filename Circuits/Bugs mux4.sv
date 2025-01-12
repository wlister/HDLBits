//original
module top_module (
    input [1:0] sel,
    input [7:0] a,
    input [7:0] b,
    input [7:0] c,
    input [7:0] d,
    output [7:0] out  ); //

    wire mux0, mux1; //need to name these differently from the mux module names
    mux2 mux0 ( sel[0],    a,    b,  );
    mux2 mux1 ( sel[1],    c,    d, mux1 ); //this should have select signal at lowest bit 
    //since this mux is not the one connecting the two together (the next one is)
    mux2 mux2 ( sel[1], mux0, mux1,  out ); //this mux has select signal at bit index 1 

endmodule


//My solution
module top_module (
    input [1:0] sel,
    input [7:0] a,
    input [7:0] b,
    input [7:0] c,
    input [7:0] d,
    output [7:0] out  ); //

    wire [7:0] mux0wire, mux1wire;
    mux2 mux0 ( sel[0],    a,    b, mux0wire );
    mux2 mux1 ( sel[0],    c,    d, mux1wire );
    mux2 mux2 ( sel[1], mux0wire, mux1wire,  out );

endmodule
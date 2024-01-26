module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );
   
	
    assign out = in[4 * sel+:4];
    //bit slicing, will take value of next 4 bits calculated from 4 * sel
    
endmodule

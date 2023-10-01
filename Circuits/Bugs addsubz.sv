//original
module top_module ( 
    input do_sub,
    input [7:0] a,
    input [7:0] b,
    output reg [7:0] out,
    output reg result_is_zero
);//

    always @(*) begin
        case (do_sub)
          0: out = a+b;
          1: out = a-b;
        endcase

        if (~out) //inferred latch here. Need to cover all cases
        //negating out will negate all the bits in the vector. This may seem
        //fine as it will run if out was 8'b00000000 and it turns into 8'b11111111
        //However, an if statement will execute if the input is anything but zero, so
        //any number that is not 8'b1111111 negated will cause the inside of this if statement to execute
            result_is_zero = 1;
    end

endmodule

//My solution
// synthesis verilog_input_version verilog_2001
module top_module ( 
    input do_sub,
    input [7:0] a,
    input [7:0] b,
    output reg [7:0] out,
    output reg result_is_zero
);//

    always @(*) begin
        case (do_sub)
          0: out = a+b;
          1: out = a-b;
        endcase

        if (out === 8'd0) result_is_zero = 1;
        else result_is_zero = 0;
    end

endmodule
module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); 
    
    assign walk_left = ~state; //left is 1'b0 
    assign walk_right = state; //right is 1'b1
    
    `define LEFT 	1'b0
    `define RIGHT 	1'b1
    reg state, next_state;
    
    always_comb begin
        case({bump_left, bump_right, state}) 
            3'b100 : next_state <= `RIGHT;
            3'b011 : next_state <= `LEFT;
            3'b110 : next_state <= `RIGHT;
            3'b111 : next_state <= `LEFT;
            default : next_state <= state;
        endcase
    end

    always @(posedge clk, posedge areset) begin
        if(areset) begin
            state <= `LEFT;
        end else begin
            state <= next_state;
        end
    end
endmodule

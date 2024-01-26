module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    
    `define WALK_LEFT 	2'b00
    `define WALK_RIGHT	2'b01
    `define FALL_LEFT	2'b10
    `define FALL_RIGHT	2'b11
    
    assign walk_left = (state == `WALK_LEFT);
    assign walk_right = (state == `WALK_RIGHT);
    
    reg [1:0] state, next_state;
    
    assign aaah = (state == `FALL_LEFT || state == `FALL_RIGHT) ? 1'b1 : 1'b0;
    
    always_comb begin
        casex({ground, bump_left, bump_right, state}) 
            5'b11000 : next_state <= `WALK_RIGHT;
            5'b10101 : next_state <= `WALK_LEFT;
            5'b11100 : next_state <= `WALK_RIGHT;
            5'b11101 : next_state <= `WALK_LEFT;
            5'b1??10 : next_state <= `WALK_LEFT;
            5'b1??11 : next_state <= `WALK_RIGHT;
            5'b0??00 : next_state <= `FALL_LEFT;
            5'b0??01 : next_state <= `FALL_RIGHT;
            default : next_state <= state;
        endcase
    end

    always @(posedge clk, posedge areset) begin
        if(areset) begin
            state <= `WALK_LEFT;
        end else begin
            state <= next_state;
        end
    end
endmodule

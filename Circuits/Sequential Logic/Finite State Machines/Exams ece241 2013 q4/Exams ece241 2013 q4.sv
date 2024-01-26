module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    `define TOP				3'b000 //water has passed all 3 sensors
    `define TOP_TO_S1S2		3'b001 //water has dropped from all 3 to 2 sensors
    `define S1_TO_S1S2		3'b010 //water has increased from 1 to 2 sensors
    `define BOT_TO_S1		3'b011 //water has increased from 0 to 1 sensor
    `define BOT				3'b100 //water has dropped to 0 sensors
    `define S1S2_TO_S1		3'b101 //water has dropped from 2 to 1 sensor
    
    reg[2:0] state, next_state;
    always_comb begin
        casex(state) 
            `TOP : begin
                if(s === 3'b011) begin
                    next_state = `TOP_TO_S1S2;
                end else begin
                    next_state = state;
                end
            end
            
            `TOP_TO_S1S2 : begin
                if(s === 3'b111) begin
                    next_state = `TOP;
                end else if(s === 3'b001) begin
                    next_state = `S1S2_TO_S1;
                end else begin
                    next_state = state;
                end
            end
            
            `S1_TO_S1S2 : begin
                if(s === 3'b111) begin
                    next_state = `TOP;
                end else if(s === 3'b001) begin
                    next_state = `S1S2_TO_S1;
                end else begin
                    next_state = state;
                end
            end
            
            `BOT_TO_S1 : begin
                if(s === 3'b000) begin
                    next_state = `BOT;
                end else if(s === 3'b011) begin
                    next_state = `S1_TO_S1S2;
                end else begin
                    next_state = state;
                end
            end
            
            `BOT : begin
                if(s === 3'b001) begin
                    next_state = `BOT_TO_S1;
                end else begin
                    next_state = state;
                end
            end
            
            `S1S2_TO_S1 : begin
                if(s === 3'b011) begin
                    next_state = `S1_TO_S1S2;
                end else if(s === 3'b000) begin
                    next_state = `BOT;
                end else begin
                    next_state = state;
                end
            end
            
            default : next_state = state;
        endcase
        
        case(state)
			`TOP : begin
                fr3 = 1'b0;
                fr2 = 1'b0;
                fr1 = 1'b0;
                dfr = 1'b0;
            end
			`TOP_TO_S1S2 : begin
                fr3 = 1'b0;
                fr2 = 1'b0;
                fr1 = 1'b1;
                dfr = 1'b1;
            end	
			`S1_TO_S1S2 : begin
                fr3 = 1'b0;
                fr2 = 1'b0;
                fr1 = 1'b1;
                dfr = 1'b0;
            end	
			`BOT_TO_S1 : begin
                fr3 = 1'b0;
                fr2 = 1'b1;
                fr1 = 1'b1;
                dfr = 1'b0;
            end	
			`BOT : begin
                fr3 = 1'b1;
                fr2 = 1'b1;
                fr1 = 1'b1;
                dfr = 1'b1;
            end	
			`S1S2_TO_S1 : begin
                fr3 = 1'b0;
                fr2 = 1'b1;
                fr1 = 1'b1;
                dfr = 1'b1;
            end
            default : begin
                fr3 = 1'b0;
                fr2 = 1'b0;
                fr1 = 1'b0;
                dfr = 1'b0;
            end
        endcase
    end
            
    always_ff @(posedge clk) begin
        if(reset) begin
            state <= `BOT;
        end else begin
            state <= next_state;
        end
    end

endmodule

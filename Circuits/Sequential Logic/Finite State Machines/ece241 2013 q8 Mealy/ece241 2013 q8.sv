module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
	
    enum int {
        idle = 0,
        state1 = 1,
        state2 = 2} state;
    
    always_comb begin
        case({state, x}) 
            {state2, 1'b1} : begin
               	z = 1; 
            end
            default : begin
                z = 0;
            end
        endcase
    end
    
    always_ff@(posedge clk, negedge aresetn) begin
        if(~aresetn) begin
            state <= idle;
        end else begin
            case(state)
                idle : begin
                    if(x) state <= state1;
                end
                
                state1 : begin
                    if(!x) state <= state2;
                end
                
                state2: begin
                    if(x) state <= state1;
                    else state <= idle;
                end
            endcase            
        end        
    end
endmodule

 module motorTest(clk, motor1, motor2,motor01,motor02);
 
 input clk;
 output reg motor1,motor2,motor01,motor02 = 0;
 
 
 reg[31:0] count;
parameter D = 32'd25000000;
 
 always @(posedge clk) begin
 
 
 count <= count + 32'd1;
	
	
	if(count >=(D-1)) begin
		count <=32'd0;
		//forward
		motor1 = 1;
		motor2 = 0;
		
		//forward
		motor01 = 1;
		motor02 = 0;
		
		
	
		
		end
 
 end
 
 
endmodule
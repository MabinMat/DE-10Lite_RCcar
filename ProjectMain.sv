 module motorTest(clk, motor1, motor2);
 
 input clk;
 output reg motor1,motor2 = 0;
 
 
 reg[31:0] count;
parameter D = 32'd25000000;
 
 always @(posedge clk) begin
 
 
 count <= count + 32'd1;
	
	
	if(count >=(D-1)) begin
		count <=32'd0;
 
		
 
 end
 
 
endmodule
module IndicatorTest(clk,leftInd,rightInd,btnLeft,btnRight);

output reg leftInd,rightInd =0;
input btnLeft,btnRight,clk;


reg[31:0] count;
parameter D = 32'd25000000;

always @(posedge clk) begin

 count <= count + 32'd1;
	
	
	if (btnLeft==1) begin
		
	count <= count + 32'd1;
	
		if(count >=(D-1)) begin
		count <=32'd0;
		
		if(leftInd==0)
				leftInd=1;
		else 
				leftInd=0;

	end
	
	
	end
	
	
	if (btnRight==1) begin
		
	count <= count + 32'd1;
	
		if(count >=(D-1)) begin
		count <=32'd0;
		
		if(rightInd==0)
				rightInd=1;
		else 
				rightInd=0;

	end
	
	
	end

end


endmodule
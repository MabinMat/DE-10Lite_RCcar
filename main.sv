module main(clk,btnLeft,btnRight,btnUp,btnDown,leftInd,rightInd,breaklight1,breaklight2,leftMotor1,leftMotor2,rightMotor1,rightMotor2);

input clk,btnLeft,btnRight,btnUp,btnDown;
output reg leftInd,rightInd,leftMotor1,leftMotor2,rightMotor1,rightMotor2,breaklight1,breaklight2 = 0;



//leftInd = 0;
//rightInd = 0;
//
//leftMotor = 0;
//rightMotor = 0;

reg[31:0] count;
parameter D = 32'd25000000;


always @(posedge clk) begin


	if(btnUp == 1) begin
		leftInd = 0;
		rightInd = 0;
		breaklight1 = 0;
		breaklight2 = 0;
		
		leftMotor1 = 1;
		leftMotor2 = 0;
		rightMotor1 = 0;
		rightMotor2 = 1;
	end
	
	else if(btnDown == 1) begin
		leftInd = 0;
		rightInd = 0;
		breaklight1 = 0;
		breaklight2 = 0;
		
		leftMotor1 = 0;
		leftMotor2 = 1;
		rightMotor1 = 1;
		rightMotor2 = 0;

	end
	
	else if (btnLeft == 1) begin
		count <=32'd0;
		count <= count + 32'd1;

		breaklight1 = 0;
		breaklight2 = 0;
		
		leftMotor1 = 1;
		leftMotor2 = 0;
		rightMotor1 = 0;
		rightMotor2 = 0;
		
		if(count >=(D-1)) begin
			count <=32'd0;
			
			if(leftInd==0)
				leftInd=1;
			else if (leftInd==1) 
				leftInd=0;
			
		end
		
		
	end
	
	else if(btnRight == 1) begin
		count <=32'd0;		
		count <= count + 32'd1;
		
		rightMotor1 = 0;
		rightMotor2 = 1;
		leftMotor1 = 0;
		leftMotor2 = 0;
		breaklight1 = 0;
		breaklight2 = 0;
		
	
		
		if(count >=(D-1)) begin
			count <=32'd0;
			
			if(rightInd==0)
				rightInd=1;
			else if(rightInd==1) 
				rightInd=0;
			
		end
		
		end
		
	else begin
	leftMotor1  = 0;
	leftMotor2  = 0;
	rightMotor1 = 0;
	rightMotor2 = 0;
	breaklight1 = 1;
	breaklight2 = 1;
	leftInd = 0;
	rightInd = 0;
	end

end
endmodule

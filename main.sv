module main(clk,btnLeft,btnRight,btnUp,btnDown,leftInd,rightInd,breaklight1,breaklight2,leftMotor1,leftMotor2,rightMotor1,rightMotor2);

input clk,btnLeft,btnRight,btnUp,btnDown;
output reg leftInd,rightInd,leftMotor1,leftMotor2,rightMotor1,rightMotor2,breaklight1,breaklight2 = 0;

//headlights connected start to 5V as they are always on

//leftInd = 0;
//rightInd = 0;
//
//leftMotor = 0;
//rightMotor = 0;

//variable for clock 
reg[31:0] count;
parameter D = 32'd25000000;


always @(posedge clk) begin

	//moves vehicle forward
	if(btnUp == 1) begin
		//set indicators & breaklights to OFF
		leftInd = 0;
		rightInd = 0;
		breaklight1 = 0;
		breaklight2 = 0;
		
		//Provide the needed polarity for the H-bridge 
			//for the motor to move forward
		leftMotor1 = 1;
		leftMotor2 = 0;
		rightMotor1 = 0;
		rightMotor2 = 1;
	end
	
	//moves vehicle backward
	else if(btnDown == 1) begin
	//set indicators & breaklights to OFF
		leftInd = 0;
		rightInd = 0;
		breaklight1 = 0;
		breaklight2 = 0;
		
		//Provide the needed polarity for the H-bridge 
			//for the motor to move backward
		leftMotor1 = 0;
		leftMotor2 = 1;
		rightMotor1 = 1;
		rightMotor2 = 0;

	end
	
	//Turns vehicle Left
	else if (btnLeft == 1) begin
		//rest timer variable
		count <=32'd0;
		count <= count + 32'd1;
		
		//set breaklights to OFF
		breaklight1 = 0;
		breaklight2 = 0;
		
		//Provide the needed polarity for the H-bridge 
		//for the vehicle to move left
		leftMotor1 = 1;
		leftMotor2 = 0;
		rightMotor1 = 0;
		rightMotor2 = 0;
		
		//blinked LED every half a second
		if(count >=(D-1)) begin
			count <=32'd0;
			
			if(leftInd==0)
				leftInd=1;
			else if (leftInd==1) 
				leftInd=0;
			
		end
		
		
	end
	
	//Turns vehicle right
	else if(btnRight == 1) begin
		//rest timer variable
		count <=32'd0;		
		count <= count + 32'd1;
		
		//set breaklights to OFF
		breaklight1 = 0;
		breaklight2 = 0;
		
		//Provide the needed polarity for the H-bridge 
		//for the vehicle to move right		
		rightMotor1 = 0;
		rightMotor2 = 1;
		leftMotor1 = 0;
		leftMotor2 = 0;
		
	
		//blinked LED every half a second
		if(count >=(D-1)) begin
			count <=32'd0;
			
			if(rightInd==0)
				rightInd=1;
			else if(rightInd==1) 
				rightInd=0;
			
		end
		
		end
		
	//vehicle is Idle 
	else begin
		//turn off all motors
		leftMotor1  = 0;
		leftMotor2  = 0;
		rightMotor1 = 0;
		rightMotor2 = 0;
		//turn break lights ON
		breaklight1 = 1;
		breaklight2 = 1;
		//turn indicators ON
		leftInd = 0;
		rightInd = 0;
	end

end
endmodule

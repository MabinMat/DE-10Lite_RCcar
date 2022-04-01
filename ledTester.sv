module ledTester(clk,led, btn);

input clk;
input btn;

output reg led = 0;
reg state = 0;

reg[31:0] count;
parameter D = 32'd25000000;

always @(posedge clk) begin

//	count <= count + 32'd1;
//	
//	
//	if(count >=(D-1)) begin
//		count <=32'd0;
//		
//		if(led==0)
//			led=1;
//		else if(led==1)
//			led=0;
//		
//		end

	if(btn==1) begin
		//state = ~state;
		led =1;
	end
	
	else
		led = 0;


end


endmodule
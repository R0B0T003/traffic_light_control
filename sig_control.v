/*

module sig_control(highway_light, country_light, x, clock, clear);

input x, clock, clear;
output reg [2:0] country_light, highway_light;

parameter GR = 3'b000, YR = 3'b001, RR = 3'b010, RG = 3'b011, RY = 3'b100;
reg [2:0] lightcombo_state, next_state;


always @(posedge clock)
begin
	if (clear) lightcombo_state = GR;
	else lightcombo_state <= next_state;
end

always @ (lightcombo_state)
 begin
	case(lightcombo_state)
		GR: begin
				highway_light <= 3'b100;
				country_light <= 3'b001;
			 end
		YR: begin
				highway_light <= 3'b010;
				country_light <= 3'b001;
			 end
		RR: begin
				highway_light <= 3'b001;
				country_light <= 3'b001;
			 end
		RG: begin
				highway_light <= 3'b001;
				country_light <= 3'b100;
			 end
		RY: begin
				highway_light <= 3'b001;
				country_light <= 3'b010;
			 end
	endcase
 end
always @(lightcombo_state, x)
	begin
		case(lightcombo_state)
			GR: begin
					if(x)
						next_state = YR;
					else
						next_state = GR;
				 end
			YR: begin
					repeat (10) @(posedge clock);
					next_state <= RR;
				 end
			RR: begin
					repeat (10) @(posedge clock);     
					next_state = RG;
				 end
			RG: begin
					if(x) next_state = RG;
					else next_state = RY;
				 end
			RY: begin
					repeat (10) @(posedge clock);
					next_state = GR;
				 end
		endcase
	end

endmodule 
*/
/*
`define TRUE 1'b1 
`define FALSE 1'b0 
//Delays 
`define Y2RDELAY 3 //Yellow to red delay 
`define R2GDELAY 2 //Red to green delay 
module sig_control 
 (hwy, cntry, X, clock, clear); 
//I/O ports 
output [1:0] hwy, cntry; 
 //2-bit output for 3 states of signal 
 //GREEN, YELLOW, RED; 
reg [1:0] hwy, cntry; 
 //declared output signals are registers 
input X; 
 //if TRUE, indicates that there is car on 
 //the country road, otherwise FALSE 
input clock, clear; 
parameter RED = 2'b00, 
 YELLOW = 2'b01, 
 GREEN = 2'b10; 
//State definition HWY CNTRY 
parameter S0 = {GREEN, RED}, //GREEN RED 
 S1 = {YELLOW, RED}, //YELLOW RED 
 S2 = {RED, RED}, //RED RED 
 S3 = {RED, GREEN}, //RED GREEN 
 S4 = {RED, YELLOW}; //RED YELLOW 
//Internal state variables 
reg [3:0] state; 
reg [3:0] next_state; 
//state changes only at positive edge of clock 
always @(posedge clock) 
 if (clear) 
 state <= S0; //Controller starts in S0 state 
 else 
 state <= next_state; //State change 
//Compute values of main signal and country signal 
always @(state) 
begin 
 hwy = GREEN; //Default Light Assignment for Highway light 
 cntry = RED; //Default Light Assignment for Country light 
 case(state) 
 S0: ; // No change, use default 
 S1: hwy = YELLOW; 
 S2: hwy = RED; 
 S3: begin 
 hwy = RED; 
 cntry = GREEN; 
 end 
 S4: begin 
 hwy = RED; 
 cntry = YELLOW; 
 end 
 endcase 
end 
//State machine using case statements 
always @(state or X) 
begin 
 case (state) 
 S0: if(X) 
 next_state = S1; 
 else 
 next_state = S0; 
 S1: begin //delay some positive edges of clock 
 @(posedge clock) ; 
 next_state = S2; 
 end 
 S2: begin //delay some positive edges of clock 
 @(posedge clock); 
 next_state = S3; 
 end 
 S3: if(X) 
 next_state = S3; 
 else 
 next_state = S4; 
 S4: begin //delay some positive edges of clock 
 @(posedge clock) ; 
 next_state = S0; 
 end 
 default: next_state = S0; 
 endcase 
end 
endmodule
*/ 

module sig_control (hwy, crd, x, clock, clear);

input x, clock, clear;
output hwy, crd;
reg [2:0] hwy, crd;
reg [3:0] state;
reg [3:0] next_state;
parameter RED = 2'b00, YELLOW = 2'b01, GREEN = 2'b10; 
parameter S0 = {GREEN, RED}, //GREEN RED 
			 S1 = {YELLOW, RED}, //YELLOW RED 
			 S2 = {RED, RED}, //RED RED 
			 S3 = {RED, GREEN}, //RED GREEN 
			 S4 = {RED, YELLOW};

always @(posedge clock)
begin 
	if (clear) state = S0;
	
	state <= #5 next_state;
end
always @(state, x)
begin
	

	case(state)
		S0: begin
				if(x) next_state  = S1;
				else next_state  = S0;
			end
		S1: begin
				next_state = S2;
			 end
		S2: begin
				next_state = S3;
			 end
		S3: begin
				if(~x) next_state  = S4;
				else next_state  = S3;
			 end
		S4: next_state = S0;
		default: next_state = S0;
	endcase

end
always @(posedge clock)
begin	
	case(state)
		S0: begin
				hwy = 3'b001;
				crd = 3'b100;	
			 end
		S1: begin
				hwy = 3'b010;
				crd = 3'b100;	
			 end
		S2: begin
				hwy = 3'b100;
				crd = 3'b100;	
			 end
		S3: begin
				hwy = 3'b100;
				crd = 3'b001;	
			 end
		S4: begin
				hwy = 3'b100;
				crd = 3'b010;	
			 end
		default: begin
				hwy = 3'b001;
				crd = 3'b100;	
			 end
	endcase

	
end







endmodule
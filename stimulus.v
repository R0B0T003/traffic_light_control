 
`define TRUE 1'b1 
`define FALSE 1'b0 
//Delays 
//`define Y2RDELAY 3 //Yellow to red delay 
//`define R2GDELAY 2 //Red to green delay 
//Stimulus Module 
module stimulus; 
wire [2:0] MAIN_SIG, CNTRY_SIG; 
reg CAR_ON_CNTRY_RD; 
 //if TRUE, indicates that there is car on the country road 
reg CLOCK, CLEAR; 
//Instantiate signal controller 
sig_control SC(MAIN_SIG, CNTRY_SIG, CAR_ON_CNTRY_RD, CLOCK, CLEAR); 
//Set up monitor 
initial 
 $monitor($time, " 1 Main Sig = %b Country Sig = %b Car_on_cntry = %b, state = %b, next_state = %b", 
 MAIN_SIG, CNTRY_SIG, CAR_ON_CNTRY_RD, SC.state, SC.next_state);
//Set up clock 
initial 
begin 
 CLOCK = `FALSE; 
 forever #1 CLOCK = ~CLOCK; 
end 
//control clear signal 
/*
initial 

begin 
 CLEAR = `TRUE; 
 repeat (5) @(negedge CLOCK); 
 CLEAR = `FALSE; 
end 
*/
//apply stimulus 
initial 
begin 

 #5 CAR_ON_CNTRY_RD = `FALSE;
 $display($time, " 1 Main Sig = %b Country Sig = %b Car_on_cntry = %b, state = %b, next_state = %b", 
 MAIN_SIG, CNTRY_SIG, CAR_ON_CNTRY_RD, SC.state, SC.next_state);
 #5 CAR_ON_CNTRY_RD = `FALSE;
 $display($time, " 2 Main Sig = %b Country Sig = %b Car_on_cntry = %b, state = %b, next_state = %b", 
 MAIN_SIG, CNTRY_SIG, CAR_ON_CNTRY_RD, SC.state, SC.next_state);

 #5 CAR_ON_CNTRY_RD = `TRUE;
 $display($time, " 3 Main Sig = %b Country Sig = %b Car_on_cntry = %b, state = %b, next_state = %b", 
 MAIN_SIG, CNTRY_SIG, CAR_ON_CNTRY_RD, SC.state, SC.next_state);
 #5 CAR_ON_CNTRY_RD = `TRUE;
 $display($time, " 4 Main Sig = %b Country Sig = %b Car_on_cntry = %b, state = %b, next_state = %b", 
 MAIN_SIG, CNTRY_SIG, CAR_ON_CNTRY_RD, SC.state, SC.next_state); 
 #5 CAR_ON_CNTRY_RD = `TRUE;
 $display($time, " 5 Main Sig = %b Country Sig = %b Car_on_cntry = %b, state = %b, next_state = %b", 
 MAIN_SIG, CNTRY_SIG, CAR_ON_CNTRY_RD, SC.state, SC.next_state);
 #5 CAR_ON_CNTRY_RD = `TRUE;
 $display($time, " 6 Main Sig = %b Country Sig = %b Car_on_cntry = %b, state = %b, next_state = %b", 
 MAIN_SIG, CNTRY_SIG, CAR_ON_CNTRY_RD, SC.state, SC.next_state);
 #5 CAR_ON_CNTRY_RD = `TRUE;
 $display($time, " 7 Main Sig = %b Country Sig = %b Car_on_cntry = %b, state = %b, next_state = %b", 
 MAIN_SIG, CNTRY_SIG, CAR_ON_CNTRY_RD, SC.state, SC.next_state);
 #5 CAR_ON_CNTRY_RD = `TRUE;
 $display($time, " 8 Main Sig = %b Country Sig = %b Car_on_cntry = %b, state = %b, next_state = %b", 
 MAIN_SIG, CNTRY_SIG, CAR_ON_CNTRY_RD, SC.state, SC.next_state);
 #5 CAR_ON_CNTRY_RD = `TRUE;
 $display($time, " 9 Main Sig = %b Country Sig = %b Car_on_cntry = %b, state = %b, next_state = %b", 
 MAIN_SIG, CNTRY_SIG, CAR_ON_CNTRY_RD, SC.state, SC.next_state);
  #5 CAR_ON_CNTRY_RD = `FALSE;
 $display($time, " 10 Main Sig = %b Country Sig = %b Car_on_cntry = %b, state = %b, next_state = %b", 
 MAIN_SIG, CNTRY_SIG, CAR_ON_CNTRY_RD, SC.state, SC.next_state);
 #5 CAR_ON_CNTRY_RD = `FALSE;
 $display($time, " 11 Main Sig = %b Country Sig = %b Car_on_cntry = %b, state = %b, next_state = %b", 
 MAIN_SIG, CNTRY_SIG, CAR_ON_CNTRY_RD, SC.state, SC.next_state);

 repeat(20)@(negedge CLOCK); CAR_ON_CNTRY_RD = `TRUE; 
 repeat(10)@(negedge CLOCK); CAR_ON_CNTRY_RD = `FALSE; 
 repeat(20)@(negedge CLOCK); CAR_ON_CNTRY_RD = `TRUE; 
 repeat(10)@(negedge CLOCK); CAR_ON_CNTRY_RD = `FALSE; 
 repeat(20)@(negedge CLOCK); CAR_ON_CNTRY_RD = `TRUE; 
 repeat(10)@(negedge CLOCK); CAR_ON_CNTRY_RD = `FALSE; 
 repeat(10)@(negedge CLOCK); $stop; 
end 
endmodule
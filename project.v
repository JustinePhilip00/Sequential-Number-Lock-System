module project(clk,rst,b0,b1,unlock,led);
 output reg unlock;
 input clk,rst;
 input b0,b1;
 output led;

 reg [2:0] state;
 reg [2:0] next_state;

 parameter [2:0] s_rst=3'b000;
 parameter [2:0] s1=3'b001;
 parameter [2:0] s2=3'b010;
 parameter [2:0] s3=3'b011;
 parameter [2:0] s4=3'b100;
 parameter [2:0] s5=3'b101;

always @(posedge clk)
 begin
  if (rst)
   state=s_rst;
  else
   state=next_state;
 end

always @(state,b0,b1)
 begin
  case(state)
   s_rst: next_state = b0 ? s1 : b1 ? s_rst : state;
   s1: next_state = b0 ? s1 : b1 ? s2 : state;
   s2: next_state = b0 ? s3 : b1 ? s_rst : state;
   s3: next_state = b0 ? s1 : b1 ? s4 : state;
   s4: next_state = b0 ? s3 : b1 ? s5 : state;
   s5: next_state = b0 ? s1 : b1 ? s_rst : state;
   default: next_state = s_rst;
  endcase
 end

always @(state)
 begin
  case(state)
   s_rst : unlock<=1'b0;
   s1 : unlock<=1'b0;
   s2 : unlock<=1'b0;
   s3 : unlock<=1'b0;
   s4 : unlock<=1'b0;
   s5 : unlock<=1'b1;
   default : unlock<=1'b0;
  endcase
 end
 always@(unlock)
 begin
 if (unlock==1'b1)
 led=1'b1;
 else
 led=1'b0;
end
endmodule
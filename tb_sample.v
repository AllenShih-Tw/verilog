module adder(
input clk,
input reset,
input [7:0]a,
input [7:0]b,
output reg[7:0]c
    ); 
 
 always@(posedge clk)begin
   if(reset)
     c <= 0;
   else
     c <= a + b;
 end
    
endmodule





module tb();
reg clk;
reg reset;
reg[7:0] a;
reg[7:0] b;
wire[7:0] c;
adder uut(
  .clk(clk),
  .reset(reset),
  .a(a),
  .b(b),
  .c(c)
);
initial begin

  clk = 0 ;
  reset = 0 ;
  a = 0 ;
  b = 0 ;
  #10;
  reset = 1 ;
  #10;
  reset = 1;
  #100;
  a = 4;
  b = 7;
  #10;
  a = 8;
  b = 12;
end
  always #5 clk = ~clk;
endmodule

module adder(
input clk,
input reset,
input [7:0]a_adder,
input [7:0]b_adder,
output reg[7:0]c_adder,
output reg[7:0]d_adder
    ); 
 
 always@(posedge clk)begin
   if(reset)
     c_adder <= 0;
   else
     c_adder <= a_adder + b_adder;
 end
 always@(negedge clk)begin
   if(reset)
     d_adder <= 0;
   else
     d_adder <= b_adder - a_adder;
 end
    
endmodule


module tb();
reg clk;
reg reset;
reg[7:0] a;
reg[7:0] b;
wire[7:0] c;
wire[7:0] d;
adder uut(
  .clk(clk),
  .reset(reset),
  .a_adder(a),
  .b_adder(b),
  .c_adder(c),
  .d_adder(d)
);
initial begin

  clk = 0 ;
  reset = 0 ;
  a = 0 ;
  b = 0 ;
  #10;
  reset = 1 ;
  #10;
  reset = 0;
  #100;
  a = 4;
  b = 7;
  #100;
  a = 8;
  b = 12;
end
  always #5 clk = ~clk;
endmodule

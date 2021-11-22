module test(clk,reset,a,b,c);

input clk;   //時脈訊號
input reset; //訊號重置 

input a;     //輸入訊號
input b;     //輸入訊號 

output c;//輸出訊號

wire tamp1;  //宣告為wire訊號
wire tamp2;  //宣告為wire訊號

reg tamp3;  //宣告為reg訊號


assign tamp1 = a & b;  //兩個輸入訊號做and
assign tamp2 = a | b;  //兩個輸入訊號做or
assign c = tamp3;

always@(posedge clk)begin //clock正緣觸發
  if(reset)
    tamp3 <= 0; //reset等於1時做初始化
  else
    tamp3 <= ~(tamp1 ^ tamp2); //兩條訊號線做xnor
end
endmodule

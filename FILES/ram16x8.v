`timescale 1ns / 1ps

module ram16x8(
input clock,reset,ri,ro,
input [3:0] ram_addr,
input [7:0] bus_in,
output reg [7:0]bus_out
);
reg[7:0]mem[0:15];
integer i;
always@(posedge clock or posedge reset)
begin
   if(reset)
     begin
        for(i=0; i<16; i=i+1)
           mem[i] <= 8'b00000000;
     end
   else if(ri)
     mem[ram_addr] <= bus_in;
end
always@(*)
begin
  if (ro)
  bus_out = mem[ram_addr];
  else
  bus_out = 8'bzzzzzzzz;
end
endmodule

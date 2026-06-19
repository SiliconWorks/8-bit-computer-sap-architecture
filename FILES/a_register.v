module a_register(
    input clk,
    input reset,
    input ai,
    input ao,
    input [7:0] bus_in,
    output [7:0] bus_out,
    output reg [7:0] a,
    output [7:0] alu_a
);
always @(posedge clk or posedge reset)
begin
    if(reset)
        a <= 8'd0;
    else if(ai)
        a <= bus_in;
end
assign bus_out = (ao) ? a : 8'bzzzz_zzzz;
assign alu_a = a;
endmodule

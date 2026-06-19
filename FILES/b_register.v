module b_register(
    input clk,
    input reset,
    input bi,
    input [7:0] bus_in,
    output reg [7:0]b,
    output [7:0] alu_b
);

always @(posedge clk or posedge reset)
begin
    if(reset)
        b <= 8'd0;
    else if(bi)
        b <= bus_in;
end

assign alu_b = b;

endmodule

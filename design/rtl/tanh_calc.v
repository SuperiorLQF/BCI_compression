module tanh_calc#(
    parameter  IN_DAT_W  = 7,
    parameter  OUT_DAT_W = 7
)(
    input                       clk     ,
    input       [IN_DAT_W-1:0]  in_x    ,
    input                       in_valid,
    output  reg [OUT_DAT_W-1:0] out_y   
);
reg [OUT_DAT_W-1:0] mem [2**IN_DAT_W-1:0];

initial begin
    $readmemb("../mem_file/tanh_mem.txt",mem);
    out_y = 'd0;
end

always @(posedge clk) begin
    if(in_valid)begin
        out_y <= mem[in_x];
    end
end
endmodule
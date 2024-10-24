`timescale 1ns/100ps
module tb_tanh_calc;

localparam  IN_DAT_W  = 7;
localparam  OUT_DAT_W = 7;

logic                  clk     ;
logic  [IN_DAT_W-1:0]  in_x    ;
logic                  in_valid;
logic  [OUT_DAT_W-1:0] out_y   ;

tanh_calc dut(.*);

initial begin
    clk = 1'b0;
    in_valid = 1'b0;
    in_x = 'd0;

    # 200;
    in_valid <= 1'b1;

    while(1)begin
        @(posedge clk)
        if(in_x == {IN_DAT_W{1'b1}})begin
            break;
        end
        else begin
            in_x <= in_x + 1'b1;
        end
    end

    #200
    $finish();
end

always #5 begin
    clk = ~clk;
end
endmodule
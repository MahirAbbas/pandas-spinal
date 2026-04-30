// Generator : SpinalHDL v1.12.3    git head : 591e64062329e5e2e2b81f4d52422948053edb97
// Component : Divider

`timescale 1ns/1ps

module Divider (
  input  wire          io_enable,
  input  wire [31:0]   io_divisor_i,
  input  wire [63:0]   io_divider_i,
  output reg           io_quot_rdy,
  output reg  [31:0]   io_quot,
  input  wire          clk
);

  reg                 stop;
  reg                 enable;
  reg        [4:0]    index;
  reg        [63:0]   divider_1;
  reg        [31:0]   result;
  reg        [31:0]   divider_comp;
  wire                when_divider_l27;
  wire       [4:0]    offset;
  wire       [31:0]   window;
  wire                when_divider_l39;
  wire                when_divider_l44;

  initial begin
    stop = 1'b0;
    enable = 1'b0;
    index = 5'h0;
    divider_1 = 64'h0;
    result = 32'h0;
  end

  assign when_divider_l27 = (stop && enable);
  assign offset = (5'h1f - index);
  assign window = divider_1[offset +: 32];
  assign when_divider_l39 = (io_divisor_i <= window);
  assign when_divider_l44 = (index != 5'h1f);
  always @(posedge clk) begin
    if(io_enable) begin
      enable <= 1'b1;
      divider_1 <= io_divider_i;
    end else begin
      if(when_divider_l27) begin
        enable <= 1'b0;
      end
    end
    stop <= (index == 5'h1f);
    if(enable) begin
      if(when_divider_l39) begin
        result[offset] <= 1'b1;
        divider_1[offset +: 32] <= (window - io_divisor_i);
      end
      if(when_divider_l44) begin
        index <= (index + 5'h01);
      end
    end else begin
      index <= 5'h0;
      result <= 32'h0;
    end
  end

  always @(posedge clk) begin
    if(!io_enable) begin
      if(when_divider_l27) begin
        io_quot_rdy <= 1'b1;
        io_quot <= result;
      end else begin
        io_quot_rdy <= 1'b0;
      end
    end
    if(enable) begin
      if(when_divider_l39) begin
        divider_comp <= window;
      end
    end
  end


endmodule

module filter_divider_equiv_miter(
  input clk,
  input enable,
  input [31:0] divisor,
  input [63:0] dividend
);
  wire hand_ready;
  wire [31:0] hand_quot;
  wire spinal_ready;
  wire [31:0] spinal_quot;

  divider_hand hand (
    .clk_i(clk),
    .enable_i(enable),
    .divisor_i(divisor),
    .divider_i(dividend),
    .quot_rdy_o(hand_ready),
    .quot_o(hand_quot)
  );

  Divider_spinal spinal (
    .clk(clk),
    .io_enable(enable),
    .io_divisor_i(divisor),
    .io_divider_i(dividend),
    .io_quot_rdy(spinal_ready),
    .io_quot(spinal_quot)
  );

  reg [7:0] age = 8'd0;

  always @(posedge clk) begin
    if (age != 8'hff) begin
      age <= age + 8'd1;
    end

    if (age > 8'd2) begin
      assert(hand_ready == spinal_ready);
      assert(hand_quot == spinal_quot);
    end
  end
endmodule

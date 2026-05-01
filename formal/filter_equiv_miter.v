module filter_equiv_miter(
  input clk,
  input [31:0] mode,
  input trig,
  input [31:0] inp,
  input enable
);
  wire [31:0] hand_out;
  wire hand_ready;
  wire [31:0] hand_health;

  wire [31:0] spinal_out;
  wire spinal_ready;
  wire [31:0] spinal_health;

  filter_hand hand (
    .clk_i(clk),
    .mode(mode),
    .trig_i(trig),
    .inp_i(inp),
    .enable_i(enable),
    .out_o(hand_out),
    .ready_o(hand_ready),
    .health(hand_health)
  );

  filter_spinal spinal (
    .clk(clk),
    .io_mode(mode),
    .io_inp(inp),
    .io_trig(trig),
    .io_enable(enable),
    .io_out_o(spinal_out),
    .io_health(spinal_health),
    .io_ready(spinal_ready)
  );

  reg [7:0] age = 8'd0;

  always @(posedge clk) begin
    if (age != 8'hff) begin
      age <= age + 8'd1;
    end

    if (age > 8'd2) begin
      assert(hand_out == spinal_out);
      assert(hand_ready == spinal_ready);
      assert(hand_health == spinal_health);
    end
  end
endmodule

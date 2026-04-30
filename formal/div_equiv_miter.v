module div_equiv_miter(
  input clk,
  input inp,
  input enable,
  input FIRST_PULSE_WSTB,
  input DIVISOR_WSTB,
  input [31:0] FIRST_PULSE,
  input [31:0] DIVISOR
);
  wire hand_outd;
  wire hand_outn;
  wire [31:0] hand_count;

  wire spinal_outd;
  wire spinal_outn;
  wire [31:0] spinal_count;

  wire reset = !enable || FIRST_PULSE_WSTB || DIVISOR_WSTB;

  div_hand hand (
    .clk_i(clk),
    .inp_i(inp),
    .enable_i(enable),
    .outd_o(hand_outd),
    .outn_o(hand_outn),
    .FIRST_PULSE(FIRST_PULSE),
    .FIRST_PULSE_WSTB(FIRST_PULSE_WSTB),
    .DIVISOR(DIVISOR),
    .DIVISOR_WSTB(DIVISOR_WSTB),
    .COUNT(hand_count)
  );

  div_spinal spinal (
    .clk(clk),
    .io_inp(inp),
    .io_enable(enable),
    .io_outd(spinal_outd),
    .io_outn(spinal_outn),
    .io_FIRST_PULSE(FIRST_PULSE),
    .io_FIRST_PULSE_WSTB(FIRST_PULSE_WSTB),
    .io_DIVISOR(DIVISOR),
    .io_DIVISOR_WSTB(DIVISOR_WSTB),
    .io_COUNT(spinal_count)
  );

  reg past_valid = 1'b0;
  reg aligned = 1'b0;

  always @(posedge clk) begin
    past_valid <= 1'b1;

    if (!past_valid) begin
      assume(reset);
    end

    if (past_valid && $past(reset)) begin
      aligned <= 1'b1;
    end

    if (aligned) begin
      assert(hand_outd == spinal_outd);
      assert(hand_outn == spinal_outn);
      assert(hand_count == spinal_count);
    end
  end
endmodule

module calc_equiv_miter(
  input clk,
  input check,
  input [31:0] a,
  input [31:0] b,
  input [31:0] c,
  input [31:0] d,
  input [31:0] TYPEA,
  input [31:0] TYPEB,
  input [31:0] TYPEC,
  input [31:0] TYPED,
  input [31:0] SHIFT
);
  wire [31:0] hand_out;
  wire [31:0] spinal_out;

  calc_hand hand (
    .clk_i(clk),
    .inpa_i(a),
    .inpb_i(b),
    .inpc_i(c),
    .inpd_i(d),
    .out_o(hand_out),
    .TYPEA(TYPEA),
    .TYPEB(TYPEB),
    .TYPEC(TYPEC),
    .TYPED(TYPED),
    .SHIFT(SHIFT)
  );

  calc_spinal spinal (
    .clk(clk),
    .io_a(a),
    .io_b(b),
    .io_c(c),
    .io_d(d),
    .io_out_o(spinal_out),
    .io_TYPEA(TYPEA),
    .io_TYPEB(TYPEB),
    .io_TYPEC(TYPEC),
    .io_TYPED(TYPED),
    .io_SHIFT(SHIFT)
  );

  always @* begin
    if (check) begin
      assert(hand_out == spinal_out);
    end
  end
endmodule

module calc2_equiv_miter(
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
  wire [31:0] calc_out;
  wire [31:0] calc2_out;

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

  calc_spinal calc_impl (
    .clk(clk),
    .io_inpa(a),
    .io_inpb(b),
    .io_inpc(c),
    .io_inpd(d),
    .io_out_o(calc_out),
    .io_TYPEA(TYPEA),
    .io_TYPEB(TYPEB),
    .io_TYPEC(TYPEC),
    .io_TYPED(TYPED),
    .io_SHIFT(SHIFT)
  );

  calc2_spinal calc2_impl (
    .clk(clk),
    .io_ios_0(a),
    .io_ios_1(b),
    .io_ios_2(c),
    .io_ios_3(d),
    .io_out_o(calc2_out),
    .io_TYPES_0(TYPEA),
    .io_TYPES_1(TYPEB),
    .io_TYPES_2(TYPEC),
    .io_TYPES_3(TYPED),
    .io_SHIFT(SHIFT)
  );

  always @* begin
    if (check) begin
      assert(hand_out == calc_out);
      assert(hand_out == calc2_out);
    end
  end
endmodule

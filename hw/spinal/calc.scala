package pandasSpinal.calc

import spinal.core._
import spinal.lib._

class calc() extends Component {
  val io = new Bundle {
    val inpa, inpb, inpc, inpd = in port Bits(32 bits)
    val out_o = out port Reg(Bits(32 bits))
    val TYPEA, TYPEB, TYPEC, TYPED = in port Bits(32 bits)
    val SHIFT = in port Bits(32 bits)
  }
  def convert(data: Bits, negate: Bool): SInt = {
    val resized = data.asSInt.resize(34)
    negate ? -resized | resized
  }

  val inputA = SInt(34 bits)
  val inputB = SInt(34 bits)
  val inputC = SInt(34 bits)
  val inputD = SInt(34 bits)
  inputA := convert(io.inpa, io.TYPEA(0))
  inputB := convert(io.inpb, io.TYPEB(0))
  inputC := convert(io.inpc, io.TYPEC(0))
  inputD := convert(io.inpd, io.TYPED(0))
  val calculation = inputA + inputB + inputC + inputD
  switch(io.SHIFT(1 downto 0)) {
    is(B"00") {io.out_o := calculation(31 downto 0).asBits}
    is(B"01") {io.out_o := calculation(32 downto 1).asBits}
    default   {io.out_o := calculation(33 downto 2).asBits}
  }
}
class calc2() extends Component {
  val io = new Bundle {
    val ios   = in  port Vec.fill(4)(Bits (32 bits))
    val out_o = out port Reg(Bits(32 bits))
    val TYPES = in  port Vec.fill(4) (Bits(32 bits))
    val SHIFT = in  port Bits(32 bits)
  }

  val inputs : Vec[SInt] = Vec.fill(4)(SInt(34 bits))
  (inputs, io.ios, io.TYPES).zipped.toList.foreach{case(input: SInt, io, typ) => input := typ(0) ? -io.asSInt.resize(34) | io.asSInt.resize(34) }
  val calculation = inputs(0) + inputs(1) + inputs(2) + inputs(3)
  switch(io.SHIFT(1 downto 0)) {
    is(B"00") {io.out_o := calculation(31 downto 0).asBits}
    is(B"01") {io.out_o := calculation(32 downto 1).asBits}
    default   {io.out_o := calculation(33 downto 2).asBits}
  }
}
object calcCompile extends App {
  SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      resetKind = BOOT
      )
    ).generateVhdl(new calc())
}
object calc2Compile extends App {
  SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      resetKind = BOOT
      )
    ).generateVhdl(new calc2())
}

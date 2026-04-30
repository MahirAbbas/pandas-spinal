package pandasSpinal.calc

import spinal.core._
import spinal.lib._

class calc() extends Component {
  val io = new Bundle {
    val ios = in port Vec.fill(4)(Bits (32 bits))
    val out_o = out port Bits(32 bits)
    val TYPES = in port Vec.fill(4) (Bits(32 bits))
    val SHIFT = in port Bits(32 bits)
  }

  def convert(data: Bits, negate: Bool): SInt = {
    val resized = data.asSInt.resize(34)
    negate ? -resized | resized
  }
  
  val inputs : Vec[SInt] = Vec.fill(4)(SInt(34 bits))
  (inputs, io.ios, io.TYPES).zipped.toList.foreach{case(input: SInt, io, typ) => input := convert(io, typ(0))}
  val calculation = inputs(0) + inputs(1) + inputs(2) + inputs(3)
  val outRegister = Reg(Bits(32 bits))
  io.out_o := outRegister
  switch(io.SHIFT(1 downto 0)) {
    is(B"00") {outRegister := calculation(31 downto 0).asBits}
    is(B"01") {outRegister := calculation(32 downto 1).asBits}
    default   {outRegister := calculation(33 downto 2).asBits}
  }
}

object calcCompile extends App {
  SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      resetKind = BOOT
      )
    ).generateVhdl(new calc())
    
}

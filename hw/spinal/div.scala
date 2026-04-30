package pandasSpina.div

import spinal.core._
import spinal.lib._


class div() extends Component {
  val io = new Bundle {
    val inp, enable = in port Bool()
    val outd, outn = out port Bool()

    val FIRST_PULSE = in port Bits(32 bits)
    val FIRST_PULSE_WSTB = in port Bool()
    val DIVISOR = in port Bits(32 bits)
    val DIVISOR_WSTB = in port Bool()

    val COUNT = out port UInt(32 bits)
  }

  val reset         = Bool()
  val input_prev    = Reg(Bool())
  val input_rise    = Bool()
  val counter       = Reg(UInt(32 bits))
  val pulsmask      = Reg(Bool())
  val is_first_pulse= Reg(Bool())
  val divisor_i     = Bits(32 bits)

  divisor_i := (io.DIVISOR === 0) ? U"1".resize(32).asBits | io.DIVISOR.asUInt.asBits
  reset := !io.enable || io.FIRST_PULSE_WSTB || io.DIVISOR_WSTB
  input_rise := io.inp && !input_prev

  input_prev := io.inp

  when(reset === True) {
    is_first_pulse := False
    

    when(io.FIRST_PULSE(0) === False) {
      counter := 0
    } otherwise {
      counter := divisor_i.asUInt - 1
    }

  } otherwise {
    when (input_rise === True) {
      is_first_pulse := True
      when(counter === (divisor_i.asUInt -1)) {
        counter := 0
        pulsmask := True
      } otherwise {
        counter := counter + 1
        pulsmask := False
      }
    }

  }
  io.outd := input_prev && pulsmask && is_first_pulse
  io.outn := input_prev && !pulsmask && is_first_pulse

  io.COUNT := counter
}

object compileDiv extends App {
  SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      resetKind = BOOT
      )
    ).generateVhdl(new div())
}

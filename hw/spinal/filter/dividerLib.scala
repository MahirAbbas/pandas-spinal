package pandasSpinal.filter

import spinal.core._
import spinal.lib.math._

class DividerLib(g_divider_size: Int = 64, g_divisor_size: Int = 32) extends Component {
  val io = new Bundle {
    val enable = in port Bool()
    val divisor_i = in port UInt(g_divisor_size bits)
    val divider_i = in port UInt(g_divider_size bits)
    val quot_rdy = out port Bool()
    val quot = out port UInt(g_divider_size - g_divisor_size bits)
  }

  // NOTE: this is a 64 cycle divider, pandas is a 32 cycle divider
  val divider = new UnsignedDivider(
    nWidth = g_divider_size,
    dWidth = g_divisor_size,
    storeDenominator = true
  )

  divider.io.flush := False
  divider.io.cmd.valid := io.enable
  divider.io.cmd.numerator := io.divider_i
  divider.io.cmd.denominator := io.divisor_i
  divider.io.rsp.ready := True

  io.quot_rdy := divider.io.rsp.valid
  io.quot := divider.io.rsp.quotient.resized
}

object compileDividerLib extends App {
  SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      resetKind = BOOT
    )
  ).generateVhdl(new DividerLib())
}

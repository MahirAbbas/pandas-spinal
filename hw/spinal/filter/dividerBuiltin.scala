package pandasSpinal.filter

import spinal.core._

class DividerBuiltin(g_divider_size: Int = 64, g_divisor_size: Int = 32) extends Component {
  val io = new Bundle {
    val enable = in port Bool()
    val divisor_i = in port UInt(g_divisor_size bits)
    val divider_i = in port UInt(g_divider_size bits)
    val quot_rdy = out port Reg(Bool()) init(False)
    val quot = out port Reg(UInt(g_divider_size - g_divisor_size bits)) init(0)
  }

  io.quot_rdy := False

  when(io.enable) {
    io.quot := (io.divider_i / io.divisor_i.resize(g_divider_size)).resized
    io.quot_rdy := True
  }
}

object compileDividerBuiltin extends App {
  SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      resetKind = BOOT
    )
  ).generateVhdl(new DividerBuiltin())
}

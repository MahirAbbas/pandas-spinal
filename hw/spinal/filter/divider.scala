package pandasSpinal.filter

import spinal.core._
import spinal.lib._

case class DividerIO(g_divider_size : Int = 64, g_divisor_size : Int = 32) extends Bundle {
    val enable = in port Bool()
    val divisor_i = in port UInt(g_divisor_size bits)
    val divider_i = in port UInt(g_divider_size bits)
    val quot_rdy = out port Reg(Bool())
    val quot = out port Reg(UInt(g_divider_size - g_divisor_size bits))
}

class Divider(g_divider_size : Int = 64, g_divisor_size : Int = 32) extends Component {
  val io = DividerIO(g_divider_size, g_divisor_size)

  val stop    = Reg(Bool()) init(False)
  val enable  = Reg(Bool()) init(False)
  val index   = Reg(UInt(log2Up(g_divisor_size) bits)) init(0)
  val divider = Reg(UInt(g_divider_size bits)) init(0)
  val result  = Reg(UInt(g_divisor_size bits)) init(0)

  val divider_comp = Reg(UInt(32 bits))

  when(io.enable) {
    enable := True
    divider := io.divider_i
  } elsewhen(stop && enable) {
    enable := False
    io.quot_rdy := True
    io.quot := result
  } otherwise {
    io.quot_rdy := False
  }
  stop := index === g_divisor_size-1
  val offset = U(g_divisor_size -1, index.getWidth bits) - index
  //val window = divider(offset, g_divisor_size bits)
  val window = (divider >> offset).resize(g_divisor_size bits)
  //val divider_comp = (window >= io.divisor_i) ? window | 0

  when(enable) {
    when (window >= io.divisor_i) {
      divider_comp := window
      result(offset) := True
      divider(offset, g_divisor_size bits) := window - io.divisor_i
    }
    when(index =/= g_divisor_size-1) {
      index := index+1
    }
  } otherwise {
    index := 0
    result := 0
  }
} 

object compileDivider extends App {
  SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      resetKind = BOOT
    )
  ).generateVhdl(new Divider())
}

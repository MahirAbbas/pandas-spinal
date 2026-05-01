package pandasSpinal.filter

import spinal.core._
import spinal.lib._

class filter() extends Component {
  val io = new Bundle {
    val mode, inp = in port Bits(32 bits)
    val trig, enable = in port Bool()
    val out_o, health = out port Reg(Bits(32 bits)) init 0 
    val ready = out port Reg(Bool())
  }

  val stop  = Reg(Bool()) init False
  val trig_dly        = Reg(Bool()) init False
  val result_neg      = Reg(Bool()) init False
  val trig_div_dly    = Reg(Bool()) init False
  val div_enabled     = Reg(Bool()) init False
  val quot_rdy_o      = Bool()
  val enable_i_dly    = Reg(Bool()) init False
  val trig_div_i      = Reg(Bool()) init False
  val accum_of_err    = Reg(Bool()) init False
  val div_enabled_err = Reg(Bool()) init False
  val latch           = Reg(SInt(32 bits)) init 0 
  val sum_i           = Reg(SInt(64 bits)) init 0 
  val sum_num         = Reg(UInt(32 bits)) init 0 
  val quot_o          = (SInt(32 bits)) 
  val divisor_i       = Reg(SInt(32 bits)) init 0 
  val divider_i       = Reg(SInt(64 bits)) init 0 

  val difference = False
  val average = True 

  enable_i_dly := io.enable
  trig_dly := io.trig

  when(io.mode(0) === difference) {
    when(io.enable && !enable_i_dly) {latch := io.inp.asSInt}
    .elsewhen(io.trig && !trig_dly) {
      latch := io.inp.asSInt
      when(!stop) {
        io.ready := True
        io.out_o := (io.inp.asSInt - latch).asBits
      }
    } otherwise {io.ready := False}
  } elsewhen(io.mode(0) === average) {
    when(!stop) {
      io.ready := quot_rdy_o
      when(quot_rdy_o) {
        when(result_neg) {
          io.out_o := (-quot_o).asBits
        } otherwise {
          io.out_o := quot_o.asBits
        }
      }
    } 
    when(io.enable && !enable_i_dly) {
      sum_i := 0
      sum_num := 0
    } elsewhen(enable_i_dly) {
      sum_i := sum_i + io.inp.asSInt
      sum_num := sum_num + 1
    }
    when(io.trig && enable_i_dly) {
      trig_div_i := True
      divisor_i := sum_num.asSInt
      when(sum_i(63)) {
        result_neg := True
        divider_i := (-sum_i)
      } otherwise {
        result_neg := False
        divider_i := sum_i
      }
    } otherwise {
      trig_div_i := False
    }
  }

  trig_div_dly := trig_div_i
  when(trig_div_i && !trig_div_dly) {
    div_enabled := True
    when(div_enabled) {
      div_enabled_err := True
    }
  } elsewhen(div_enabled && io.enable && !enable_i_dly) {
    div_enabled_err := True
  } elsewhen (quot_rdy_o){
    div_enabled := False
    div_enabled_err := False
  }
  accum_of_err := (sum_i(63) ^ sum_i(62))
  when(io.enable && !enable_i_dly) {
    stop := False
    io.health := 0
  } elsewhen(accum_of_err || div_enabled_err) {
    stop := True
    io.health(0) := (sum_i(63) ^ sum_i(62))
    io.health(1) := div_enabled_err
  }

  val divider = new Divider()
  divider.io.enable := trig_div_i 
  divider.io.divisor_i :=  divisor_i.asUInt 
  divider.io.divider_i := divider_i.asUInt 
  quot_rdy_o := divider.io.quot_rdy 
  quot_o := divider.io.quot.asSInt
}

object filterCompile extends App {
  SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      resetKind = BOOT
      )
    ).generateVhdl(new filter())
}

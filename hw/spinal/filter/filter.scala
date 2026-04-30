package pandasSpinal.filter

import spinal.core._
import spinal.lib._

class filter() extends Component {
  val io = new Bundle {
    val mode, inp = in port Bits(32 bits)
    val trig, enable = in port Bool()
    val out_o, health = out port Reg(Bits(32 bits)) init 0 
    val ready = out port Bool()
  }

  val stop  = Reg(Bool()) init False
  val trig_dly      = Bool()
  val result_neg      = Bool()
  val trig_div_dly   = Bool()
  val div_enabled   = Bool()
  val quot_rdy_o    = Bool()
  val enable_i_dly  = Bool()
  val trig_div_i    = Bool()
  val accum_of_err   = Bool()
  val div_enabled_err = Bool()
  val latch          = Reg(SInt(32 bits)) init 0 
  val sum_i           = Reg(SInt(32 bits)) init 0 
  val sum_num         = Reg(UInt(32 bits)) init 0 
  val quot_o          = (SInt(32 bits)) 
  val divisor_i       = Reg(SInt(32 bits)) init 0 
  val divider_i       = Reg(SInt(32 bits)) init 0 

  val difference = False
  val average = True 

  when(!io.mode(0) === difference) {
    when(io.enable && !enable_i_dly) {latch := io.inp.asSInt}
    .elsewhen(io.trig && !trig_dly) {
      latch := io.inp.asSInt
      when(stop) {
        io.ready := True
        io.out_o := (io.inp.asSInt - latch).asBits
      }
    } otherwise {io.ready := False}
  } elsewhen(io.mode(0) === average) {
    when(stop) {
      io.ready := quot_rdy_o
      when(quot_rdy_o) {
        when(result_neg) {
          io.out_o := ((-quot_o)+1).asBits
        } otherwise {
          io.out_o := quot_o.asBits
        }
      }
    } elsewhen(io.enable && !enable_i_dly) {
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
        divider_i := (-sum_i)+1
      } otherwise {
        result_neg := False
        divider_i := sum_i
      }
      io.ready := False
      io.out_o := B"0".resized
    }

  }

}

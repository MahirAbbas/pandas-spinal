-- Generator : SpinalHDL v1.12.3    git head : 591e64062329e5e2e2b81f4d52422948053edb97
-- Component : DividerLib

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

package pkg_enum is

end pkg_enum;

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package pkg_scala2hdl is
  function pkg_extract (that : std_logic_vector; bitId : integer) return std_logic;
  function pkg_extract (that : std_logic_vector; base : unsigned; size : integer) return std_logic_vector;
  function pkg_cat (a : std_logic_vector; b : std_logic_vector) return std_logic_vector;
  function pkg_not (value : std_logic_vector) return std_logic_vector;
  function pkg_extract (that : unsigned; bitId : integer) return std_logic;
  function pkg_extract (that : unsigned; base : unsigned; size : integer) return unsigned;
  function pkg_cat (a : unsigned; b : unsigned) return unsigned;
  function pkg_not (value : unsigned) return unsigned;
  function pkg_extract (that : signed; bitId : integer) return std_logic;
  function pkg_extract (that : signed; base : unsigned; size : integer) return signed;
  function pkg_cat (a : signed; b : signed) return signed;
  function pkg_not (value : signed) return signed;

  function pkg_mux (sel : std_logic; one : std_logic; zero : std_logic) return std_logic;
  function pkg_mux (sel : std_logic; one : std_logic_vector; zero : std_logic_vector) return std_logic_vector;
  function pkg_mux (sel : std_logic; one : unsigned; zero : unsigned) return unsigned;
  function pkg_mux (sel : std_logic; one : signed; zero : signed) return signed;

  function pkg_toStdLogic (value : boolean) return std_logic;
  function pkg_toStdLogicVector (value : std_logic) return std_logic_vector;
  function pkg_toUnsigned (value : std_logic) return unsigned;
  function pkg_toSigned (value : std_logic) return signed;
  function pkg_stdLogicVector (lit : std_logic_vector) return std_logic_vector;
  function pkg_unsigned (lit : unsigned) return unsigned;
  function pkg_signed (lit : signed) return signed;

  function pkg_resize (that : std_logic_vector; width : integer) return std_logic_vector;
  function pkg_resize (that : unsigned; width : integer) return unsigned;
  function pkg_resize (that : signed; width : integer) return signed;

  function pkg_extract (that : std_logic_vector; high : integer; low : integer) return std_logic_vector;
  function pkg_extract (that : unsigned; high : integer; low : integer) return unsigned;
  function pkg_extract (that : signed; high : integer; low : integer) return signed;

  function pkg_shiftRight (that : std_logic_vector; size : natural) return std_logic_vector;
  function pkg_shiftRight (that : std_logic_vector; size : unsigned) return std_logic_vector;
  function pkg_shiftLeft (that : std_logic_vector; size : natural) return std_logic_vector;
  function pkg_shiftLeft (that : std_logic_vector; size : unsigned) return std_logic_vector;

  function pkg_shiftRight (that : unsigned; size : natural) return unsigned;
  function pkg_shiftRight (that : unsigned; size : unsigned) return unsigned;
  function pkg_shiftLeft (that : unsigned; size : natural) return unsigned;
  function pkg_shiftLeft (that : unsigned; size : unsigned) return unsigned;

  function pkg_shiftRight (that : signed; size : natural) return signed;
  function pkg_shiftRight (that : signed; size : unsigned) return signed;
  function pkg_shiftLeft (that : signed; size : natural) return signed;
  function pkg_shiftLeft (that : signed; size : unsigned; w : integer) return signed;

  function pkg_rotateLeft (that : std_logic_vector; size : unsigned) return std_logic_vector;

  function pkg_toString (that : std_logic_vector) return string;
  function pkg_toString (that : unsigned) return string;
  function pkg_toString (that : signed) return string;
end  pkg_scala2hdl;

package body pkg_scala2hdl is
  function pkg_extract (that : std_logic_vector; bitId : integer) return std_logic is
    alias temp : std_logic_vector(that'length-1 downto 0) is that;
  begin
    if bitId >= temp'length then
      return 'U';
    end if;
    return temp(bitId);
  end pkg_extract;

  function pkg_extract (that : std_logic_vector; base : unsigned; size : integer) return std_logic_vector is
    alias temp : std_logic_vector(that'length-1 downto 0) is that;    constant elementCount : integer := temp'length - size + 1;
    type tableType is array (0 to elementCount-1) of std_logic_vector(size-1 downto 0);
    variable table : tableType;
  begin
    for i in 0 to elementCount-1 loop
      table(i) := temp(i + size - 1 downto i);
    end loop;
    if base + size >= elementCount then
      return (size-1 downto 0 => 'U');
    end if;
    return table(to_integer(base));
  end pkg_extract;

  function pkg_cat (a : std_logic_vector; b : std_logic_vector) return std_logic_vector is
    variable cat : std_logic_vector(a'length + b'length-1 downto 0);
  begin
    cat := a & b;
    return cat;
  end pkg_cat;

  function pkg_not (value : std_logic_vector) return std_logic_vector is
    variable ret : std_logic_vector(value'length-1 downto 0);
  begin
    ret := not value;
    return ret;
  end pkg_not;

  function pkg_extract (that : unsigned; bitId : integer) return std_logic is
    alias temp : unsigned(that'length-1 downto 0) is that;
  begin
    if bitId >= temp'length then
      return 'U';
    end if;
    return temp(bitId);
  end pkg_extract;

  function pkg_extract (that : unsigned; base : unsigned; size : integer) return unsigned is
    alias temp : unsigned(that'length-1 downto 0) is that;    constant elementCount : integer := temp'length - size + 1;
    type tableType is array (0 to elementCount-1) of unsigned(size-1 downto 0);
    variable table : tableType;
  begin
    for i in 0 to elementCount-1 loop
      table(i) := temp(i + size - 1 downto i);
    end loop;
    if base + size >= elementCount then
      return (size-1 downto 0 => 'U');
    end if;
    return table(to_integer(base));
  end pkg_extract;

  function pkg_cat (a : unsigned; b : unsigned) return unsigned is
    variable cat : unsigned(a'length + b'length-1 downto 0);
  begin
    cat := a & b;
    return cat;
  end pkg_cat;

  function pkg_not (value : unsigned) return unsigned is
    variable ret : unsigned(value'length-1 downto 0);
  begin
    ret := not value;
    return ret;
  end pkg_not;

  function pkg_extract (that : signed; bitId : integer) return std_logic is
    alias temp : signed(that'length-1 downto 0) is that;
  begin
    if bitId >= temp'length then
      return 'U';
    end if;
    return temp(bitId);
  end pkg_extract;

  function pkg_extract (that : signed; base : unsigned; size : integer) return signed is
    alias temp : signed(that'length-1 downto 0) is that;    constant elementCount : integer := temp'length - size + 1;
    type tableType is array (0 to elementCount-1) of signed(size-1 downto 0);
    variable table : tableType;
  begin
    for i in 0 to elementCount-1 loop
      table(i) := temp(i + size - 1 downto i);
    end loop;
    if base + size >= elementCount then
      return (size-1 downto 0 => 'U');
    end if;
    return table(to_integer(base));
  end pkg_extract;

  function pkg_cat (a : signed; b : signed) return signed is
    variable cat : signed(a'length + b'length-1 downto 0);
  begin
    cat := a & b;
    return cat;
  end pkg_cat;

  function pkg_not (value : signed) return signed is
    variable ret : signed(value'length-1 downto 0);
  begin
    ret := not value;
    return ret;
  end pkg_not;


  -- unsigned shifts
  function pkg_shiftRight (that : unsigned; size : natural) return unsigned is
    variable ret : unsigned(that'length-1 downto 0);
  begin
    if size >= that'length then
      return "";
    else
      ret := shift_right(that,size);
      return ret(that'length-1-size downto 0);
    end if;
  end pkg_shiftRight;

  function pkg_shiftRight (that : unsigned; size : unsigned) return unsigned is
    variable ret : unsigned(that'length-1 downto 0);
  begin
    ret := shift_right(that,to_integer(size));
    return ret;
  end pkg_shiftRight;

  function pkg_shiftLeft (that : unsigned; size : natural) return unsigned is
  begin
    return shift_left(resize(that,that'length + size),size);
  end pkg_shiftLeft;

  function pkg_shiftLeft (that : unsigned; size : unsigned) return unsigned is
  begin
    return shift_left(resize(that,that'length + 2**size'length - 1),to_integer(size));
  end pkg_shiftLeft;

  -- std_logic_vector shifts
  function pkg_shiftRight (that : std_logic_vector; size : natural) return std_logic_vector is
  begin
    return std_logic_vector(pkg_shiftRight(unsigned(that),size));
  end pkg_shiftRight;

  function pkg_shiftRight (that : std_logic_vector; size : unsigned) return std_logic_vector is
  begin
    return std_logic_vector(pkg_shiftRight(unsigned(that),size));
  end pkg_shiftRight;

  function pkg_shiftLeft (that : std_logic_vector; size : natural) return std_logic_vector is
  begin
    return std_logic_vector(pkg_shiftLeft(unsigned(that),size));
  end pkg_shiftLeft;

  function pkg_shiftLeft (that : std_logic_vector; size : unsigned) return std_logic_vector is
  begin
    return std_logic_vector(pkg_shiftLeft(unsigned(that),size));
  end pkg_shiftLeft;

  -- signed shifts
  function pkg_shiftRight (that : signed; size : natural) return signed is
  begin
    return signed(pkg_shiftRight(unsigned(that),size));
  end pkg_shiftRight;

  function pkg_shiftRight (that : signed; size : unsigned) return signed is
  begin
    return shift_right(that,to_integer(size));
  end pkg_shiftRight;

  function pkg_shiftLeft (that : signed; size : natural) return signed is
  begin
    return signed(pkg_shiftLeft(unsigned(that),size));
  end pkg_shiftLeft;

  function pkg_shiftLeft (that : signed; size : unsigned; w : integer) return signed is
  begin
    return shift_left(resize(that,w),to_integer(size));
  end pkg_shiftLeft;

  function pkg_rotateLeft (that : std_logic_vector; size : unsigned) return std_logic_vector is
  begin
    return std_logic_vector(rotate_left(unsigned(that),to_integer(size)));
  end pkg_rotateLeft;

  function pkg_extract (that : std_logic_vector; high : integer; low : integer) return std_logic_vector is
    alias temp : std_logic_vector(that'length-1 downto 0) is that;
  begin
    return temp(high downto low);
  end pkg_extract;

  function pkg_extract (that : unsigned; high : integer; low : integer) return unsigned is
    alias temp : unsigned(that'length-1 downto 0) is that;
  begin
    return temp(high downto low);
  end pkg_extract;

  function pkg_extract (that : signed; high : integer; low : integer) return signed is
    alias temp : signed(that'length-1 downto 0) is that;
  begin
    return temp(high downto low);
  end pkg_extract;

  function pkg_mux (sel : std_logic; one : std_logic; zero : std_logic) return std_logic is
  begin
    if sel = '1' then
      return one;
    else
      return zero;
    end if;
  end pkg_mux;

  function pkg_mux (sel : std_logic; one : std_logic_vector; zero : std_logic_vector) return std_logic_vector is
    variable ret : std_logic_vector(zero'range);
  begin
    if sel = '1' then
      ret := one;
    else
      ret := zero;
    end if;
    return ret;
  end pkg_mux;

  function pkg_mux (sel : std_logic; one : unsigned; zero : unsigned) return unsigned is
    variable ret : unsigned(zero'range);
  begin
    if sel = '1' then
      ret := one;
    else
      ret := zero;
    end if;
    return ret;
  end pkg_mux;

  function pkg_mux (sel : std_logic; one : signed; zero : signed) return signed is
    variable ret : signed(zero'range);
  begin
    if sel = '1' then
      ret := one;
    else
      ret := zero;
    end if;
    return ret;
  end pkg_mux;

  function pkg_toStdLogic (value : boolean) return std_logic is
  begin
    if value = true then
      return '1';
    else
      return '0';
    end if;
  end pkg_toStdLogic;

  function pkg_toStdLogicVector (value : std_logic) return std_logic_vector is
    variable ret : std_logic_vector(0 downto 0);
  begin
    ret(0) := value;
    return ret;
  end pkg_toStdLogicVector;

  function pkg_toUnsigned (value : std_logic) return unsigned is
    variable ret : unsigned(0 downto 0);
  begin
    ret(0) := value;
    return ret;
  end pkg_toUnsigned;

  function pkg_toSigned (value : std_logic) return signed is
    variable ret : signed(0 downto 0);
  begin
    ret(0) := value;
    return ret;
  end pkg_toSigned;

  function pkg_stdLogicVector (lit : std_logic_vector) return std_logic_vector is
    alias ret : std_logic_vector(lit'length-1 downto 0) is lit;
  begin
    return std_logic_vector(ret);
  end pkg_stdLogicVector;

  function pkg_unsigned (lit : unsigned) return unsigned is
    alias ret : unsigned(lit'length-1 downto 0) is lit;
  begin
    return unsigned(ret);
  end pkg_unsigned;

  function pkg_signed (lit : signed) return signed is
    alias ret : signed(lit'length-1 downto 0) is lit;
  begin
    return signed(ret);
  end pkg_signed;

  function pkg_resize (that : std_logic_vector; width : integer) return std_logic_vector is
  begin
    return std_logic_vector(resize(unsigned(that),width));
  end pkg_resize;

  function pkg_resize (that : unsigned; width : integer) return unsigned is
    variable ret : unsigned(width-1 downto 0);
  begin
    if that'length = 0 then
       ret := (others => '0');
    else
       ret := resize(that,width);
    end if;
    return ret;
  end pkg_resize;
  function pkg_resize (that : signed; width : integer) return signed is
    alias temp : signed(that'length-1 downto 0) is that;
    variable ret : signed(width-1 downto 0);
  begin
    if temp'length = 0 then
       ret := (others => '0');
    elsif temp'length >= width then
       ret := temp(width-1 downto 0);
    else
       ret := resize(temp,width);
    end if;
    return ret;
  end pkg_resize;

  function pkg_toString (that : std_logic_vector) return string is
    variable ret : string((that'length-1)/4 downto 0);
    constant chars : string := "0123456789abcdef";
    variable left : natural;
  begin
    for i in ret'range loop
      left := i*4+3;
      if left > that'left then
        left := that'left;
      end if;
      ret(i) := chars(to_integer(unsigned(that(left downto i*4)))+1);
    end loop;
    return "x" & '"' & ret & '"';
  end pkg_toString;
  function pkg_toString (that : unsigned) return string is
  begin
    if that > 0 then
      return pkg_toString(that / 10) & integer'image(to_integer(that mod 10));
    else
      return "";
    end if;
  end pkg_toString;
  function pkg_toString (that : signed) return string is
  begin
    if that < 0 then
      return "-" & pkg_toString(0 - pkg_resize(that, that'length + 1));
    elsif that > 0 then
      return pkg_toString(that / 10) & integer'image(to_integer(that mod 10));
    else
      return "";
    end if;
  end pkg_toString;
end pkg_scala2hdl;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity UnsignedDivider is
  port(
    io_flush : in std_logic;
    io_cmd_valid : in std_logic;
    io_cmd_ready : out std_logic;
    io_cmd_payload_numerator : in unsigned(63 downto 0);
    io_cmd_payload_denominator : in unsigned(31 downto 0);
    io_rsp_valid : out std_logic;
    io_rsp_ready : in std_logic;
    io_rsp_payload_quotient : out unsigned(63 downto 0);
    io_rsp_payload_remainder : out unsigned(31 downto 0);
    io_rsp_payload_error : out std_logic;
    clk : in std_logic
  );

end UnsignedDivider;

architecture arch of UnsignedDivider is

  signal done : std_logic := pkg_toStdLogic(true);
  signal waitRsp : std_logic := pkg_toStdLogic(false);
  signal counter_willIncrement : std_logic;
  signal counter_willClear : std_logic;
  signal counter_valueNext : unsigned(5 downto 0);
  signal counter_value : unsigned(5 downto 0) := pkg_unsigned("000000");
  signal counter_willOverflowIfInc : std_logic;
  signal counter_willOverflow : std_logic;
  signal numerator : unsigned(63 downto 0);
  signal denominator : unsigned(31 downto 0);
  signal remainder : unsigned(31 downto 0);
  signal remainderShifted : unsigned(32 downto 0);
  signal remainderMinusDenominator : unsigned(32 downto 0);
  signal when_Divider_l109 : std_logic;
  signal when_Divider_l128 : std_logic;
begin
  process(done)
  begin
    counter_willIncrement <= pkg_toStdLogic(false);
    if done = '0' then
      counter_willIncrement <= pkg_toStdLogic(true);
    end if;
  end process;

  process(done,when_Divider_l109)
  begin
    counter_willClear <= pkg_toStdLogic(false);
    if done = '1' then
      if when_Divider_l109 = '1' then
        counter_willClear <= pkg_toStdLogic(true);
      end if;
    end if;
  end process;

  counter_willOverflowIfInc <= pkg_toStdLogic(counter_value = pkg_unsigned("111111"));
  counter_willOverflow <= (counter_willOverflowIfInc and counter_willIncrement);
  process(counter_value,counter_willIncrement,counter_willClear)
  begin
    counter_valueNext <= (counter_value + pkg_resize(unsigned(pkg_toStdLogicVector(counter_willIncrement)),6));
    if counter_willClear = '1' then
      counter_valueNext <= pkg_unsigned("000000");
    end if;
  end process;

  remainderShifted <= unsigned(pkg_cat(std_logic_vector(remainder),pkg_toStdLogicVector(pkg_extract(numerator,63))));
  remainderMinusDenominator <= (remainderShifted - pkg_resize(denominator,33));
  process(done,when_Divider_l109,counter_willOverflowIfInc)
  begin
    io_cmd_ready <= pkg_toStdLogic(false);
    if done = '1' then
      if when_Divider_l109 = '1' then
        io_cmd_ready <= pkg_toStdLogic(true);
      end if;
    else
      if counter_willOverflowIfInc = '1' then
        io_cmd_ready <= pkg_toStdLogic(true);
      end if;
    end if;
  end process;

  io_rsp_valid <= waitRsp;
  io_rsp_payload_quotient <= numerator;
  io_rsp_payload_remainder <= remainder;
  io_rsp_payload_error <= pkg_toStdLogic(denominator = pkg_unsigned("00000000000000000000000000000000"));
  when_Divider_l109 <= ((not waitRsp) or io_rsp_ready);
  when_Divider_l128 <= (not pkg_extract(remainderMinusDenominator,32));
  process(clk)
  begin
    if rising_edge(clk) then
      counter_value <= counter_valueNext;
      if io_rsp_ready = '1' then
        waitRsp <= pkg_toStdLogic(false);
      end if;
      if done = '1' then
        if when_Divider_l109 = '1' then
          done <= (not io_cmd_valid);
        end if;
      else
        if counter_willOverflowIfInc = '1' then
          done <= pkg_toStdLogic(true);
          waitRsp <= pkg_toStdLogic(true);
        end if;
      end if;
      if io_flush = '1' then
        done <= pkg_toStdLogic(true);
        waitRsp <= pkg_toStdLogic(false);
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if done = '1' then
        if when_Divider_l109 = '1' then
          remainder <= pkg_unsigned("00000000000000000000000000000000");
          numerator <= io_cmd_payload_numerator;
          denominator <= io_cmd_payload_denominator;
        end if;
      else
        remainder <= pkg_resize(remainderShifted,32);
        numerator <= pkg_resize(unsigned(pkg_cat(std_logic_vector(numerator),pkg_toStdLogicVector((not pkg_extract(remainderMinusDenominator,32))))),64);
        if when_Divider_l128 = '1' then
          remainder <= pkg_resize(remainderMinusDenominator,32);
        end if;
      end if;
    end if;
  end process;

end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity DividerLib is
  port(
    io_enable : in std_logic;
    io_divisor_i : in unsigned(31 downto 0);
    io_divider_i : in unsigned(63 downto 0);
    io_quot_rdy : out std_logic;
    io_quot : out unsigned(31 downto 0);
    clk : in std_logic
  );

end DividerLib;

architecture arch of DividerLib is
  signal divider_io_cmd_ready : std_logic;
  signal divider_io_rsp_valid : std_logic;
  signal divider_io_rsp_payload_quotient : unsigned(63 downto 0);
  signal divider_io_rsp_payload_remainder : unsigned(31 downto 0);
  signal divider_io_rsp_payload_error : std_logic;

begin
  divider : entity work.UnsignedDivider
    port map ( 
      io_flush => pkg_toStdLogic(false),
      io_cmd_valid => io_enable,
      io_cmd_ready => divider_io_cmd_ready,
      io_cmd_payload_numerator => io_divider_i,
      io_cmd_payload_denominator => io_divisor_i,
      io_rsp_valid => divider_io_rsp_valid,
      io_rsp_ready => pkg_toStdLogic(true),
      io_rsp_payload_quotient => divider_io_rsp_payload_quotient,
      io_rsp_payload_remainder => divider_io_rsp_payload_remainder,
      io_rsp_payload_error => divider_io_rsp_payload_error,
      clk => clk 
    );
  io_quot_rdy <= divider_io_rsp_valid;
  io_quot <= pkg_resize(divider_io_rsp_payload_quotient,32);
end arch;


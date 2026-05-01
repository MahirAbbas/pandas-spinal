-- Generator : SpinalHDL v1.12.3    git head : 591e64062329e5e2e2b81f4d52422948053edb97
-- Component : filter
-- Git hash  : 2e7de20413f9127924b0559f2c9e56a2b50875c1

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


entity Divider is
  port(
    io_enable : in std_logic;
    io_divisor_i : in unsigned(31 downto 0);
    io_divider_i : in unsigned(63 downto 0);
    io_quot_rdy : out std_logic;
    io_quot : out unsigned(31 downto 0);
    clk : in std_logic
  );

end Divider;

architecture arch of Divider is

  signal stop : std_logic := pkg_toStdLogic(false);
  signal enable : std_logic := pkg_toStdLogic(false);
  signal index : unsigned(4 downto 0) := pkg_unsigned("00000");
  signal divider_1 : unsigned(63 downto 0) := pkg_unsigned("0000000000000000000000000000000000000000000000000000000000000000");
  signal result : unsigned(31 downto 0) := pkg_unsigned("00000000000000000000000000000000");
  signal divider_comp : unsigned(31 downto 0);
  signal when_divider_l36 : std_logic;
  signal offset : unsigned(4 downto 0);
  signal window : unsigned(31 downto 0);
  signal when_divider_l49 : std_logic;
  signal when_divider_l54 : std_logic;
begin
  when_divider_l36 <= (stop and enable);
  offset <= (pkg_unsigned("11111") - index);
  window <= pkg_resize(pkg_shiftRight(divider_1,offset),32);
  when_divider_l49 <= pkg_toStdLogic(io_divisor_i <= window);
  when_divider_l54 <= pkg_toStdLogic(index /= pkg_unsigned("11111"));
  process(clk)
  begin
    if rising_edge(clk) then
      if io_enable = '1' then
        enable <= pkg_toStdLogic(true);
        divider_1 <= io_divider_i;
      else
        if when_divider_l36 = '1' then
          enable <= pkg_toStdLogic(false);
        end if;
      end if;
      stop <= pkg_toStdLogic(index = pkg_unsigned("11111"));
      if enable = '1' then
        if when_divider_l49 = '1' then
          result(to_integer(offset)) <= pkg_toStdLogic(true);
          divider_1(31 + to_integer(offset) downto to_integer(offset)) <= (window - io_divisor_i);
        end if;
        if when_divider_l54 = '1' then
          index <= (index + pkg_unsigned("00001"));
        end if;
      else
        index <= pkg_unsigned("00000");
        result <= pkg_unsigned("00000000000000000000000000000000");
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if io_enable = '0' then
        if when_divider_l36 = '1' then
          io_quot_rdy <= pkg_toStdLogic(true);
          io_quot <= result;
        else
          io_quot_rdy <= pkg_toStdLogic(false);
        end if;
      end if;
      if enable = '1' then
        if when_divider_l49 = '1' then
          divider_comp <= window;
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


entity filter is
  port(
    io_mode : in std_logic_vector(31 downto 0);
    io_inp : in std_logic_vector(31 downto 0);
    io_trig : in std_logic;
    io_enable : in std_logic;
    io_out_o : out std_logic_vector(31 downto 0) := pkg_stdLogicVector("00000000000000000000000000000000");
    io_health : out std_logic_vector(31 downto 0) := pkg_stdLogicVector("00000000000000000000000000000000");
    io_ready : out std_logic;
    clk : in std_logic
  );

end filter;

architecture arch of filter is
  signal divider_1_io_divisor_i : unsigned(31 downto 0);
  signal divider_1_io_divider_i : unsigned(63 downto 0);
  signal divider_1_io_quot_rdy : std_logic;
  signal divider_1_io_quot : unsigned(31 downto 0);

  signal stop : std_logic := pkg_toStdLogic(false);
  signal trig_dly : std_logic := pkg_toStdLogic(false);
  signal result_neg : std_logic := pkg_toStdLogic(false);
  signal trig_div_dly : std_logic := pkg_toStdLogic(false);
  signal div_enabled : std_logic := pkg_toStdLogic(false);
  signal quot_rdy_o : std_logic;
  signal enable_i_dly : std_logic := pkg_toStdLogic(false);
  signal trig_div_i : std_logic := pkg_toStdLogic(false);
  signal accum_of_err : std_logic := pkg_toStdLogic(false);
  signal div_enabled_err : std_logic := pkg_toStdLogic(false);
  signal latch : signed(31 downto 0) := pkg_signed("00000000000000000000000000000000");
  signal sum_i : signed(63 downto 0) := pkg_signed("0000000000000000000000000000000000000000000000000000000000000000");
  signal sum_num : unsigned(31 downto 0) := pkg_unsigned("00000000000000000000000000000000");
  signal quot_o : signed(31 downto 0);
  signal divisor_i : signed(31 downto 0) := pkg_signed("00000000000000000000000000000000");
  signal divider_i : signed(63 downto 0) := pkg_signed("0000000000000000000000000000000000000000000000000000000000000000");
  signal difference : std_logic;
  signal average : std_logic;
  signal when_filter_l37 : std_logic;
  signal when_filter_l38 : std_logic;
  signal when_filter_l41 : std_logic;
  signal when_filter_l39 : std_logic;
  signal when_filter_l47 : std_logic;
  signal when_filter_l57 : std_logic;
  signal when_filter_l64 : std_logic;
  signal when_filter_l67 : std_logic;
  signal when_filter_l46 : std_logic;
  signal when_filter_l80 : std_logic;
  signal when_filter_l85 : std_logic;
  signal when_filter_l92 : std_logic;
  signal when_filter_l95 : std_logic;
begin
  divider_1 : entity work.Divider
    port map ( 
      io_enable => trig_div_i,
      io_divisor_i => divider_1_io_divisor_i,
      io_divider_i => divider_1_io_divider_i,
      io_quot_rdy => divider_1_io_quot_rdy,
      io_quot => divider_1_io_quot,
      clk => clk 
    );
  difference <= pkg_toStdLogic(false);
  average <= pkg_toStdLogic(true);
  when_filter_l37 <= pkg_toStdLogic(pkg_extract(io_mode,0) = difference);
  when_filter_l38 <= (io_enable and (not enable_i_dly));
  when_filter_l41 <= (not stop);
  when_filter_l39 <= (io_trig and (not trig_dly));
  when_filter_l47 <= (not stop);
  when_filter_l57 <= (io_enable and (not enable_i_dly));
  when_filter_l64 <= (io_trig and enable_i_dly);
  when_filter_l67 <= pkg_extract(sum_i,63);
  when_filter_l46 <= pkg_toStdLogic(pkg_extract(io_mode,0) = average);
  when_filter_l80 <= (trig_div_i and (not trig_div_dly));
  when_filter_l85 <= ((div_enabled and io_enable) and (not enable_i_dly));
  when_filter_l92 <= (io_enable and (not enable_i_dly));
  when_filter_l95 <= (accum_of_err or div_enabled_err);
  divider_1_io_divisor_i <= unsigned(divisor_i);
  divider_1_io_divider_i <= unsigned(divider_i);
  quot_rdy_o <= divider_1_io_quot_rdy;
  quot_o <= signed(divider_1_io_quot);
  process(clk)
  begin
    if rising_edge(clk) then
      enable_i_dly <= io_enable;
      trig_dly <= io_trig;
      if when_filter_l37 = '1' then
        if when_filter_l38 = '1' then
          latch <= signed(io_inp);
        else
          if when_filter_l39 = '1' then
            latch <= signed(io_inp);
            if when_filter_l41 = '1' then
              io_out_o <= std_logic_vector((signed(io_inp) - latch));
            end if;
          end if;
        end if;
      else
        if when_filter_l46 = '1' then
          if when_filter_l47 = '1' then
            if quot_rdy_o = '1' then
              if result_neg = '1' then
                io_out_o <= std_logic_vector((- quot_o));
              else
                io_out_o <= std_logic_vector(quot_o);
              end if;
            end if;
          end if;
          if when_filter_l57 = '1' then
            sum_i <= pkg_signed("0000000000000000000000000000000000000000000000000000000000000000");
            sum_num <= pkg_unsigned("00000000000000000000000000000000");
          else
            if enable_i_dly = '1' then
              sum_i <= (sum_i + pkg_resize(signed(io_inp),64));
              sum_num <= (sum_num + pkg_unsigned("00000000000000000000000000000001"));
            end if;
          end if;
          if when_filter_l64 = '1' then
            trig_div_i <= pkg_toStdLogic(true);
            divisor_i <= signed(sum_num);
            if when_filter_l67 = '1' then
              result_neg <= pkg_toStdLogic(true);
              divider_i <= (- sum_i);
            else
              result_neg <= pkg_toStdLogic(false);
              divider_i <= sum_i;
            end if;
          else
            trig_div_i <= pkg_toStdLogic(false);
          end if;
        end if;
      end if;
      trig_div_dly <= trig_div_i;
      if when_filter_l80 = '1' then
        div_enabled <= pkg_toStdLogic(true);
        if div_enabled = '1' then
          div_enabled_err <= pkg_toStdLogic(true);
        end if;
      else
        if when_filter_l85 = '1' then
          div_enabled_err <= pkg_toStdLogic(true);
        else
          if quot_rdy_o = '1' then
            div_enabled <= pkg_toStdLogic(false);
            div_enabled_err <= pkg_toStdLogic(false);
          end if;
        end if;
      end if;
      accum_of_err <= (pkg_extract(sum_i,63) xor pkg_extract(sum_i,62));
      if when_filter_l92 = '1' then
        stop <= pkg_toStdLogic(false);
        io_health <= pkg_stdLogicVector("00000000000000000000000000000000");
      else
        if when_filter_l95 = '1' then
          stop <= pkg_toStdLogic(true);
          io_health(0) <= (pkg_extract(sum_i,63) xor pkg_extract(sum_i,62));
          io_health(1) <= div_enabled_err;
        end if;
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if when_filter_l37 = '1' then
        if when_filter_l38 = '0' then
          if when_filter_l39 = '1' then
            if when_filter_l41 = '1' then
              io_ready <= pkg_toStdLogic(true);
            end if;
          else
            io_ready <= pkg_toStdLogic(false);
          end if;
        end if;
      else
        if when_filter_l46 = '1' then
          if when_filter_l47 = '1' then
            io_ready <= quot_rdy_o;
          end if;
        end if;
      end if;
    end if;
  end process;

end arch;


----------------------------------------------------------------------------------
-- Company : RIT
-- Engineer: Erez Binyamin
--
-- Create Date:    20:20:52 10/03/2017
-- Design Name:
-- Module Name:    Multiplier - Structural
-- Project Name:
-- Target Devices:
-- Tool versions:
-- Description:
--
-- Dependencies: Full_Adder_Nbit
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-----------------------------------------------------------
----------         Example for n = 3             ----------
-- *                                                      *
-- *       A     A      ... A                             *
-- *        n-1   n-2        0                            *
-- *    X                             Initial A,B values  *
-- *       B     B      ... B         (n-1 downto 0)      *
-- *        n-1   n-2        0                            *
-- *     ---------------------------                      *
-- *       000 000 A B  A B  A B                          *
-- *       000 000 AND  AND  AND                          *
-- *    +                                                 *
-- *       000 A B A B  A B  000      Partial products    *
-- *       000 AND AND  AND  000      (2n-2 downto 0)     *
-- *    +                                                 *
-- *       A B A B A B  000  000                          *
-- *       AND AND AND  000  000                          *
-- *     ---------------------------                      *
-- *                                                      *
-- *     Cout  SUM SUM SUM SUM SUM    Final Product       *
-- *                                  (2n-1 downto 0)     *
-----------------------------------------------------------
entity Multiplier is
    generic (n : integer := 4);
    port
     (
          A         :   in     STD_LOGIC_VECTOR(n-1 downto 0);
          B         :   in     STD_LOGIC_VECTOR(n-1 downto 0);
          Product   :   out    STD_LOGIC_VECTOR(((2*n)-1) downto 0)
     );
end Multiplier;

architecture Structural of Multiplier is
begin
	Product <= (SIGNED(A) * SIGNED(B));
end Structural;

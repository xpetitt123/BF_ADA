package Brainfuck is
   -- Define types
   type Code is array (Natural range <>) of Character;
   type Byte is mod 256;
   type TapePos is
     range 0 .. 29999;  -- Tape size (30000 cells typical for Brainfuck)
   type Tape is array (TapePos) of Byte;

   procedure Interpret (coderino : Code);

end Brainfuck;

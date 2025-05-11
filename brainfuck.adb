with Ada.Text_IO; use Ada.Text_IO;

package body Brainfuck is
   procedure Interpret (coderino : Code) is
      C             : Character;
      command       : Character;
      taperino      : Tape := (others => 0);
      tapePosition  : TapePos := 0;
      codePosition  : Natural := 0;
      open_brackets : Integer := 0;
   begin
      while codePosition < coderino'Length loop
         command := coderino (codePosition);
         case command is
            when '>' =>
               if tapePosition < Tape'Last then
                  tapePosition := tapePosition + 1;
               else
                  Put_Line ("Error: Tape pointer out of bounds!");
                  exit;
               end if;

            when '<' =>
               if tapePosition > Tape'First then
                  tapePosition := tapePosition - 1;
               else
                  Put_Line ("Error: Tape pointer out of bounds!");
                  exit;
               end if;

            when '+' =>
               taperino (tapePosition) := taperino (tapePosition) + 1;

            when '-' =>
               taperino (tapePosition) := taperino (tapePosition) - 1;

            when '.' =>
               Put (Character'Val (taperino (tapePosition)));

            when ',' =>
               Put_Line ("Input one char: ");
               Get (C);
               taperino (tapePosition) := Character'Pos (C);

            when '[' =>
               if taperino (tapePosition) = 0 then
                  open_brackets := 1;
                  while open_brackets /= 0 loop
                     codePosition := codePosition + 1;
                     if coderino (codePosition) = '[' then
                        open_brackets := open_brackets + 1;
                     elsif coderino (codePosition) = ']' then
                        open_brackets := open_brackets - 1;
                     end if;
                  end loop;
               end if;

            when ']' =>
               if taperino (tapePosition) /= 0 then
                  open_brackets := 1;
                  while open_brackets /= 0 loop
                     codePosition := codePosition - 1;
                     if coderino (codePosition) = ']' then
                        open_brackets := open_brackets + 1;
                     elsif coderino (codePosition) = '[' then
                        open_brackets := open_brackets - 1;
                     end if;
                  end loop;
               end if;

            when others =>
               Put_Line ("Invalid character encountered!");
               exit;
         end case;
         codePosition := codePosition + 1;
      end loop;
   end Interpret;
end Brainfuck;

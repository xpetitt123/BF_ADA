with Brainfuck; use Brainfuck;

procedure Main is
   -- Example Brainfuck program (Hello World)
   X : constant Code :=
     "++++++++[>++++[>++>+++>+++>+<<<<-]>+>+>->>+[<]<-]>>.>---.+++++++..+++.>>.<-.<.+++.------.--------.>>+.>++.";

begin
   Interpret (X);
end Main;

uses crt;
var a,c:integer;
begin
 a:=0;c:=0;
 repeat
 a:=a+c;c:=c+2;
 until a>10;
 writeln('a =',a,' c= ',c);
end.

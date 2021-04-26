program for_perulangan; //nama program
uses crt;

var a,b:integer;
	
begin
	for a:=1 to 3 do//3x
		begin
			writeln('a= ',a);
			for b:= 10 downto 8  do writeln('b= ',b,'saya belajar loop');
		end;
end.


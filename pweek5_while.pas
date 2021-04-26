program perulangan_while;
uses crt;
var a,b:integer;

begin
	a:=10;
	b:=0;
	
	while(a <= 50 )do
	begin
		writeln('a= ',a,' b=',b);
		b:=b+a;
		a:=a+10;
	end;
end.

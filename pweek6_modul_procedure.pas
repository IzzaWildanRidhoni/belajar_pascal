program passbyValuedanbyreference;
uses crt;

procedure passByValue(x:integer);
begin
	x:=x+4;
	writeln('nilai x setelah x+4 : ',x);
end;

procedure passByReference(var y:integer);//parameter formal
begin
	y:=y+4;
	writeln('nilai y setelah y+4 : ',y);
end;

var x,y:integer;
	
begin
	write('masukkan nilai x : ');readln(x);
	passByValue(x);//parameter actual 
	writeln(' nilai x : ',x);
	write('masukkan nilai y : ');readln(y);
	passByReference(y);//parameter actual akan berubah kalau pakai passByreference
	write(' nilai y : ',y);
	readkey;
end.


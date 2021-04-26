program latihanweek9;
uses crt;
var a,b:integer;

procedure coba1(x,y:integer);//melewatkan parameter value semua
begin
	writeln('nilai x =',x,' y = ',y);
	x:=x+3;y:=y+x;
	writeln('nilai x =',x,' y = ',y);
end;

procedure coba2(var x:integer ;y:integer);//melewatkan parameter secara acuan dan value
begin
	//karena pakai var nilai variabel a akan berubah sesuai dengan nilai x
	//variabel y tidak akan merubah nilai b karena tidak menggunakan var
	writeln('nilai x =',x,' y = ',y);
	x:=x+3;y:=y+x;
	writeln('nilai x =',x,' y = ',y);
end;

begin //program utama acuan 
	writeln('menguji pengiriman parameter di modul');
	write('masukkan a = ');readln(a);
	write('masukkan b = ');readln(b);
	writeln('anda menginputkan a = ',a,' dan b = ',b);
	coba1(a,b);
	writeln('nilai a= ',a,' b = ',b);
	coba2(a,b);
	writeln('nilai a= ',a,' b = ',b);
	coba2(b,a);
	writeln('nilai a= ',a,' b = ',b);
end.

program praktikum_pd;
uses crt;

function _menghitungLuas(x:integer) : integer;
var hasil:integer;
begin
	hasil:=x*x;
	_menghitungLuas:=hasil;
end;

var sisi:integer;
	luas:integer;

begin
	write('masukkan sisi persegi :');readln(sisi);
	
	luas:=_menghitungLuas(sisi);
	
	writeln('hasil luas : ',luas);
end.


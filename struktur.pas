program mencari_bil_ganjil;
uses crt;

var i,bil_pertama,bil_akhir:integer;
begin
	writeln('program mencari bilangan ganjil');
	writeln;
	write('masukkan bilangan pertama = ');readln(bil_pertama);
	write('masukkan bilangan akhir = ');readln(bil_akhir);
	
	for i:=bil_pertama to bil_akhir do
	begin
		if(i mod 2 = 1) then writeln(i);
	end;
	
end.

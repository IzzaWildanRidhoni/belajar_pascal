program kondisional;
uses crt;

var a:integer;
	ket,ya:string;
	
label ulang;
begin
	ulang:
	write('Masukkan Angka : ');readln(a);
	//kondisional statement
	if(a = 0) then ket:=' Bilangan nol'
		//bisa pakai titik koma asal ada begin dan end
	else if(a mod 2 = 0) and (a > 0) then ket:=' bilangan positif'
	else if(a mod 2 = 0) and (a < 0) then ket:=' bilangan negatif'
	else if(a mod 2 <> 0) and (a > 0) then ket:=' bilangan ganjil positif'
	else
		ket:='bilangan ganjil negatif';
	
	writeln(a,' adalah ',ket);
	
	writeln('apakah anda ingin mengulang ?');readln(ya);
	if(ya='y') OR (ya='Y') then goto ulang
	else
		writeln('terimakasih')
	
end.

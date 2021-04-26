program week5_case;
uses crt;

var nilai,ya:char;
	angka:integer;
label ulang;
begin
	ulang:
	writeln('menentukan predikat kelulusan nilai mahasiswa ');
	write('masukkan nilai anda 0-100 : ');readln(angka);
	if(angka <0) or (angka >100) then begin writeln('nilai tidak valid ulangi');goto ulang;end;
	
	////menentukan nilai huruf dengan case
	case angka of
	80 .. 100:nilai :='A';60 .. 78:nilai:='B';40 .. 59 : nilai:='C';20 .. 39:nilai:='D';0 .. 19:nilai:='E';end;
	writeln('nilai anda adalah',nilai);
	
	//pakai if
	if(angka >=80)then nilai:='A' else if(angka >=60)then nilai:='B' else if(angka >40)then nilai:='C' else if(angka >=20)then nilai:='D' else nilai:='E';
	writeln('nilai anda adalah',nilai);
	case nilai of
	'A':writeln('selamat predikat nilai anda Outstanding');
	'B':writeln('selamat predikat nilai anda baik');
	'C':writeln('anda mendapatkan predikat cukup');
	'D':writeln('anda mendapatkan predikat kurang memuaskan');
	'E':writeln('anda harus mengulang mata kuliah ini karena anda tidak lulus');
	else writeln('inputan nilai salah');end;
	
	//menggunakan if
	if(nilai='A') then writeln('predikat nilai anda adalah amat baik') else
	if(nilai='B') then writeln('predikat nilai anda adalah  baik') else
	if(nilai='C') then writeln('predikat nilai anda adalah cukup') else
	if(nilai='D') then writeln('predikat nilai anda adalah kurang') else
	if(nilai='E') then writeln('anda tidak lulus') else writeln('nilai tidak valid');
	writeln;
	write('apakah anda mencoba lagi<y/t>?');readln(ya);
	if(ya='Y')or(ya='y') then goto ulang else writeln('terimakasih sudah mencoba program ini');
	end.
end.

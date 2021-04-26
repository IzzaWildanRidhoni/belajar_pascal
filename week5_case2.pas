program week5_case_menu;
uses crt;
const phi=22/7;
var pil:byte;
	a,b:integer;
	Luas,Volum,Kel,m:real;
	ya:char;
label ulang;

begin
	ulang:
	clrscr;//clear screen membersikan layar
	writeln('1.hitung luas dan keliling lingkaran');
	writeln('2.hitung luas dan volume bola');
	writeln('3.hitung luas dan volume kubus');
	writeln('4.hitung luas dan volume silinder');
	writeln('0.keluar');
	writeln('pilih menu (0-4)');readln(pil);
	case pil of
	1:begin
		write('masukkan panjang alas :');readln(a);
		write('masukkan tinggi :');readln(b);
		Luas:=0.5*a*b;
		m:=sqrt(sqr(a)+sqr(b));
		kel:=a+b+m;
		writeln('Luas segitiga = ',Luas:6:3);
		writeln('keliling segitiga = ',Kel:6:3);
	end;
	2:begin
		write('masukkan jari jari bola = ');readln(a);
		Luas:=4*phi*sqr(a);
		volum:=4/3*phi*a*a*a;
		writeln('Luas Bola= ',Luas:6:3);
		writeln('Volume Bola = ',Volum:6:3);
	end;
	3:begin
		write('masukkan panjang rusuk kubus :');readln(a);
		write('masukkan tinggi :');readln(b);
		Volum:=a*a*a;
		Luas:=6*a*a;
		writeln('volume kubus = ',Volum:6:3);
		writeln('luas kubus = ',Luas:6:3);
	end;
	4:begin
		write('masukkan jari jari silinder :');readln(a);
		write('masukkan tinggi');readln(b);
		Luas:=2*phi*a*b;
		volum:=phi*sqr(a)*b;
		writeln('Volume silinder= ',Volum:6:3);
		writeln('luas silinder = ',Luas:6:3);
	end;
	0:writeln('terimakasih');
	else 
		begin 
			writeln('yang anda inputkan salah');goto ulang;
		end;
	end;//end case;
	
	writeln;
	write('mau coba lagi? y/t : ');readln(ya);
	if(ya='y')or(ya='Y') then goto ulang;
	

end.

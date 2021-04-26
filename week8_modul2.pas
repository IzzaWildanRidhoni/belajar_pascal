program bangun_datar;
uses crt;

var pil:byte;
	a,b:integer;
	
	
procedure segitiga(x,y:integer);
var luas,keliling,miring:real;
begin
	luas:=0.5*x*y;
	miring:=sqrt(sqr(x)+sqr(y));
	keliling:=x+y+miring;
	writeln('luas segitiga =',luas:6:2,' cm2 , dan kelilingnya =',keliling:6:2,'cm');
end;

procedure persegi_panjang(x,y:integer);
var luas,keliling:longint;
begin
	luas:=x*y;keliling:=2*x+2*y;
	writeln('luas persegi panjang : ',luas:6,' cm2 , dan kelilingnya =',keliling:6,'cm');
end;

procedure lingkaran(x:integer);
const phi=22/7;
var luas,keliling:real;
begin
	luas:=phi*x*x;keliling:=2*phi*x;
	writeln('luas lingkaran: ',luas:6:2,' cm2 , dan kelilingnya =',keliling:6:2,'cm');
end;

procedure tabung(x,y:integer);
const phi=22/7;
var luas,volume:real;
begin
	volume:=phi*x*x*y;luas:=2*phi*x*y;
	writeln('luas tabung : ',luas:6:2,' cm2 , dan kelilingnya =',volume:6:2,'cm3');
end;


begin
repeat
	clrscr;
	writeln('menghitung luas dan volume bangun');
	writeln('1.segitiga');
	writeln('2.persegi panjang/ persegi');
	writeln('3.lingjaran');
	writeln('4.Tabung');
	writeln('0.selesai');
	write('masukkan pilihan anda 0-4 : ');readln(pil);
	case pil of
	1:begin 
		write('masukkan panjang alas : ');readln(a);
		write('masukkan tinggi : ');readln(b);
		segitiga(a,b);
	  end;
	2:begin
		write('masukkan panjang : ');readln(a);
		write('masukkan lebar : ');readln(b);
		persegi_panjang(a,b);
	  end;
	3:begin
		write('masukkan jari jari : ');readln(a);
		lingkaran(a);
	  end;
	4:begin
		write('masukkan jari jari tabung : ');readln(a);
		write('masukkan tinggi tabung : ');readln(b);
		tabung(a,b);
	  end;
	0:writeln('terimakasih telah mencoba progra ini');
	else writeln('anda salah pilih menu');
	end;
	readln;
until(pil = 0);
		
end.

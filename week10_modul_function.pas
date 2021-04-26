program week10_function;
uses crt;

var a,b,pil:byte;

procedure input_data(var x,y:byte);
begin
	write('masukkan a = ');readln(x);
	write('masukkan b = ');readln(y);
end;

function faktor(x:byte):longint;
begin
	if(x=0) then faktor:=1 else faktor:=x*faktor(x-1);
end;

function kali(x,y:byte):longint;
begin 
	kali:=x*y;
end;

function bagi(x,y:byte):real;
begin
	bagi:=x/y;
end;

begin
repeat
	clrscr;
	writeln('pilih menu ');
	writeln('1.isi data ');
	writeln('2.hitung faktorial bilangan');
	writeln('3.Hitung permutasi kombinasi');
	writeln('4.Hitung perkalian dan pembagian');
	writeln('0.selsesai');
	write('pilih menu 0-4 = ');readln(pil);
	case pil of
	1:begin
		writeln('Input data :');
		input_data(a,b);
	end;
	2:begin
		writeln('Nilai faktorial dari ',a,' adalah ',faktor(a));
		writeln('Nilai faktorial dari ',b,' adalah ',faktor(b));
	end;
	3:begin
		if(b<=a)then
		begin
			writeln('Permutasi  ',b,' dari ',a,' adalah ',faktor(a)/faktor(a-b):6:0,' kemungkinan');
			writeln('Kombinasi  ',b,' dari ',a,' adalah ',faktor(a)/(faktor(a-b)*faktor(b)):6:0,' kemungkinan');
		end
		else writeln('tidak bisa dilakukan perhitungan kombinasi dan permutasi');
		
	end;
	4:begin
		writeln('hitung ',a,' * ',b,' = ',kali(a,b));
		writeln('hitung ',a,' / ',b,' = ',bagi(a,b):6:2,' sedangkan ',b,' / ',a,' = ',bagi(b,a):6:2);
		
	end;
	0:begin
		writeln('terimakasih');
	end;
	end;//end 
	readln;
until pil = 0;
end.


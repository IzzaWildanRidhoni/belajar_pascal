program prosedur_dan_fungsi;
uses crt;

var pil:integer;
	

procedure konversiUang();
var konvert:real;
	uang:longint;
begin
	write('masukkan Uang rupiah : Rp.');
	readln(uang);
	konvert:=uang*0.000071;
	writeln('Rp.',uang,' = ',konvert:6:2,' dolar');
end;

procedure konversiSuhu();
var k,f,r:real;
	celsius:integer;
begin
	write('Masukkan Suhu celcius :');
	readln(celsius);
	
	k:=celsius+275.15;
	f:=celsius*1.8+32;
	r:=celsius*0.8;
	writeln(celsius,' celcius = ',k:6:2,' K');
	writeln(celsius,' celcius = ',f:6:2,' F');
	writeln(celsius,' celcius = ',r:6:2,' R');
end;

procedure konversiPanjang();
var dm,cm,mm,panjang:integer;
begin
	write('Masukkan panjang meter : ');
	readln(panjang);

	dm:=panjang*10;
	cm:=panjang*100;
	mm:=panjang*1000;
	
	writeln(panjang,' m ke dm = ',dm,' dm ');
	writeln(panjang,' m ke cm = ',cm,' cm ');
	writeln(panjang,' m ke mm = ',mm,' mm ');
	
end;

begin
	writeln('1.Konversi uang');
	writeln('2.Konversi Suhu');
	writeln('3.Konversi Panjang');
	writeln('0.selesai');
	write('Masukkan pilihan [0-3] : ');
	readln(pil);
	case pil of
		1:begin
			konversiUang();
		  end;
		2:begin
			konversiSuhu();
		  end;
		3:begin
			konversiPanjang();
		  end;
		0:begin
			writeln('terimakasih');
		  end;
		else begin
			writeln('anda salah menginputkan pilihan ');
		end;
	
	end;
	
end.


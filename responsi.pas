program convertNilai_dan_cariIPK;
uses crt;

var pil:byte;
	nama,nim,mk1,mk2,mk3:string;
	nmk1,nmk2,nmk3:real;
	ulang:boolean;
	

function konvertNM(n:real):string;
var kn:string;
	
begin
		if(n >= 81) and (n <=100) then kn:='A "sangat baik"'
		else if(n >= 61) then kn:='B "baik"'
		else if(n >= 41) then kn:='C "cukup"'
		else if(n >= 21) then kn:='D "kurang"'
		else kn:='E "sangat kurang"';
		konvertNM:=kn;
end;		
		

procedure cetakNilai(mk1:string;mk2:string;mk3:string;nmk1:real;nmk2:real;nmk3:real);
var  ip,total:real;
begin
	writeln('nilai ',mk1,' = ',konvertNM(nmk1));
	writeln('nilai ',mk2,' = ',konvertNM(nmk2));
	writeln('nilai ',mk3,' = ',konvertNM(nmk3));
	
	total:=nmk1+nmk2+nmk3;
	ip:=(total/3)/25;
	writeln('total nilai = ',total:6:2);
	writeln('ipk = ',ip:6:2);
	
end;

begin
	ulang:=true;
	
	while(ulang) do
	begin
		writeln;
		writeln('Pilih menu dibawah ini ');
		writeln('1.Input Nilai Matkul ');
		writeln('2.Cetak nilai dan IPK ');
		writeln('0.keluar');
		writeln;
		
		
		write('pilih menu diatas : ');readln(pil);
		
		case pil of
		1:begin
			writeln;
			write('Nama : ');readln(nama);
			write('NIM  : ');readln(nim);
			write('nama matkul 1 : ');readln(mk1);
			write('nama matkul 2 : ');readln(mk2);
			write('nama matkul 3 : ');readln(mk3);
			write('masukkan nilai ',mk1,' : ');readln(nmk1);
			write('masukkan nilai ',mk2,' : ');readln(nmk2);
			write('masukkan nilai ',mk3,' : ');readln(nmk3);
			writeln;
		  end;
		 2:begin
			writeln('hasil dari ',nama,' / ',nim);
			cetaknilai(mk1,mk2,mk3,nmk1,nmk2,nmk3);
			readln;
			
		 end;
		 0:ulang:=false;
		end;//end case
	end;
	writeln('terimakasih sudah menggunakan program ini ');
	
	
	
end.

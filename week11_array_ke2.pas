program kasus_array;
uses crt;

const max = 10;
type my_string=array[1..max]of string;
	 my_number=array[1..max]of integer;
	 my_char=array[1..max]of char;
	 
var nim,nama:my_string;
	nilai_angka:my_number;
	nilai_huruf:my_char;
	i,n,pil:byte;ya:char;

function konversi(XX:integer):char;
begin
	if XX>=80 then konversi:='A' else if XX>=60 then konversi:='B' else if XX>=45 then konversi:='C' else if XX >=20 then konversi:='D' else konversi:='E';
end;

//procedure input data
procedure input_data_mhs(var X,Y:my_string;var Z:my_number;var Z1:my_char);
var nim_baru:string;
label ulang;

begin
repeat 
	inc(n);
	writeln('input data mahasiswa ke ',n,' :');
	ulang:
	write('masukkan nim mhs : ');readln(nim_baru);
	//validasi nim supaya unix
	for i:=1 to n do
	begin
		if x[i]=nim_baru then 
		begin 
			writeln('Nim ',nim_baru,'sudah terdaftar, gunakan nim lain');goto ulang;
		end;
	end;
	X[n]:=nim_baru;
	write('masukkan nama mhs : ');readln(Y[n]);
	write('masukkan nilai angka : ');readln(Z[n]);
	Z1[n]:=konversi(Z[n]);//fungsi konversi mendapatkan 	kiriman data nilai angka mhs
	writeln;
	write('apakah akan mengisi data lagi ?');readln(ya);
until(n>10) or (ya<>'y');	
end;


procedure cetak_data_mhs(X,Y:my_string;Z:my_number;Z1:my_char);
begin
	clrscr;
	writeln('Daftar nilai pemrograman dasar');
	writeln('------------------------------');
	writeln('no     nim     nama    nilai    huruf');
	writeln('--------------------------------------');
	for i:=1 to n do 
		writeln(i:2,'  ',X[i]:4,'  ',Y[i]:8,'  ',Z[i]:4,'  ',Z1[i]:5);
	writeln('----------------------------------------');    
end;

//procedure edit data

procedure edit_data_mhs(var X,Y:my_string;var Z:my_number;var Z1:my_char);
var edit:string;pos:byte;ada:boolean;
begin
	ada:=false;
	writeln('edit data mhs ');
	writeln('disini anda hanya diperkenankan mengedit data nilai angka ');
	cetak_data_mhs(X,Y,Z,Z1);
	write('masukkan nim mhs yg akan diedit nilainnya :');readln(edit);
	//cek nim di daftar mhs yg sdh terdaftar
	for i:=1 to n do
	begin
		if X[i]=edit then begin pos:=i;ada:=true;end;
	end;
	//jika ada true
	if ada then
	begin
		writeln('anda akan mengedit data mhs dgn nim = ',edit);
		writeln('nama mhs tsbt adalah = ',Y[pos]);
		writeln('nilai sebelum diedit = ',Z[pos]);
		write('masukkan nilai yang baru  = ');readln(Z[pos]);
		Z1[pos]:=konversi(Z[pos]);
		writeln('editing berhasil');
	end
	else writeln('nim ',edit,' tidak ditemukan ,editing gagal');
	
end;

//hapus data mahasiswa
procedure hapus_data_mhs(var X,Y:my_string;var Z:my_number;var Z1:my_char);
var hapus:string;pos:byte;ada:boolean;
begin
	ada:=false;
	writeln('hapus data mhs ');
	cetak_data_mhs(X,Y,Z,Z1);
	write('masukkan nim mhs yg akan dihapus nilainnya :');readln(hapus);
	//cek nim di daftar mhs yg sdh terdaftar
	for i:=1 to n do
	begin
		if X[i]=hapus then begin pos:=i;ada:=true;end;
	end;
	//jika ada true
	if ada then
	begin
		writeln('berikut adalah data mahasiswa yg akan dihapus datanya :');
		writeln('nim		: ',hapus);
		writeln('nama		: ',Y[pos]);
		writeln('nilai angka: ',Z[pos]);
		writeln('nilai huruf: ',Z1[pos]);
		write('yakin data akan dihapus <y/t>');readln(ya);
		if(ya='y') or (ya='Y') then 
		begin
			for i:=pos to n-1 do 
			begin
				X[i]:=X[i+1];Y[i]:=Y[i+1];Z[i]:=Z[i+1];Z1[i]:=Z1[i+1];
			end;
			dec(n);
			write('data sudah dihapus');
		end
		else writeln('data tidak jadi dihapus');
	end
	else writeln('nim ',hapus,' tidak ditemukan ,hapus gagal');
end;

procedure cari_data_mhs(X,Y:my_string;Z:my_number;Z1:my_char);
var cari:string;ada:boolean;
begin
	ada:=false;
	writeln('mencari data mhs berdasar nama ');
	write('masukkan nama mhs yg dicari :');readln(cari);
	for i:=1 to n do
	begin
		if y[i]=cari then
		begin
			ada:=true;
			writeln('nama : ',cari,' ada di diposisi ke ',i,' sbb :');
			writeln('nim = ',X[i],' nilai angka = ',Z[i],' dan nilai huruf ',Z1[i]);writeln;
		end;
	end;
	if not ada then writeln('nama mhs ',cari,' tidak ditemukan di kelas ini ');

end;

begin
n:=0;
repeat
	clrscr;
	writeln('menu pilihan ');
	writeln('1.tambah mhs');
	writeln('2.cetak mhs');
	writeln('3.edit mhs');
	writeln('4.hapus mhs');
	writeln('5.cari mhs');
	writeln('0.selesai');
	write('pilih menu 0-5 = ');readln(pil);
	case pil of
	1:if n>=max then writeln('kelas sudah penuh ') else input_data_mhs(nim,nama,nilai_angka,nilai_huruf);
	2:if n=0 then writeln('mhs blm terdaftar di kelas,kelas masih kosong') else cetak_data_mhs(nim,nama,nilai_angka,nilai_huruf);
	3:if n=0 then writeln('kelas masih kosong,edit blm bisa dilakukan') else edit_data_mhs(nim,nama,nilai_angka,nilai_huruf);
	4:if n=0 then writeln('kelas masih kosong, mhs blm terdaftar di kelas,hapus blm bisa dilakukan') else hapus_data_mhs(nim,nama,nilai_angka,nilai_huruf);
	5:if n=0 then writeln('kelas masih kosong,cari blm bisa dilakukan') else cari_data_mhs(nim,nama,nilai_angka,nilai_huruf);
	0:writeln('terimkasih ');else writeln('anda salah pilih menu');
	end;
	
	writeln;
	readln;
until pil=0;
end.

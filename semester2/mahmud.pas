program review_record;
uses crt;
const max=10;
type toefl=record
	no_peserta, nama: string;
	listening, reading, structure: word;
	total:real;
	end; // syntaxdeklarasi record
	larik_toefl=array[1..max] of toefl; // syntaxdeklarasi larik record
	
var peserta:larik_toefl; //deklarasi variabel
	i,n,pil:byte;
	
procedure tambah_peserta(var X:larik_toefl);
var baru:string;
label ulang;
begin
	writeln('Menambah data peserta baru');
	ulang:
	write('masukkan nomor peserta : ');readln(baru);
	for i:=1 to n do//validasi nomor peserta
	begin
		if(X[i].no_peserta=baru) then
		begin
			writeln('Nomor sudah digunakan, ulangi'); goto ulang;
		end;
	end;
	//valid
	inc(n);
	X[n].no_peserta:=baru;
	write('Masukkan nama peserta : ');readln(X[n].nama);
	X[n].listening:=0; X[n].structure:=0; X[n].total:=0; // inisiaisasi nilai awal
	writeln('Selamat, pendaftaran peserta berhasil');
end;
	
procedure cetak_peserta(X:larik_toefl);
begin
	writeln('DAFTAR PESERTA TES TOEFL');
	writeln('Pusat Bahasa IST AKPRIND');
	writeln('.............................................................................');
	writeln('No  No Peserta     Nama       Listening   Reading     Structure         Total');
	writeln('.............................................................................');
	for i:=1 to n do
	writeln(i:2,'   ',X[i].no_peserta:4,'       ',X[i].nama:6,'          ',X[i].listening:3,'          ',X[i].reading:3,'         ',X[i].structure:3,'           ',X[i].total:3:2);
	writeln('............................................................................');
end;

procedure test_toefl(var X:larik_toefl);
var nomtes:string;
	pos:byte;
	ada:boolean; 
begin
	writeln('Tes Toefl');
	write('masukkan nomor test anda : ');readln(nomtes);
	//validasi apakah si-nomor sudah pernah tes atau belum
	//cek no tes ada atau tidak, jika ada dicek lagi apakah dia sudah pernah tes atau belum?
	for i:=1 to n do
	begin
		if (X[i].no_peserta=nomtes) then
		begin
			ada:=true;
			pos:=i;
		end;
	end; //end for
	if not ada then writeln('Anda tidak terdaftar sebagai peserta tes')
	else
	begin
		//cek dia sudah pernah tes atau belum
		if (X[pos].total=0) then
			begin
				write('Masukkan nilai Listening : ');readln(X[pos].listening);
				write('Masukkan nilai Reading   : ');readln(X[pos].reading);
				write('Masukkan nilai Structure : ');readln(X[pos].structure);
				X[pos].total:=0.4*X[pos].listening+0.3*X[pos].reading+0.3*X[pos].structure;
			end
		else writeln('Mohon maaf anda sudah pernah tes');
	end;
end;
	
	
procedure edit_data(VAR x:larik_toefl);
var edit:string; ada:boolean; pos:integer;
begin
	ada:=false;
	writeln('EDIT DATA PESERTA TOEFL');
	write('masukkan nomor peserta yang datanya akan diedit : ');readln(edit);
	//menentukan ada atau tidak dan jika ada menentukan posisi sipeserta tsb
	for i:=1 to n do
	begin
		if (X[i].no_peserta=edit) then
		begin
			ada:=true;
			pos:=i;
		end;
	end;
	//lakukan editing jika ada
	if ada then
	begin
		// lakukan editing
		writeln('Nomor Peserta : ',edit);
		writeln('Data Awal');
		writeln('Nama	: ',X[pos].nama);
		writeln('Skor Listening	: ',X[pos].listening);
		writeln('Skor Reading	: ',X[pos].reading);
		writeln('Skor Structure	: ',X[pos].structure);
		writeln('Skor Total		: ',X[pos].total:4:2);
		writeln('Anda hanya diijinkan mengedit data nama peserta');
		write('Masukkan perbaikan nama peserta : ');readln(X[pos].nama);
		writeln('Edit data telah berhasil dilakukan');
	end
	else writeln ('Tidak ada peserta tes dengan nomor',edit,'tersebut');
end;

procedure hapus_data(VAR X:larik_toefl);
var hapus:string; ada:boolean; pos:byte; ya:char;
begin
	ada:=false;
	writeln('MENGHAPUS DATA PESERTA TES TOEFL');
	write('masukkan nomor tes peserta : ');readln(hapus);
	//menentukan ada atau tidak dan jika ada menentukan posisi si peserta tsb
	for i:=1 to n do
	begin
		if (X[i].no_peserta=hapus)then
		begin
			ada:=true;
			pos:=i;
		end;
	end;
	//lakukan penghapusan jika ada
	if ada then
		begin
		//validasi
		writeln('Yakin data peserta dengan nomor :',hapus,'akan dihapus<y/t> ?');readln(ya);
		if (ya='y') or (ya='Y') then
			begin
				//geser posisi dibelakang data yang akan dihapus, menimpa data tsb
				for i:=pos to n-1 do X[i]:=X[i+1];
				dec(n);
				writeln('Data peserta dengan nomor ',hapus,'telah dihapus');
			end
			else writeln('Data peserta dengan nomor',hapus,'tidak jadi dihapus');
		end
		else writeln('Data peserta dengan nomor',hapus,'tidak ditemukan, penghapusan gagal');
end;

begin
n:=0;
repeat
	clrscr;
	writeln('Menu Pengelolaan Data Peserta Toefl Test');
	writeln('1. Pendaftaran Peserta');
	writeln('2. Cetak Peserta');
	writeln('3. Pelaksanaan Tes');
	writeln('4. Edit Data Peserta');
	writeln('5. Hapus Data Peserta');
	writeln('6. Menyisipkan Pendaftaran Baru');
	writeln('7. Cek Nilai Tes Pertama');	
	writeln('0. Selesai');
	write('Pilih menu[0-7] :');readln(pil);
	case pil of
	1: if n=max then writeln('Kelas sudah penuh') else tambah_peserta(peserta);
	2: if n=0 then writeln('Kelas masih kosong') else cetak_peserta(peserta);
	3: if n=0 then writeln('Kelas masih kosong') else test_toefl(peserta);
	4: if n=0 then writeln('Kelas masih kosong') else edit_data(peserta);
	5: if n=0 then writeln('Kelas masih kosong') else hapus_data(peserta);
	0: writeln('Terimakasih') else writeln('Anda salah pilih menu');
	end; // end case
	readln;
until pil=0;
end.
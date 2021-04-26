program review_record;
uses crt;

const max=10;

type toefl=record
     no_pst,nama:string;
     listening,reading,structure:word;
     total:Real;
end;//syntax deklasrasi record
larik_toefl=array[1..max] of toefl;//syntax deklarasi larik record

var peserta:larik_toefl;//deklarasi variabel
    i,n,pil:Byte;

procedure tambah_pst(var X:larik_toefl);
var baru:string;
label ulang;
begin
  WriteLn('menambah data peserta baru');
  ulang:
  Write('masukkan nomor peserta :');ReadLn(baru);
  for i:=1 to n do //validasi no peserta
  begin
    if (X[i].no_pst=baru) then begin
      WriteLn('nomor sudah digunakan , ulangi');
      goto ulang;
    end;
  end;

//   valid
   inc(n);
   X[n].no_pst:=baru;
   Write('masukkan nama peserta :');ReadLn(X[n].nama);
//    inisialisasi nilai awal
   X[n].listening:=0;
   X[n].reading:=0;
   X[n].structure:=0;
   X[n].total:=0;
    WriteLn('selamat, pendaftaran peserta berhasil');
end;

procedure cetak_pst(X:larik_toefl);
begin
  WriteLn('DAFTAR PESERTA TES TOEFL');
  WriteLn('Pusat Bahasa IST AKPRIND');
  WriteLn('----------------------------------------------------------------');
  WriteLn('No  No_Peserta  Nama       Listening  Reading  Structure  Total');
  WriteLn('----------------------------------------------------------------');
  for i:=1 to n do WriteLn(i:2,' ',X[i].no_pst:4,'         ',X[i].nama:6,'       ',X[i].listening:3,'     ',X[i].reading:3,'       ',X[i].structure:3,'        ',X[i].total:5:2);
  WriteLn('----------------------------------------------------------------');
end;

procedure test_toefl(var X:larik_toefl);
var nomtes:String;
    pos:byte;ada:Boolean;
begin
  ada:=false;
  WriteLn('tes toefl');
  write('masukkan nomer tes anda : ');readln(nomtes);
//   validasi apakah si nomer sudah pernah tes atau belum
// cek no tes ada atau tidak , jika ada dicek lagi apakah dia sdh pernah tes atau belum ?
for i:=1 to n do
begin
  if(X[i].no_pst=nomtes) then 
    begin
        ada:=true;
        pos:=i;
    end;
  end;//end for

  if not ada then WriteLn('anda tidak terdaftar sebagai peserta tes')
  else 
  begin
    // cek dia sudah pernah tes atau belum
    if (X[pos].total=0) then
    begin
      Write('masukkan nilai listening :');ReadLn(X[pos].listening);
      Write('masukkan nilai reading :');ReadLn(X[pos].reading);
      Write('masukkan nilai structure :');ReadLn(X[pos].structure);
      X[pos].total:=0.4*X[pos].listening+0.3*X[pos].reading+0.3*X[pos].structure;
    end else WriteLn('mohon maaf anda sudah pernah tes');
  end;
end;

procedure edit_data(VAR X:larik_toefl);
var edit:String;ada:Boolean;pos:Integer;
begin
  ada:=false;
  writeln('edit data peserta toefl ');
  write('masukkan nomor peserta yang datanya akan diedit :');readln(edit);
//   menentukan 
for i:=1 to n do
    begin
      if(X[i].no_pst=edit) then begin ada:=true;pos:=i; end;
    end;
if ada then
begin
    //   lakukan editing
    writeln('Nomor peserta :',edit);
    writeln('Data Awal ');
    WriteLn('Nama : ',X[pos].nama);
    WriteLn('Skor Listening  : ',X[pos].listening);
    WriteLn('Skor Reading  : ',X[pos].reading);
    WriteLn('Skor Structure  : ',X[pos].structure);
    WriteLn('Skor total  : ',X[pos].total:4:2);
    WriteLn('anda hanya diizinkan  mengedit data nama peserta ');
    Write('Masukkan perbaikan nama peserta ');ReadLn(X[pos].nama);
    Write('edit data telah berhasil dilakukan ');
end
else WriteLn('tidak ada peserta tes dengan nomor ',edit,' tersebut');
end;

procedure hapus_data(VAR X:larik_toefl);
var hapus:String;ada:Boolean;pos:Byte;ya:Char;
begin
  ada:=false;
  WriteLn('MENGHAPUS DATA PESERTA TES TOEFL');
  write('masukkan nomer peserta = ');ReadLn(hapus);
//   menentukan ada atau tidak dan jika ada menentukan posisi si peserta tsbt
for i:=1 to n do 
begin
  if(X[i].no_pst=hapus) then begin
    ada:=true;pos:=i;
  end;
end;
// lakukan penghapusan jika ada 
if ada then 
begin
//   validasi
    Write('Yakin data  peserta dengan nomor : ',hapus,' | ',X[pos].nama,' akan dihapus <y/t> ? ');ReadLn(ya);
    if (ya='Y')or (ya='y') then
    begin
    //   geser posisi dibelakang data yang akan dihapus , menimpa data tersebut
        for i:=pos to n-1 do X[i]:= X[i+1];
        dec(n);
        WriteLn('Data peserta dengan nomor ',hapus,' telah dihapus ');
    end
    else WriteLn('data peserta dengan nomor ',hapus,' tidak jadi dihapus');
end
else WriteLn(' nomer peserta ',hapus,' tidak ditemukan , hapus gagal');
end;

procedure sisip_data(var X:larik_toefl);
var sisip:String;pos:Byte;
label ulang,ulang1;
begin
    WriteLn('menyisipkan data di kelas tes toefl ');
    ulang:
    write('masukkan nomor peserta yang baru : ');ReadLn(sisip);
  //   validasi keunikan nomor
  for i:=1 to n do
    begin
      if(X[i].no_pst=sisip) then
        begin
          WriteLn(' nomor sudah digunakan , ulangi');goto ulang;
        end;
    end;

  //   sisipkan di posisi tertentu
  cetak_pst(X);
  ulang1:
  Write('Data baru akan disisipkan  di nomer  berapa ?');ReadLn(pos);
  // validasi posisi
  if (pos<1) or (pos>n+1) then begin
    WriteLn('posisi tidak ditemukan , ulangi ');goto ulang1;end;
  //   lolos 
  if(pos=n+1) then //penambahan diposisi  terakhir tanpa pergeseran
  begin
      inc(n);
      X[n].no_pst:=sisip;
      Write('Masukkan nama peserta : ');ReadLn(X[n].nama);
      WriteLn('penambahan data peserta di posisi ke ',pos,' berhasil ditambahkan ');

  end 
  else begin
      // geser dulu
      inc(n);
      for i:=n downto pos+1 do X[i]:=X[i-1];
      // sisip data yang baru
      X[pos].no_pst:=sisip;
      Write('Masukkan nama peserta : ');ReadLn(X[pos].nama);
      WriteLn('Penambahan data peserta di posisi ke ',pos,' berhasil ditambahkan ');
  end;

end;

// cek nilai
procedure cek_nilai(var X:larik_toefl);
var cekno:string;
    ketemu:Boolean;
    pos:byte;
begin
  ketemu:=false;
  WriteLn('Mengecek nilai Toefl Peserta ');
  Write('masukkan nomer tes anda ');ReadLn(cekno);
  // sequential
  for i:= 1 to n do 
  begin
    if X[i].no_pst=cekno then begin ketemu:=true;pos:=i; end;
  end;

  if ketemu then
  begin
  WriteLn('nomer peserta ', cekno,'atas nama ',X[pos].nama);
    if X[pos].total=0 then  WriteLn('anda belum tes')
    else
      writeln('Skor anda adalah =');
      writeln('Reading  =',X[pos].reading);
      writeln('listening  =',X[pos].listening);
      writeln('structure  =',X[pos].structure);
      writeln('total skor  =',X[pos].total:5:2);
    end
  else WriteLn('nomor ',cekno,' tidak terdaftar');
end;

// cetak yang tes toefl

procedure cek_sudah_tes(X:larik_toefl);
var ketemu:Boolean; ii:Byte;
begin
  ketemu:=False;ii:=0;//inisialisasi
  WriteLn('DAFTAR PESERTA SUDAH TES TOEFL');
  WriteLn('Pusat Bahasa IST AKPRIND');
  WriteLn('----------------------------------------------------------------');
  WriteLn('No  No_Peserta  Nama       Listening  Reading  Structure  Total');
  WriteLn('----------------------------------------------------------------');
 
  for i:=1 to n do
  begin
     if (X[i].total>0) then
     begin
      inc(ii);
        WriteLn(ii:2,' ',X[i].no_pst:4,'         ',X[i].nama:6,'       ',X[i].listening:3,'     ',X[i].reading:3,'       ',X[i].structure:3,'        ',X[i].total:5:2);
      ketemu:=true;
     end;
  end;
  WriteLn('----------------------------------------------------------------');
  if not ketemu then WriteLn('belum ada peserta yang melakukan tes');
end;

// cetak yang tes toefl
procedure cek_lulus(X:larik_toefl);
var ketemu:Boolean; ii:Byte;
begin
  ketemu:=False;ii:=0;//inisialisasi
  WriteLn('DAFTAR PESERTA SUDAH TES TOEFL');
  WriteLn('Pusat Bahasa IST AKPRIND');
  WriteLn('----------------------------------------------------------------');
  WriteLn('No  No_Peserta  Nama       Listening  Reading  Structure  Total');
  WriteLn('----------------------------------------------------------------');
 
  for i:=1 to n do
  begin
     if (X[i].total>400) then
     begin
      inc(ii);
        WriteLn(ii:2,' ',X[i].no_pst:4,'         ',X[i].nama:6,'       ',X[i].listening:3,'     ',X[i].reading:3,'       ',X[i].structure:3,'        ',X[i].total:5:2);
      ketemu:=true;
     end;
  end;
  WriteLn('----------------------------------------------------------------');
  if not ketemu then WriteLn('belum ada peserta yang lulus tes');
end;


begin
  n:=0;

repeat
  clrscr;
  writeln('menu mengelola Data Peserta TOEFL TEST');
  writeln('1. Pendaftaran Peserta ');
  writeln('2. Cetak Peserta ');
  writeln('3. Pelaksanaan  Test ');
  writeln('4. Edit Data  Peserta ');
  writeln('5. Hapus Data Peserta ');
  writeln('6. Menyisipkan Pendaftaran Baru ');
  writeln('7. Cek nilai tes peserta ');//searchig single match
  writeln('8. Cek peserta yang sudah melakukan test');//searchig multiple match
  writeln('9. Cek peserta yang lulus test');//searchig multiple match

  writeln('0. Selesai');
  Write('pilih menu 0-7 : ');ReadLn(pil);
  case pil of
    1: if n=max then WriteLn('kelas sudah penuh ') else tambah_pst(peserta);
    2: if n=0 then WriteLn('kelas masih kosong') else cetak_pst(peserta);
    3: if n=0 then WriteLn('kelas masih kosong ') else test_toefl(peserta);
    4: if n=0 then WriteLn('kelas masih kosong ') else edit_data(peserta);
    5: if n=0 then WriteLn('kelas masih kosong ') else hapus_data(peserta);
    6: if n=0 then WriteLn('kelas masih kosong ') else sisip_data(peserta);
    7: if n=0 then WriteLn('Peserta belum ada ') else cek_nilai(peserta);
    8: if n=0 then WriteLn('Peserta belum ada ') else cek_sudah_tes(peserta);
    9: if n=0 then WriteLn('Peserta belum ada ') else cek_lulus(peserta);
    0:WriteLn('terimkasih') else WriteLn('anda salah pilih menu');
    end;//end case
    ReadLn;
until pil=0;
end.
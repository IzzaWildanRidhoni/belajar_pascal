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

begin
  n:=0;
  repeat
    clrscr;
    WriteLn('Menu pengelolaan data peserta toefl test');
    WriteLn('1. Pendaftaran peserta');
    WriteLn('2. Cetak peserta');
    WriteLn('3. Input dan Hitung Data Tes');
    WriteLn('0. Selesai');
    Write('pilih menu 0-3 :');ReadLn(pil);
    case pil of
    1: if n=max then WriteLn('kelas sudah penuh ') else tambah_pst(peserta);
    2: if n=0 then WriteLn('kelas masih kosong') else cetak_pst(peserta);
    3: if n=0 then WriteLn('kelas masih kosong ') else test_toefl(peserta);
    0:WriteLn('terimkasih') else WriteLn('anda salah pilih menu');
    end;//end case
    ReadLn;
until pil=0;
end.
     
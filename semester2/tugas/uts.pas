program review_record;
uses crt;

const max=10;

type rec_brg=record
     kd_barang,nama:string;
     harga:longint;
     quantiti:Real;
end;//syntax deklasrasi record

larik_brg=array[1..max] of rec_brg;//syntax deklarasi larik record

var my_barang,Y:larik_brg;//deklarasi variabel
    i,j,n,pil:Byte;


procedure tambah_barang(var X:larik_brg);
var baru:string;
label ulang;
begin
  WriteLn('menambah data barang baru');
  ulang:
  Write('masukkan nomor barang :');ReadLn(baru);
  for i:=1 to n do //validasi no barang
  begin
    if (X[i].kd_barang=baru) then begin
      WriteLn('nomor sudah digunakan , ulangi');
      goto ulang;
    end;
  end;

//   valid
   inc(n);
   X[n].kd_barang:=baru;
   Write('masukkan nama barang :');ReadLn(X[n].nama);
   Write('masukkan harga barang :');ReadLn(X[n].harga);
   Write('masukkan quantiti barang :');ReadLn(X[n].quantiti);
   WriteLn('selamat, pendaftaran barang berhasil');
end;

// procedure urut  barang
procedure urut_barang(var X:larik_brg);
var dummy:rec_brg;sudah:Boolean;
begin
    //   mengisi data di larik  record Y
    for i:=1 to n do Y[i]:=X[i];

    // kita akan mengurutkan Y instead X
    WriteLn;
    for  i:=1 to n-1 do 
    begin
        for j:=1 to n-1 do  
        begin
            if Y[j].harga < Y[j+1].harga then
            begin
                dummy:=Y[j];Y[j]:=Y[j+1];Y[j+1]:=dummy;
            end;
        end;
    end;

    // cetak
    WriteLn('cetak data sesudah diurutkan');
    WriteLn('DAFTAR BARANG SESUDAH DIURUTKAN DESC(HARGA)');
    WriteLn('----------------------------------------------------------------');
    WriteLn('No  kd_barang  Nama       harga  quantity');
    WriteLn('----------------------------------------------------------------');
    for i:=1 to n do WriteLn(i:2,' ',Y[i].kd_barang:4,'         ',Y[i].nama:6,'       ',Y[i].harga:3,'     ',Y[i].quantiti:5:2);
    WriteLn('----------------------------------------------------------------');
    ReadLn;
end;



begin
  n:=0;

repeat
  clrscr;
  writeln('menu mengelola Data Barang');
  writeln('1. tambah data barang ');
  writeln('2. urutkan data barang DESC(harga) ');//mengurutkan methode buble
  writeln('0. Selesai');
  Write('pilih menu 0-2 : ');ReadLn(pil);
  case pil of
    1:if n=max then WriteLn('gudang sudah penuh ') else tambah_barang(my_barang);
    2: if n=0 then WriteLn('barang belum ada ') else urut_barang(my_barang);
    0:WriteLn('terimakasih') else WriteLn('anda salah pilih menu');
    end;//end case
    ReadLn;
until pil=0;
end.

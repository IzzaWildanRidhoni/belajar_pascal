program arrayrecord;
uses crt;

type rec_buku = record
        kode_buku,judul_buku:String;
        jml_halaman:Integer;
        harga:double;
    end;

    // membuat array record
    arr_buku=array[1..6] of rec_buku;

var	buku:arr_buku;
    pil_menu,n,i:Integer;


procedure tambahData(var buku:arr_buku);
var kode:String;
label ulang;

begin
  WriteLn('---Tambah Data---');
  inc(n);

//   input data user dan simpan kedaram array record 
   ulang:
   Write('masukkan kode baru : ');ReadLn(kode);

//    validasi
    for i:=1 to n do begin
      if(kode=buku[i].kode_buku) then
      begin
        WriteLn('kode sudah digunakan ,ulangi');
        goto ulang;
      end;
    end;

    buku[n].kode_buku:=kode;
    write('masukkan judul baru : ');ReadLn(buku[n].judul_buku);
    write('masukkan halaman baru : ');ReadLn(buku[n].jml_halaman);
    write('masukkan harga baru : ');ReadLn(buku[n].harga);
    
end;

procedure tampilkanData(var buku:arr_buku);
begin
  writeln('-- Daftar buku ---');
  WriteLn('no.  kode   Judul Buku   Halaman   Harga');
  WriteLn('------------------------------------------');
  for i:=1 to n do 
  begin
    writeln(i:3,' ',buku[i].kode_buku:5,' ',buku[i].judul_buku:15,' ',buku[i].jml_halaman:12,' ',buku[i].harga:15:2);
  end;
  WriteLn('------------------------------------------');
end;


procedure hapusData(var buku:arr_buku);
var kode:string;indexData:integer;isFound:Boolean=false;
begin
  writeln('---Hapus Data ---');
  write('Masukkan kode buku yang akan dihapus =');readln(kode);

//   proses cari kode
    for i:=1 to n do 
    begin
      if(kode = buku[i].kode_buku) then
      begin
        indexData:=i;
        isFound:=true;
        break;
      end;
    end;

    // jika ketemu lakukan penhapusan
    // dengan memajukan data untuk menumpuk data yang akan dihapus
    // kemudian jumlah data yang akan dikurang 1
    if isFound then
    begin
        for i:=indexData to n do
          begin
            buku[i].kode_buku:=buku[i+1].kode_buku;
            buku[i].judul_buku:=buku[i+1].judul_buku;
            buku[i].jml_halaman:=buku[i+1].jml_halaman;
            buku[i].harga:=buku[i+1].harga;
          end;      
          dec(n);
          WriteLn('data berhasil dihapus');
    end
    else   writeln('data tidak ditemukan');
end;


procedure editData(var buku:arr_buku);
var  kode:string;indexData:integer;isFound:Boolean=false;
begin
  writeln('-- edit Data ---');
  write('Masukkan kode buku yang akan diubah : ');readln(kode);

    // cari kode buku 
    for i:=1 to n do
      begin
        if kode=buku[i].kode_buku then
        begin
          indexData:=i;
          isFound:=true;
          break;
        end;
      end;
    
    // jika ketemu lakukan pengeditan
    if isFound then
    begin
      write('masukkan kode buku = ');readln(buku[indexData].kode_buku);
      write('masukkan judul buku = ');readln(buku[indexData].judul_buku);
      write('masukkan jumlah halaman = ');readln(buku[indexData].jml_halaman);
      write('masukkan harga = ');readln(buku[indexData].harga);
      writeln;
      writeln('data berhasil diubah');
    end
    else WriteLn('data tidak ditemukan');
end;

procedure cariData(buku:arr_buku);
var kode:string;indexData:integer;isFound:Boolean=false;
begin
  WriteLn('---Cari Data---');
  write('Masukkan kode buku = ');readln(kode);

//   cari kode 
    for i:=1 to n do
      begin
        if kode = buku[i].kode_buku then
        begin
          isFound:=true;
          indexData:=i;
          Break;
        end;
      end;
    
    if isFound then
    begin
    //   tampilkan data 
        writeln;
        writeln('Kode buku = ',buku[indexData].kode_buku);
        writeln('Judul buku = ',buku[indexData].judul_buku);
        writeln('Jumlah halaman = ',buku[indexData].jml_halaman);
        writeln('harga = ',buku[indexData].harga:0:2);
    end
    else WriteLn('data tidak ditemukan ');
end;


begin
    n:=0;
    repeat
      clrscr;
      WriteLn('Max data =',length(buku));
      WriteLn('Jml Data sekarang =',n);
      WriteLn;
      writeln('masukkan pilih menu');
      WriteLn('1. Tambah Data');
      WriteLn('2.Tampilkan  Data');
      WriteLn('3.Hapus  Data');
      WriteLn('4.Ubah  Data');
      WriteLn('5.Cari  Data');
      WriteLn('0.Keluar');
      write('Masukkan pilihan anda = ');readln(pil_menu);
      WriteLn;

      case pil_menu of
      1:if n>=length(buku) then WriteLn('database penuh') else tambahData(buku);
      2:if n=0 then WriteLn('database kosong') else tampilkanData(buku);
      3:if n=0 then WriteLn('database kosong') else hapusData(buku);
      4:if n=0 then WriteLn('database kosong') else editData(buku);
      5:if n=0 then WriteLn('database kosong') else cariData(buku);
      0:WriteLn('terimakasih')
      else WriteLn('input menu salah');
      end;

      ReadLn;
    until  (pil_menu = 0)
end.
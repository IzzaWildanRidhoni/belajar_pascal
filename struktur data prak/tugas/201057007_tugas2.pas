// nama : izza wildan ridhoni
// nim  : 201057007

program arrayrecord;
uses crt;

type rec_buku = record
        kode_buku,judul_buku,penulis:String;
        halaman:Integer;
        harga:double;
    end;
    rec_penjualan = record
        nama,kode_buku,judul_buku,penulis:String;
        halaman:Integer;
        harga:double;
    end;

    // membuat array record
    arr_buku=array[1..6] of rec_buku;
    arr_penjualan=array[1..6] of rec_penjualan;

var	buku:arr_buku;
    penjualan:arr_penjualan;
    pil_menu,n,np,i:Integer;


procedure tambahBuku(var buku:arr_buku;var penjualan:arr_penjualan);
var kode:String;
label ulang;

begin
  WriteLn('---Tambah Data---');
  inc(n);

//   input data user dan simpan kedaram array record 
   ulang:
   Write('masukkan kode baru : ');ReadLn(kode);

//    validasi kode buku di data buku
    for i:=1 to n do begin
      if(kode=buku[i].kode_buku) then
      begin
        WriteLn('kode sudah digunakan di data buku ,ulangi');
        goto ulang;
      end;
    end;

//    validasi kode buku di data penjualan
    for i:=1 to np do begin
      if(kode=penjualan[i].kode_buku) then
      begin
        WriteLn('kode sudah digunakan di data penjualan ,ulangi');
        goto ulang;
      end;
    end;

    buku[n].kode_buku:=kode;
    write('masukkan judul baru : ');ReadLn(buku[n].judul_buku);
    write('masukkan penulis baru : ');ReadLn(buku[n].penulis);
    write('masukkan halaman baru : ');ReadLn(buku[n].halaman);
    write('masukkan harga baru : ');ReadLn(buku[n].harga);
    
end;

procedure tampilkanBuku(var buku:arr_buku);
begin
  writeln('-- Daftar buku ---');
  WriteLn;
  WriteLn('no.  kode       Judul Buku       penulis     Halaman        Harga');
  WriteLn('-----------------------------------------------------------------------');
  for i:=1 to n do 
  begin
    writeln(i:3,' ',buku[i].kode_buku:5,' ',buku[i].judul_buku:15,' ',buku[i].penulis:12,' ',buku[i].halaman:12,' ',buku[i].harga:15:2);
  end;
  WriteLn('-----------------------------------------------------------------------');
end;


procedure hapusBuku(var buku:arr_buku);
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
            buku[i].penulis:=buku[i+1].penulis;
            buku[i].halaman:=buku[i+1].halaman;
            buku[i].harga:=buku[i+1].harga;
          end;      
          dec(n);
          WriteLn('data berhasil dihapus');
    end
    else   writeln('data tidak ditemukan');
end;


procedure editBuku(var buku:arr_buku);
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
      write('masukkan penulis = ');readln(buku[indexData].penulis);
      write('masukkan jumlah halaman = ');readln(buku[indexData].halaman);
      write('masukkan harga = ');readln(buku[indexData].harga);
      writeln;
      writeln('data berhasil diubah');
    end
    else WriteLn('data tidak ditemukan');
end;

procedure cariBuku(buku:arr_buku);
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
        writeln('penulis = ',buku[indexData].penulis);
        writeln('Jumlah halaman = ',buku[indexData].halaman);
        writeln('harga = ',buku[indexData].harga:0:2);
    end
    else WriteLn('data tidak ditemukan ');
end;

// procedure beli buku
procedure beliBuku(var buku:arr_buku;var penjualan:arr_penjualan);
var kode,cek,nama:String;pos:integer;isFound:Boolean=false;
label ulang,ulangnama;

begin
  ulang:
  clrscr;
  tampilkanBuku(buku);
  WriteLn;
  WriteLn('======= BELI BUKU ==========');
  Write('masukkan kode buku :');ReadLn(kode);

//   cari kode 
    for i:=1 to n do
      begin
        if kode = buku[i].kode_buku then
        begin
          isFound:=true;
          pos:=i;
          Break;
        end;
      end;
    
    // jika data ada benar
    if isFound then
    begin
      // cek dulu yakin akan beli tidak
      WriteLn('apakah anda yakin akan membeli ? :');
      WriteLn('judul buku = ',buku[pos].judul_buku);
      WriteLn('penulis = ',buku[pos].penulis);
      WriteLn;
      Write(' Y/T : ');ReadLn(cek);
      if (cek='Y')or (cek='y') then
      begin
        Inc(np);
        
        ulangnama:
            Write('masukkan nama anda = ');ReadLn(nama);
            if nama='' then begin WriteLn('nama tidak boleh kosonh '); readln; goto ulangnama; end;
        
        //   tambahkan ke array penjualan
        penjualan[np].nama:=nama;
        penjualan[np].kode_buku:=buku[pos].kode_buku;
        penjualan[np].judul_buku:=buku[pos].judul_buku;
        penjualan[np].penulis:=buku[pos].penulis;
        penjualan[np].halaman:=buku[pos].halaman;
        penjualan[np].harga:=buku[pos].harga;
        
      //   hapus data  buku  yg dipindahkan
          for i:=pos to n do
            begin
              buku[pos].kode_buku:=buku[pos+1].kode_buku;
              buku[pos].judul_buku:=buku[pos+1].judul_buku;
              buku[pos].penulis:=buku[pos+1].penulis;
              buku[pos].halaman:=buku[pos+1].halaman;
              buku[pos].harga:=buku[pos+1].harga;
            end;      
            dec(n);
            WriteLn('data berhasil dibeli');

      end
      else WriteLn(' buku batal dibeli');
  end 
  else  
    begin 
      WriteLn('tidak ada data  kode buku ',kode);
      ReadLn;
      goto ulang;
    end;
  ReadLn;
end;

// procedure tampilkan penjualan
procedure tampilkanPenjualan(var penjualan:arr_penjualan);
begin
   writeln('-- Daftar Penjualan  Buku ---');
  WriteLn;
  WriteLn('no.   pembeli  kode       Judul Buku       penulis     Halaman        Harga');
  WriteLn('-----------------------------------------------------------------------');
  for i:=1 to np do 
  begin
    writeln(i:3,'.   ',penjualan[i].nama:5,'    ',penjualan[i].kode_buku:5,' ',penjualan[i].judul_buku:15,' ',penjualan[i].penulis:12,'',penjualan[i].halaman:12,'      ',penjualan[i].harga:10:2);
  end;
  WriteLn('-----------------------------------------------------------------------');
end;



begin
    n:=0;
    np:=0;
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
      WriteLn('6.Beli Buku');
      WriteLn('7.Laporan penjualan');
      WriteLn('0.Keluar');
      write('Masukkan pilihan anda = ');readln(pil_menu);
      WriteLn;

      case pil_menu of
      1:if n>=length(buku) then WriteLn('database penuh') else tambahBuku(buku,penjualan);
      2:if n=0 then WriteLn('database kosong') else tampilkanBuku(buku);
      3:if n=0 then WriteLn('database kosong') else hapusBuku(buku);
      4:if n=0 then WriteLn('database kosong') else editBuku(buku);
      5:if n=0 then WriteLn('database kosong') else cariBuku(buku);
      6:if n=0 then WriteLn('database kosong') else beliBuku(buku,penjualan);
      7:if np=0 then WriteLn('database kosong') else tampilkanPenjualan(penjualan);
      0:WriteLn('terimakasih')
      else WriteLn('input menu salah');
      end;

      ReadLn;
    until  (pil_menu = 0)
end.
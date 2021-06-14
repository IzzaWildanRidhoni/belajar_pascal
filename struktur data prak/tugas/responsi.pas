// Nama : Izza Wildan Ridhoni
// Nim  : 201057007
// ---------------------------------
// Nama : Ady Putra Ramadhan
// Nim  : 201057008
// ---------------------------------
 
program ANTRIAN_BIOSKOP;
uses crt;
 
const max = 20;
type rec_antrian = record
    no_antri:array[1..max] of byte; //array didalam record
    front,rear:0..max;
    end;
 
type rec_pelayanan = record 
    kode_pelayanan,nama,film:string;
    bayar,kursi:longint;
    end;
    larikbioskop = array[1..max] of rec_pelayanan; // array record
 
type rec_film = record
     nama,jam_tayang:String;
     harga:LongInt;
     end;
     larikFilm = array[1..max] of rec_film;
 
var antrian:rec_antrian;
    bioskop:larikbioskop;
    film:larikFilm;
    pil,i,jumplay,nom_antri:byte;
 
function isFull(A:rec_antrian):Boolean;
begin
  if  A.rear=max then isFull:=true else isFull:=False;
end;
 
function isEmpty(A:rec_antrian):Boolean;
begin
  if  A.rear=0 then isEmpty:=true else isEmpty:=False;
end;
 
procedure daftarFilm(var film:larikFilm);
begin
  clrscr;
  WriteLn('------------Daftar Film Hari ini -------------');
  WriteLn('----------------------------------------------');
  WriteLn('No   Nama-Film     Jam-tayang          harga  ');
  WriteLn('----------------------------------------------');
  for i:=1 to 3 do
    begin
      WriteLn(i,'    ',film[i].nama,'      ',film[i].jam_tayang,'     Rp.',film[i].harga);
    end;
  WriteLn('-----------------------------------------------');
  
end;
 
procedure ambil_antrian(var A:rec_antrian);
var kurang:Byte;
begin
  clrscr;
  WriteLn;
  WriteLn('---------------------------------------------');
  WriteLn(' Ambil Antrian :');
  WriteLn('---------------------------------------------');
  Inc(nom_antri);
  WriteLn('anda mendapatkan antrian nomor  : ',nom_antri);
  WriteLn;
  WriteLn('---------------------------------------------');
 
  kurang:=(A.rear+1)-A.front; 
  
  if kurang = 0 then WriteLn('sekarang yang akan dilayani adalah anda')
  else  WriteLn('sekarang yang akan dilayani adalah antrian nomer ',A.no_antri[A.front],' kurang ',kurang,' antrian lagi');
  
  Inc(A.rear);
  A.no_antri[A.rear]:=nom_antri;  
  WriteLn('mohon bersabar menunggu :)');
end;
 
procedure layanan_bioskop(var A:rec_antrian;var P:larikbioskop;var F:larikFilm);
var kode,nm_film:String;ada:Boolean;pos,kursi,j:Integer;
label ulang,ulangfilm,ulangkursi;
begin
    WriteLn;
    WriteLn('PELAYANAN TIKET BIOSKOP ');
    WriteLn('-------------------------------------------');
    WriteLn('nomor antrian  ',A.no_antri[A.front]);
    WriteLn('-------------------------------------------');
    for i:=A.front to A.rear-1 do
      begin
        A.no_antri[i]:=A.no_antri[i+1];
      end;
      Dec(A.rear);
 
    ulang:
    
    // masuk ke  pelayanan tiket bioskop
    Write('masukkan  kode pelayanan  : ');ReadLn(kode);
    for i:=1 to jumplay do
      begin
        if P[i].kode_pelayanan = kode then  
        begin
          WriteLn('kode salah , ulangi ');
          goto ulang; 
        end;
      end;
    Inc(jumplay);
 
    P[jumplay].kode_pelayanan:=kode; 
    Write('masukkan nama lengkap        : ');ReadLn(P[jumplay].nama);
    ulangfilm:
    Write('nama film yang akan ditonton  : ');ReadLn(nm_film);
 
    // cek apakah ada film di rec_film
    for i:=1 to 3 do
    begin
      if nm_film = F[i].nama then
      begin
        ada:=true;
        pos:=i;
      end;
    end;
    if not ada then begin WriteLn('Maaf film yang anda inputkan tidak ada , ulangi !');goto ulangfilm; end;
    begin
        P[jumplay].film :=nm_film;
        WriteLn('jumlah yang harus di bayar  : Rp ',F[pos].harga);
        WriteLn('film akan tayang jam   :  ',F[pos].jam_tayang);
        ulangkursi:
        Write('masukkan no kursi < no 1 - 100 >   :  ');ReadLn(kursi);

        // cek apakah kursi sdah dipesan di film ini ? misal avenger
          for j:=1 to 3 do
            begin
              for i:=1 to jumplay do
              begin
                if  nm_film = P[i].film then
                begin
                  if kursi = P[i].kursi then
                  begin
                    WriteLn('Kursi sudah dipesan , orang lain');goto ulangkursi;
                  end;
                end;
              end;
            end;
            // if kursi > 100 then begin writeln('kursi tidak tersedia , hanya tersedia no  1-100 ');goto ulangkursi; end;
            // // cek kursi
            // for i:=1 to jumplay do
            //   begin
            //     if kursi = P[i].kursi then begin
            //      WriteLn('Kursi sudah dipesan , orang lain');goto ulangkursi;
            //     end; 
            //   end;

        P[jumplay].kursi:=kursi;
        WriteLn;
        WriteLn('pelayanan  berhasil  ;) ');
    end;
 
end;
 
procedure cetak_antrian(var A:rec_antrian);
begin
    writeln('Daftar antrian saat ini di Loket Tiket Bioskop');
    writeln('-------------------------');
    writeln('Posisi   No Antrian:');
    writeln('-------------------------');
    for i:=A.front to A.rear do writeln(i:4,'     ',A.no_antri[i]:4);
    writeln('-------------------------');
    writeln('List yang mengantre saat ini :',A.rear,' orang');
end;
 
procedure cetak_layanan(var P:larikbioskop;F:larikfilm);
var j,k:Integer;
 begin
   writeln('DAFTAR LAYANAN BIOSKOP HARI INI ');
   WriteLn;
   for j:=1 to 3 do
     begin
          WriteLn('FILM ',F[j].nama,' |  ',F[j].jam_tayang);
          writeln('---------------------------------------');
          writeln('| No  kode      Nama   Kursi          |');
          writeln('---------------------------------------');
          k:=1;
          for i:=1 to jumplay do
            if F[j].nama = P[i].film then
            begin
              WriteLn('| ',k,'   ',P[i].kode_pelayanan,'     ',P[i].nama,'      ',P[i].kursi,'              |');
              inc(k);
            end;
          writeln('---------------------------------------');
          WriteLn;
     end;
end;
 
procedure layanan_prioritas(var A:rec_antrian;var P:larikbioskop;var F:larikfilm);
var kode,nm_film:String;ada,cek:Boolean;pos,pos2,kursi,nomer:Integer;
label ulang,ulangfilm,ulangkursi,ulangno;
begin
    WriteLn;
    cek:=false;
    WriteLn('Layanan Prioritas : ');
    WriteLn('-------------------------------------------');
    ulangno:
    Write('masukkan nomer  antrian yang diprioritaskan :  ');ReadLn(nomer);
    // validasi  nomer antri
    for i:=A.front to A.rear do
      begin
        if nomer = A.no_antri[i] then
        begin
          cek:=true;
          pos2:=i;
        end;
      end;
      if not cek then 
      begin
        WriteLn('data tidak ditemukan , ulangi !');
        goto ulangno;
      end;

      // hapus no antri  yang ada di rec antri
      for i:=pos2 to A.rear-1 do
      begin
        A.no_antri[i]:=A.no_antri[i+1];
      end;
      Dec(A.rear);
    
 
    ulang:
    
    // masuk ke  pelayanan tiket bioskop
    Write('masukkan  kode pelayanan  : ');ReadLn(kode);
    for i:=1 to jumplay do
      begin
        if P[i].kode_pelayanan = kode then  
        begin
          WriteLn('kode salah , ulangi ');
          goto ulang; 
        end;
      end;
    Inc(jumplay);
 
    P[jumplay].kode_pelayanan:=kode; 
    Write('masukkan nama lengkap        : ');ReadLn(P[jumplay].nama);
    ulangfilm:
    Write('nama film yang akan ditonton  : ');ReadLn(nm_film);
 
    // cek apakah ada film di rec_film
    for i:=1 to 3 do
    begin
      if nm_film = F[i].nama then
      begin
        ada:=true;
        pos:=i;
      end;
    end;
    if not ada then begin WriteLn('Maaf film yang anda inputkan tidak ada , ulangi !');goto ulangfilm; end;
    begin
        P[jumplay].film :=nm_film;
        WriteLn('jumlah yang harus di bayar  : Rp ',F[pos].harga);
        WriteLn('film akan tayang jam   :  ',F[pos].jam_tayang);
        ulangkursi:
        Write('masukkan no kursi < no 1 - 100 >   :  ');ReadLn(kursi);
            if kursi > 100 then begin writeln('kursi tidak tersedia , hanya tersedia no  1-100 ');goto ulangkursi; end;
            // cek kursi
            for i:=1 to jumplay do
              begin
                if kursi = P[i].kursi then begin
                 WriteLn('Kursi sudah dipesan , orang lain');goto ulangkursi;
                end; 
              end;
        P[jumplay].kursi:=kursi;
        WriteLn;
        WriteLn('pelayanan  berhasil  ;) ');
    end;
 
end;
 
procedure keluar_antrian(var A:rec_antrian);
var nom:byte;ada:boolean;pos:byte;ya:char;
begin
  ada:=false;
  writeln('Keluar antrian Tiket Bioskop');
  write('masukkan nomor antrian yang keluar :');readln(nom);
  for i:=A.front to A.rear do
  begin
      if A.no_antri[i]=nom then begin ada:=true;pos:=i;end;
  end;
  if not ada then writeln('Nomor antrian ', nom,' tidak ada didalam Data')
  else
  begin
    writeln('Nomor antrian ',nom,' ada diposisi ',pos);
    writeln('Yakin akan keluar dari antrian <y/t>?');readln(ya);
    if (ya='Y')or(ya='y')then
    begin
        writeln('Terimakasih, Silahkan datang lagi');
        for i:=pos to A.rear do
            A.no_antri[i]:=A.no_antri[i+1];
        dec(A.rear);
    end else writeln('Nomor antrian ',nom,' tidak jadi keluar antrian');
end;
end;
 
// main program
begin
    // inisialisasi
    antrian.front:=1;
    antrian.rear:=0;
    jumplay:=0;
    nom_antri:=0;
 
    // daftar film yang disediakan 
    film[1].nama:='avenger';
    film[1].harga:=12000;
    film[1].jam_tayang:='08.00 - 10.00 WIB';
    
    film[2].nama:='iron man';
    film[2].harga:=20000;
    film[2].jam_tayang:='10.00 - 12.00 WIB';
    
    film[3].nama:='one punch man';
    film[3].harga:=30000;
    film[3].jam_tayang:='14.00 - 16.00 WIB';
 
    repeat
      clrscr;
      WriteLn('====================================');
      WriteLn('-----PELAYANAN NONTON BIOSKOP ------');
      WriteLn('====================================');
      WriteLn('1. Daftar Film Bioskop ');
      WriteLn('2. Ambil Antrian Tiket ');
      writeln('3. Layanan Tiket');
      writeln('4. Cetak Data Antrian');
      writeln('5. Cetak Data Layanan');
      writeln('6. Prioritas Layanan');
      writeln('7. Keluar Antrian');
      WriteLn('0. exit');
      Write('pilih layanan : ');ReadLn(pil);
 
      case pil of 
        1:daftarFilm(film);
        2:if isFull(antrian) then WriteLn('maaf antrian sudah full , hanya menerima  ',max,' pelayanan saja;)') else ambil_antrian(antrian); 
        3:if isEmpty(antrian) then WriteLn('sedang tidak ada antrian ') else layanan_bioskop(antrian,bioskop,film);
        4:if IsEmpty(antrian)then writeln('Sedang tidak ada antrian')else cetak_antrian(antrian);
        5:if jumplay=0 then writeln('Belum ada penumpang yang sdh dilayani')else cetak_layanan(bioskop,film);
        6:if IsEmpty(antrian)then writeln('Sedang tidak ada antrian')else layanan_prioritas(antrian,bioskop,film);
        7:if IsEmpty(antrian)then writeln('Sedang tidak ada antrian')else keluar_antrian(antrian);
        0:WriteLn('Terimakasih Karena Telah Menggunakan Program Kami:)') else WriteLn('anda salah pilih menu ');
      end;
    ReadLn;
 
    // akan menjalankan program sampai user menginputkan pilihan menu sama dengan 0
    until pil = 0;
end.
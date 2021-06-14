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

var	antrian:rec_antrian;
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
var kode,nm_film:String;ada:Boolean;pos,kursi:Integer;
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
      WriteLn('0. exit');
      Write('pilih layanan : ');ReadLn(pil);

      case pil of 
        1:daftarFilm(film);
        2:if isFull(antrian) then WriteLn('maaf antrian sudah full , hanya menerima  ',max,' pelayanan saja;)') else ambil_antrian(antrian); 
        3:if isEmpty(antrian) then WriteLn('sedang tidak ada antrian ') else layanan_bioskop(antrian,bioskop,film);
        0:WriteLn('terimakasih ') else WriteLn('anda salah pilih menu ');
      end;
    ReadLn;

    // akan menjalankan program sampai user menginputkan pilihan menu sama dengan 0
    until pil = 0;
end.
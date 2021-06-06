// Nama : Izza Wildan Ridhoni
// Nim  : 201057007
// ---------------------------------


program antrian_pebayaran_pajak;
uses crt;

// maxisimal antrian yang dilayani adalah 20 antrian saja
const max = 20;
type rec_antrian = record
    no_antri:array[1..max] of byte; //array didalam record
    front,rear:0..max;
    end;

type rec_pelayanan = record 
    kode_pelayanan,nama,jenis_pajak:string;
    bayar:longint;
    end;
    larikPajak = array[1..max] of rec_pelayanan; // array record

var	antrian:rec_antrian;
    pajak:larikPajak;
    pil,i,jumplay,nom_antri:byte;

// fungsi yang digunakan  untuk mengecek apakah antrian full?
function isFull(A:rec_antrian):Boolean;
begin
  // jika data rear yang ada di record antrian itu = max maka akan mengembalikan nilai true , kemudian jika data rear tidak sama dengan sama dengan max maka akan mengembalikan nilai false  
  if  A.rear=max then isFull:=true else isFull:=False;
end;

// fungsi yang digunakan untuk mengecek apakah data kosong?
function isEmpty(A:rec_antrian):Boolean;
begin
  // jika data rear = 0 maka akan mengembalikan nilai true, kemudian jika rear tidak sama dengan 0 maka akan mengembalikan nilai false
  if  A.rear=0 then isEmpty:=true else isEmpty:=False;
end;

// prosedure untuk ambil antrian
procedure ambil_antrian(var A:rec_antrian);
var kurang:Byte;
begin
  WriteLn;
  WriteLn('Selamat datang di PELAYANAN PEMBAYARAN PAJAK ');
  WriteLn('---------------------------------------------');
  // ketika prosedure ambil antrian diambil maka secara otomatis nomer antrian akan ditambahkan 1
  Inc(nom_antri);
  WriteLn('anda mendapatkan antrian nomor  : ',nom_antri);
  WriteLn;
  WriteLn('---------------------------------------------');

  // rumus mengecek  berapa lagi antrian yang harus ditunggu agar bisa mendapatkan pelayanan pajak
  kurang:=(A.rear+1)-A.front; 
  
  if kurang = 0 then WriteLn('sekarang yang akan dilayani adalah anda')
  else  WriteLn('sekarang yang akan dilayani adalah antrian nomer ',A.no_antri[A.front],' kurang ',kurang,' antrian lagi');
  
  Inc(A.rear);  //menambahkan data rear
  // menambahkan nomer antri ke ...= nomer  antri yang diincrementkan tadi
  A.no_antri[A.rear]:=nom_antri;  
  WriteLn('mohon bersabar menunggu :)');
end;

// procedure untuk melayanai pajak dengan parameter rec_antrian dan larikpajak
procedure layanan_pajak(var A:rec_antrian;var P:larikPajak);
var kode:String;
label ulang;
begin
    WriteLn;
    WriteLn('selamat datang di pembayaran pajak ');
    WriteLn('------------------------------------');
    WriteLn('nomor antrian  ',A.no_antri[A.front]);
    WriteLn('------------------------------------');
    
    // menghapus nomer antrian pertama untuk dilayani
    // menggeser posisi yang sedang antri
    for i:=A.front to A.rear-1 do
      begin
        A.no_antri[i]:=A.no_antri[i+1];
      end;
      // mengurangi  data rear  / menghapus data rear terakhir
      Dec(A.rear);

    ulang:
    
    // masuk ke  pelayanan pajak
    Write('masukkan  kode pelayanan  : ');ReadLn(kode);
    // validasi = mengecek apakah  kode baru  sama dengan kode_pelayanan  lama  yang sudah diinputkan? 
    for i:=1 to jumplay do
      begin
        //jika ada  maka ulangi sampai kode itu unix 
        if P[i].kode_pelayanan = kode then  
        begin
          WriteLn('kode salah , ulangi ');
          goto ulang; 
        end;
      end;
    // kode sudah valid / kode sudah unix maka tambahkan jumlah playanan (jumplay)
    Inc(jumplay);

    // memulai penginputan data pajak
    P[jumplay].kode_pelayanan:=kode; 
    Write('masukkan nama lengkap        : ');ReadLn(P[jumplay].nama);
    Write('jenis pajak  yang  akan dibayar   : ');ReadLn(P[jumplay].jenis_pajak);
    Write('jumlah pajak yang harus di bayar  : Rp ');ReadLn(P[jumplay].bayar);
    WriteLn;
    WriteLn('pembayaran berhasil ;) ');

end;


// fungsi ntuk mencetak antrian
procedure cetak_antrian(var A:rec_antrian);
begin
	writeln('Daftar antrian saat ini di PELAYANAN PEMBAYARAN PAJAK');
	writeln('--------------------');
	writeln('Posisi    No.Antrian');
	writeln('--------------------');

  // ualangi cetak data dari  front sampai rear
	for i := A.front to A.rear do
	writeln(i:4,'    ',A.no_antri[i]:4);
	writeln('--------------------');
	writeln('Saat ini yang mengantri : ',A.rear,' orang');

end;

// fungsi untuk mencetak pajak
procedure cetak_pajak (var P:larikPajak);
begin
	writeln('-----------------------------------------------------------------');
	writeln('=== DAFTAR YANG SUDAH DILAYANI  ===');
	writeln('-----------------------------------------------------------------');
	writeln('No  Kode       Nama         Jenis Pajak      Bayar Pajak (rupiah ) ');
	writeln('-----------------------------------------------------------------');
	
  // ulangi cetak data secara menaik  dari 1 sampai (jumlah totol jumplay)  
  for i:=1 to jumplay do
	writeln(i:2,'  ',P[i].kode_pelayanan:4,'    ',P[i].nama:10,'    ',P[i].jenis_pajak:10,'    ',P[i].bayar:12);
	writeln('-----------------------------------------------------------------');
end;


// fungsi memprioritaskan layanan prioritas pajak
procedure layanan_prioritas_pajak (var A:rec_antrian;var P:larikPajak);
var kode:string; prio,pos:byte; ada:boolean;
label ulang;
begin
	ada:= false;
	writeln('----------------------------------------------');
	write('Masukkan Nomor Antrian yang akan di prioritaskan : ');readln(prio);
	//mencari si nomor prioritas di antrian dan mencatat posisinya
	for i:= A.front to A.rear do
	begin
		if A.no_antri[i] = prio then
		begin
			ada := true;
			pos := i;
		end;
	end;

  // jika tidak ada nomer antrian maka batal dilayani
	if not ada then
		writeln('Nomor Antrian ',prio,' tidak ada yang sedang antri saat ini')
	else //jika ada maka akan dilayani
	begin
   WriteLn('selamat datang di pembayaran pajak ');
    WriteLn('------------------------------------');
		writeln('Nomor Antri  =  ',A.no_antri[pos],' ');
    WriteLn('------------------------------------');
	//menggeser posisi yang sedang antri dibelakang antrian prioritas
	for i:= pos to A.rear-1 do
		A.no_antri[i] := A.no_antri[i+1];
		dec(A.rear);

	ulang:
  // pelayanan pajak dimulai
	write('Masukkan  Kode pelayanan  : ');readln(kode);
	//validasi. ulangi pengecekan  sampai kode unix
	for i:=1 to jumplay do
	begin
		if P[i].kode_pelayanan = kode then
		begin
			writeln('Kode salah, ulangi'); goto ulang;
		end;
	end;

	//jika kode sudah valid
	inc (jumplay); //incrementkan jumplay
  
  // mulai mengisi data pajak
	P[jumplay].kode_pelayanan := kode;
	write('masukkan nama lengkap        : ');Readln(P[jumplay].nama);
    write('jenis pajak  yang  akan dibayar   : ');Readln(P[jumplay].jenis_pajak);
    write('jumlah pajak yang harus di bayar  : Rp ');Readln(P[jumplay].bayar);
	writeln;
	writeln('Pembayaran berhasil :)');
	end;//end else
end;


// fungsi untuk keluar dari antrian (queue)
procedure keluar_antrian(var A:rec_antrian);
var nomor:Byte;ada:Boolean;pos:Byte;ya:char;
begin
  ada:=false;
  WriteLn('Keluar antrian pelayanan pajak ');
  write('masukkan nomor antrian yang akan keluar : ');readln(nomor);
  
  // mengecek  sampai data nomer(yg diinput user) sama dengan nomer antri yg  ada  di record
  for i:=A.front to A.rear do
    begin
      if A.no_antri[i]=nomor then begin
        ada:=true;pos:=i;
      end;
    end;
  
 
  if not ada  then WriteLn('nomor antrian ',nomor,' tidak ditemukan') // jika tidak ditemukan
  else  // jika ditemukan 
  begin
    WriteLn('nomor antrian ',nomor,' ada di posisi ',pos);

    // konfirmasi apakah akan keluar dari antrian?s
    Write('yakin akan keluar dari antrian  <y/t> ? : ');ReadLn(ya);

    // jika iya maka hapus data antrian berdasarkan nomor yang user inputkan
    if (ya='Y') or (ya='y') then
    begin
      WriteLn('terimakasih sudah keluar dari antrian :) ');
      // keluarkan dan menggeser yang ada dibelakangnya 
      for i:=pos to A.rear do
        A.no_antri[i]:=A.no_antri[i+1];
      
      Dec(A.rear);

      // jika tidak selain y maka akan batal keluar dari antrian
      end else WriteLn('nomor antrian ',nomor,' tidak jadi keluar antrian ');

    end; 
  end;


// main program
begin
    // inisialisasi
    antrian.front:=1;
    antrian.rear:=0;
    jumplay:=0;
    nom_antri:=0;

    repeat
      clrscr;
      WriteLn('====================================');
      WriteLn('-----PELAYANAN PEMBAYARAN PAJAK-----');
      WriteLn('====================================');
      WriteLn('1. Ambil Antrian ');
      WriteLn('2. Layanan pajak ');
      writeln('3. Cetak data yang sedang antri');
      writeln('4. Cetak data yang sudah dilayani');
      WriteLn('5. prioritas layanan pajak ');  
      WriteLn('6. keluar dari antrian pajak ');
      WriteLn('0. exit');
      Write('pilih layanan : ');ReadLn(pil);

      case pil of 
        // cek apakah sudah full ? jika tidak fulll panggil fungsi  ambil antrian
        1:if isFull(antrian) then WriteLn('maaf antrian sudah full , hanya menerima  ',max,' pelayanan saja;)') else ambil_antrian(antrian); 
        // cek apakah data kosong ? jika tidak kosong panggil fungsi  layanan_pajak
        2:if isEmpty(antrian) then WriteLn('sedang tidak ada antrian ') else layanan_pajak(antrian,pajak);
        // cek apakah data kosong ? jika tidak kosong panggil fungsi  cetak_antrian
        3: if isEmpty(antrian) then writeln ('Sedang tidak ada antrian') else cetak_antrian(antrian);
        // cek apakah data jumlay sama dengan 0 ? jika tidak sama dengan 0 maka  panggil fungsi  cetak_pajak
		    4: if jumplay = 0 then writeln ('Belum ada yang sudah dilayani') else cetak_pajak(pajak);
        // cek apakah data kosong ? jika tidak kosong panggil fungsi  layanan_prioritas_pajak
        5: if isEmpty(antrian) then writeln ('Sedang tidak ada antrian') else layanan_prioritas_pajak(antrian,pajak);
        // cek apakah data kosong ? jika tidak kosong panggil fungsi  keluar antrian
		    6: if isEmpty(antrian) then writeln ('Sedang tidak ada antrian') else keluar_antrian(antrian);
        // jika pilihannya 0 maka  program berhenti atau jika salah menginputkan pilihan maka akan muncul alert salah pil menus
        0:WriteLn('terimakasih ') else WriteLn('anda salah pilih menu ');
      end;
    ReadLn;

    // akan menjalankan program sampai user menginputkan pilihan menu sama dengan 0
    until pil = 0;
end.
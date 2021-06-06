program antrian_praktik_dokter;
uses crt;

const max = 20;
type AntrianDokter = record
    no_antrian:array[1..max] of byte; //array didalam record
    front,rear:0..max;
    end;

type rec_pasien = record 
    kode_pasien,nama,diagnosa:string;
    end;
    larikpasien = array[1..max] of rec_pasien; // array record

var	antrian:AntrianDokter;
    pasien:larikpasien;
    pil,i,jumpas,nom:byte;

function isFull(Q:AntrianDokter):Boolean;
begin
  if  Q.rear=max then isFull:=true else isFull:=False;
end;

function isEmpty(Q:AntrianDokter):Boolean;
begin
  if  Q.rear=0 then isEmpty:=true else isEmpty:=False;
end;

procedure ambil_antrian(var Q:AntrianDokter);
begin
  WriteLn('Selamat datang di antrian Dokter budi');
  Inc(nom);
  WriteLn('anda mendapatkan antrian nomor ',nom);
  Inc(Q.rear);
  Q.no_antrian[Q.rear]:=nom;
  WriteLn('mohon bersabar menunggu ');
end;

procedure cetak_antrian(var Q:AntrianDokter);
begin
  WriteLn('Daftar Antrian saat ini di praktek dokter budi');
  WriteLn('-----------------------------------');
  WriteLn('Posisi  No_Antrian');
  for i:=Q.front to Q.rear do WriteLn(i:4,' ',Q.no_antrian[i]:4);
  WriteLn('-----------------------------------');
  WriteLn('saat ini yang mengantri : ',Q.rear,'orang');
end;

procedure layanan_dokter(var Q:AntrianDokter;var p:larikpasien);
var kode:String;
label ulang;
begin
    WriteLn('selamat datang di layanan dokter budi ');
    WriteLn('Pasien nomor ',Q.no_antrian[Q.front],' silahkan menunggu ruang praktek ');
    // menggeser posisi yang sedang antri
    for i:=Q.front to Q.rear-1 do
      begin
        Q.no_antrian[i]:=Q.no_antrian[i+1];
      end;
      Dec(Q.rear);
    //   menangani si pasien yang ada di ruangang praktek
    WriteLn('kami akan mencatat data pasien ');
    ulang:
    Write('masukkan nomor kode pasien ');ReadLn(kode);
    // validasi
    for i:=1 to jumpas do
      begin
        if p[i].kode_pasien = kode then 
        begin
          WriteLn('kode salah , ulangi ');
          goto ulang;
        end;
      end;
    // kode sudah valid
    Inc(jumpas);
    p[jumpas].kode_pasien:=kode; 
    Write('masukkan nama pasien ');ReadLn(p[jumpas].nama);
    Write('diagnosa pasien : ');ReadLn(p[jumpas].diagnosa);

end;

procedure cetak_pasien(var P:larikpasien);
begin
  WriteLn('Daftar pasien yang berobat ');
  WriteLn('praktek dokter budi');
  WriteLn('-------------------------------');
  WriteLn('no  kode  nama  diagnosa');
  WriteLn('-------------------------------');
  for i:=1 to jumpas do
    WriteLn(i:2,' ',P[i].kode_pasien:4,' ',P[i].nama:10,' ',P[i].diagnosa:15);
  WriteLn('-------------------------------');
end;

procedure layanan_prioritas(var Q:AntrianDokter;var P:larikpasien);
var kode:String;prio,pos:byte;ada:Boolean;
label ulang;
begin
  ada:=false;
  WriteLn('selamat datang di layanan prioritas dokter budi');
  write('masukkan nomor antrian yang akan di prioritaskan : ');ReadLn(prio);
  // mencari si nomer prioritas di antrian dan mencatat posisinya 
  for i:=Q.front to Q.rear do
    begin
      if Q.no_antrian[i]=prio then begin
        ada:=true;
        pos:=i; 
      end;
    end;
  if not ada  then WriteLn('nomor antrian ',prio,' tidak ada di pasien yang sedang antri saat ini ')
  else begin
    WriteLn('pasien nomor ',Q.no_antrian[pos],'silahkan menuju ruang praktek ');
    
    // menggeser posisi yang sedang antri di belakang antrian prioritas
    for i:=pos to Q.rear-1 do
      begin
        Q.no_antrian[i]:=Q.no_antrian[i+1];
      end;
      Dec(Q.rear);

    // menangani si pasien yang ada di ruang praktek 
    WriteLn('kami akan mencatat  data pasien ');
    ulang:
    Write('masukkan nomor kode pasien : ');ReadLn(kode);
     // validasi
    for i:=1 to jumpas do
      begin
        if p[i].kode_pasien = kode then 
        begin
          WriteLn('kode salah , ulangi ');
          goto ulang;
        end;
      end;
    // kode sudah valid
    Inc(jumpas);
    p[jumpas].kode_pasien:=kode; 
    Write('masukkan nama pasien ');ReadLn(p[jumpas].nama);
    Write('diagnosa pasien : ');ReadLn(p[jumpas].diagnosa);
    WriteLn('semoga lekas sembbuh :)');
  end;
end;

procedure keluar_antrian(var Q:AntrianDokter);
var nomor:Byte;ada:Boolean;pos:Byte;ya:char;
begin
  ada:=false;
  WriteLn('Keluar antrian dokter ');
  write('masukkan nomor antrian yang akan keluar : ');readln(nomor);
  for i:=Q.front to Q.rear do
    begin
      if Q.no_antrian[i]=nomor then begin
        ada:=true;pos:=i;
      end;
    end;
  
  if not ada  then WriteLn('nomor antrian ',nomor,' tidak ditemukan')
  else 
  begin
    WriteLn('nomor antrian ',nomor,' ada di posisi ',pos);
    Write('yakin akan keluar dari antrian  <y/t> ? : ');ReadLn(ya);
    if (ya='Y') or (ya='y') then
    begin
      WriteLn('terimakasih semoga anda sehat selalu ');
      // keluarkan dan menggeser yang ada dibelakangnya 
      for i:=pos to Q.rear do
        Q.no_antrian[i]:=Q.no_antrian[i+1];
      
      Dec(Q.rear);
      end else WriteLn('nomor antrian ',nomor,' tidak jadi keluar antrian ');

    end; 
  end;

// main program
begin
    // inisialisasi
    antrian.front:=1;
    antrian.rear:=0;
    jumpas:=0;
    nom:=0;

    repeat
      clrscr;
      WriteLn('layanan antrian dokter');
      WriteLn('1. Ambil Antrian ');
      WriteLn('2. Layanan Pasien ');
      WriteLn('3. cetak pasien yang sedang antri ');
      WriteLn('4. cetak pasien yang sudah dilayani ');
      WriteLn('5. prioritas layanan ');  
      WriteLn('6. keluar dari antrian ');
      WriteLn('0. exit');
      Write('pilih layanan ');ReadLn(pil);
      case pil of 
        1:if isFull(antrian) then WriteLn('maaf hari ini hanya melayani ',max,' pasien saja ') else ambil_antrian(antrian);
        2:if isEmpty(antrian) then WriteLn('sedang tidak ada antrian ') else layanan_dokter(antrian,pasien);
        3:if isEmpty(antrian) then WriteLn('sedang tidak ada antrian ') else cetak_antrian(antrian);
        4:if jumpas=0 then WriteLn('belum ada pasien yang sudah dilayani ') else cetak_pasien(pasien);
        5:if isEmpty(antrian) then WriteLn('sedang tidak ada antrian ') else layanan_prioritas(antrian,pasien);
        6:if isEmpty(antrian) then WriteLn('sedang tidak ada antrian ') else keluar_antrian(antrian);
        0:WriteLn('terimakasih ') else WriteLn('anda salah pilih jurusan ');
      end;
    ReadLn;

    until pil = 0;
end.
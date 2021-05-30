// stack buku
program  stack_buku;
uses crt;

const max = 10;

type stack=record
    judul,pengarang: array[1..max] of string;
    tos,bos:0..max; // tos : top of stack  ; bos  : bottom of stack
    end;

var	stackbuku : stack;
    pil,i:byte;

function isFull(S:stack):Boolean;
begin
  if S.tos=max then isFull:=true else isFull:=false; 
end;

function isEmpty(S:stack):Boolean;
begin
  if S.tos=0 then isEmpty:=true else isEmpty:=false; 
end;

procedure PushBuku(var S:stack);
begin
  WriteLn('Menambahkan buku baru ke dalam tumpukan');
  Inc(S.tos);//menaikkan posisii tos of stack kr ada data baru akan masuk 
  Write('masukkan judul buku yang baru : ');ReadLn(S.judul[S.tos]);//perhatikan posisi index milik atribut bukan milik variabel
  Write('masukkan nama pengarang : ');ReadLn(S.pengarang[S.tos]);//idem
  WriteLn('Buku sudah berhasil ditambahkan ke dalam stack ');
end;

procedure PopBuku(var S:stack);
var ya:char;
begin
  WriteLn('Mengambil data dari stack buku');
  WriteLn('Berikut adalah buku di posisi teratas stack buku : ');
  WriteLn('Judul Buku : ',S.judul[S.tos]);
  WriteLn('Pengarang : ',S.pengarang[S.tos]);
  WriteLn('yakin akan diambil buku tsb <y/t> ? ');ReadLn(ya);
  if (ya='Y') or (ya='y') then
  begin
    dec(S.tos);
    WriteLn('Buku sudah diambil dari tumpukan ');
  end
  else WriteLn('buku tidak jadi diambil dari stack ');
end;

procedure PrintBuku(var S:stack);
begin
  WriteLn('Daftar Buku di tumpukan saat ini dan posisiya ');
  WriteLn('-----------------------------------------------');
  WriteLn('Posisi   judul   Pengarang   ');
  WriteLn('-----------------------------------------------');
  for i:=S.tos downto S.bos do WriteLn(i:3,' ',S.judul[i]:15,' ',S.pengarang[i]:10);
  WriteLn('-----------------------------------------------');
  WriteLn('Saat ini ada ',S.tos,' buku di dalam stack');
end;

begin

// inisialisasi
stackbuku.tos:= 0; stackbuku.bos:=1;

repeat
  clrscr;
  WriteLn('Manipulasi Stack Buku');
  WriteLn('1. Push Data ke Stack Buku');
  WriteLn('2. Pop Data ke Stack Buku');
  WriteLn('3. Cetak Stack Buku');
  WriteLn('0. selesai');
  Write('pilih menu 0-3 : ');ReadLn(pil);
  case pil of 
    1:if isFull(stackbuku)=true then WriteLn('Stcak buku sudah penuh') else PushBuku(stackbuku);
    2:if isEmpty(stackbuku)=true then WriteLn('Stcak buku kosong') else PopBuku(stackbuku);
    3:if isEmpty(stackbuku)=true then WriteLn('Stcak buku kosong') else PrintBuku(stackbuku);
    0:WriteLn('terimakasih') else WriteLn('Anda ');
  end;
  ReadLn;

until pil = 0;
end.
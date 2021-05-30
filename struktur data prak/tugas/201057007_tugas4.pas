program week4_stack;
uses crt;

const
    max = 3;
type
    stack = record
    kode:array[1..max] of string;
    judulcd : array [1 .. max] of string;
    tahun : array [1 .. max] of integer;
    top, bottom : 0 .. max;
end;

var
    cd : stack;
    i, pil : byte;

// --------- Function ---------------
function isEmpty(x : stack) : boolean;
begin
    if x.top = 0 then
        isEmpty := true
    else
        isEmpty := false;
end;

function isFull(x : stack) : boolean;
begin
    if x.top = max then
        isFull := true
    else
        isFull := false;
end;

// -------------- Procedure ------------------
procedure pushcd(var x : stack);
var
    judulcd,kode : string; tahun : integer;ada:Boolean;
label ulang;
begin
    writeln;
    ulang:
    ada:=false;
    writeln('---- Push cd baru ke stack ----');
    Write('masukkan kode cd : ');ReadLn(kode);
    
    // validasei kode cd sudah ada atau belum
     for i := x.top downto x.bottom do 
     begin
       if kode =x.kode[x.top] then
       begin
            ada:=true;
            WriteLn('kode cd sudah digunakan, ulangi input kode ! ');
            ReadLn;
            goto ulang;
       end;
     end;

    // jika belum ada maka tambahkan  cd
    if ada = false then
    begin
        inc(x.top);
        write('Masukan judulcd cd yang akan di push : '); readln(judulcd);
        write('masukan tahun dibuat cd yang akan di push : '); readln(tahun);
        x.kode[x.top] := kode;
        x.judulcd[x.top] := judulcd;
        x.tahun[x.top] := tahun;
        writeln('cd berhasil di push');
    end;
end;

procedure popcd(var x : stack);
var
ya : char;
begin
    writeln('---- cd dari stack ----');
    writeln('cd diposisi teratas adalah ', x.judulcd[x.top]);
    write('yakin akan diambil <y/t> ? '); readln(ya);
    
    if (ya = 'Y') or (ya = 'y') then
    begin
        writeln('cd dengan judulcd : ', x.judulcd[x.top] ,' diambil');
        writeln('Tahun dibuat : ', x.tahun[x.top] ,' diambil');
        dec(x.top);
        writeln('Pop cd berhasil');
    end
    else
        writeln('cd dengan judulcd : ', x.judulcd[x.top] ,' tahun dibuat ',
    x.tahun[x.top] ,' batal diambil');
end;

procedure printcd(var x : stack);
begin
    writeln('cd didalam stack');
    writeln('------------------------------------------------------');
    writeln('Posisi   Kode          Judulcd            Tahun dibuat');
    writeln('-------------------------------------------------------');
    
    for i := x.top downto x.bottom do
        writeln(i:3 ,'      ',x.kode[i],' ', x.judulcd[i]:20 ,' ', x.tahun[i]:20);
    
    writeln('-------------------------------------------------------');
    writeln('Jumlah cd di stack = ', x.top ,' buah');
end;

procedure searchcd(x :stack);
var kode,ya:string;ada:Boolean;
label ulang;
begin
  ulang:
  ada:=False;
  clrscr;
  write('masukkan kode cd :');ReadLn(kode);
  WriteLn;
  WriteLn('Hasil Pencarian :');
   for i:= x.top downto x.bottom do
     begin
        if kode = x.kode[i] then
        begin
            ada:=true;
            WriteLn(' kode : ',x.kode[i],' , judul cd : ',x.judulcd[i],' , tahun cd dibuat : ',x.tahun[i]);
        end;
     end;
     if ada=false then WriteLn(' data dengan kode : ',kode,' tidak ditemukan');
     WriteLn;
     Write('apakah mau mencari lagi ? y/t');readln(ya);
    if (ya='y')or(ya='Y') then goto ulang
    else WriteLn('keluar menu');
end;

begin
    cd.top := 0;
    cd.bottom := 1;
    repeat
        clrscr;
        writeln('Stack cd');
        writeln('1. Push cd');
        writeln('2. Pop cd');
        writeln('3. Cetak cd');
        writeln('4. Search cd');
        writeln('0. Selesai');
        write('Pilih menu 0 - 4 : '); readln(pil);
    
        case pil of
        1: if isFull(cd) then
                writeln('Stack penuh')
            else
                pushcd(cd);
        2: if isEmpty(cd) then
                writeln('Stack kosong')
            else
                popcd(cd);
        3: if isEmpty(cd) then
            writeln('Stack kosong')
            else
                printcd(cd);
        4: if isEmpty(cd) then
            writeln('Stack kosong')
            else
                searchcd(cd);
        0: writeln('Terimakasih')
        else
        writeln('Pilihan Salah');
        
        end;
        readln;
    
    until (pil = 0);
end.
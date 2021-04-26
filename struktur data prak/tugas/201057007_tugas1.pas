// nama : izza wildan ridhoni
// nim  : 201057007
program komik.id;
uses crt;
const max=20;
type
    komik1=array[1..max] of string;
    komik2=array[1..max] of real;
var judul,penulis,jenisKomik:komik1;
    harga:komik2;
    pil,i,n:integer;

procedure tambah_data(var x,y,z:komik1);
begin
    inc(n);

    writeln('Menambah data baru');
    write('masukkan judul baru : ');readln(x[n]);
    write('nama Penulis : ');readln(y[n]);
    write('jenis komik : ');readln(z[n]);

    writeln('Data sudah ditambahkan');
end;

procedure cetak_data(var x,y,z:komik1;var h:komik2);
begin
    writeln('DAFTAR Komik dan harga ');
    writeln('---------------------------------------------');
    writeln('No     judul        penulis     jenis       harga');
    writeln('---------------------------------------------');
    for i:=1 to n do writeln(i:2,'   ',x[i]:10,'   ',y[i]:14,'    ',z[i]:5,'    Rp.',h[i]:5:2);
    writeln('---------------------------------------------');
    writeln('Saat ini tercatat ',n, ' komik');
end;

procedure tambahHarga(var x,y,z:komik1;var h:komik2);    
var ada:Boolean;judul:String;j,pos:byte;
begin
    ada:=false;
    WriteLn;
    Write('masukkan judul komik : ');ReadLn(judul);
    for j:=1 to n do
      begin
        if judul=x[j]  then begin ada:=true; pos:=j;end;
      end;

    if ada then
    begin
      if h[pos] = 0 then begin
        Write('masukkan harga komik : Rp.');ReadLn(h[pos]);
        WriteLn('data berhasil diinpuitkan');
      end
      else  WriteLn('harga komik sudah diinputkan');
    end
    else WriteLn('komik ',judul,' belum pernah diinputkan');
end;

begin
n:=0;
repeat
    clrscr;
    writeln('Pengelolaan data Komik ');
    writeln('1. Input data komik');
    writeln('2. Cetak data komik');
    writeln('3. input harga komik');
    writeln('0. Selesai');
    write('Pilih menu : ');readln(pil);
    
    case pil of
        1: if n=max then writeln('Kelas sudah penuh') else tambah_data(judul,penulis,jenisKomik);
        2: if n=0 then writeln('Data masih kosong') else cetak_data(judul,penulis,jenisKomik,harga);
        3: if n=0 then writeln('Data masih kosong') else tambahHarga(judul,penulis,jenisKomik,harga);
        0: writeln('Terimakasih , by izza wildan ridhoni | 201057007') else writeln('Anda salah pilih menu');
    end;

    readln;
until pil=0;

end.
program komik.id;
uses crt;
const max=20;
type
    array1=array[1..max] of string;
    array2=array[1..max] of real;
var nama,jur:array1;
    ipk:array2;
    pil,i,n:integer;

procedure tambah_data(var x,y:array1);
begin
    writeln('Menambah data baru');
    inc(n);
    write('masukkan nama baru : ');readln(x[n]);
    write('masukkan prodinya : ');readln(y[n]);
    writeln('Data sudah ditambahkan');
end;

procedure isi_ipk(var x,y:array1;var z:array2);
var nama_isi:string; ada:boolean;
label ulang;
begin
    ada:=false;
    writeln('Mengisi ip mahasiswa');
    write('masukkan nama mhs yang akan diisi ipnya : ');readln(nama_isi);
    for i:=1 to n do
    begin
        if x[i]=nama_isi then
        begin
            ada:=true;
            if z[i]<>0 then writeln('Nama ',nama_isi,' sudah pernah diisi ipknya')
            else
            begin
            ulang:
            write('masukkan ipk mhs tsb : ');readln(z[i]);
            if (z[i]<=0.0) or (z[i]>4.0) then
            begin writeln('Data tidak valid, ulangi pengisian');goto ulang;end;
            writeln('Pengisian berhasil');
        end;
    end;
end;
if not ada then writeln('nama ',nama_isi,' tidak ditemukan pengisian gagal');
end;

procedure cetak_data(var x,y:array1;var z:array2);
begin
    writeln('DAFTAR MAHASISWA DAN IPNYA');
    writeln('---------------------------------------------');
    writeln('No Nama Prodi IPK');
    writeln('---------------------------------------------');
    for i:=1 to n do writeln(i:2,' ',x[i]:10,' ',y[i]:14,' ',z[i]:5:2);
    writeln('---------------------------------------------');
    writeln('Saat ini tercatat ',n, 'mahasiswa');
end;

begin
n:=0;
repeat
    clrscr;
    writeln('Pengelolaan data mahasiswa');
    writeln('1. Input data');
    writeln('2. Cetak data');
    writeln('3. Input IP');
    writeln('0. Selesai');
    write('Pilih menu : ');readln(pil);
    case pil of
    1: if n=max then writeln('Kelas sudah penuh') else
    tambah_data(nama,jur);
    2: if n=0 then writeln('Data masih kosong') else
    cetak_data(nama,jur,ipk);
    3: if n=0 then writeln('Belum ada mhs terdaftar') else
    isi_ipk(nama,jur,ipk);
    0: writeln('Terimakasih') else writeln('Anda salah pilih menu');end;
    readln;
until pil=0;
end.
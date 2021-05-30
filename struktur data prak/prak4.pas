uses crt;
const max=10;

type antrian=record
    nama:array[1..max] of string;
    belanja:array[1..max] of longint;
    depan,belakang:0..max;
end;

var q:antrian;
    masuk,keluar:string;
    bayarin,bayarout:longint;
    lagi:boolean;
    pilih:1..5;
    cacah:byte;hasil:real;

function penuh(q:antrian):boolean;
begin
    if q.belakang=max then penuh:=true else penuh:=false;
end;

function kosong(q:antrian):boolean;
begin
    if q.belakang=0 then kosong:=true else kosong:=false;
end;

procedure pushq(var q:antrian;m:string;b:longint);
begin 
    if penuh(q) then writeln('maaf antrian sedang penuh')
    else
    begin
        inc(q.belakang);
        q.nama[q.belakang]:=m;q.belanja[q.belakang]:=b;
    end;
end;{end of procedure pushq}

procedure popq(s:antrian);
var i:byte;
begin
    if kosong(q) then writeln('antrian sudah kosong')
    else
    begin
        keluar:=q.nama[q.depan]; {mengambil pengantri paling depan}
        bayarout:=q.belanja[q.depan];
        writeln('yang dilayani adalah Mr/Ms ',keluar,' dengan belanja Rp ',bayarout);
        inc(cacah);hasil:=hasil+bayarout;
        {pergeseran posisi pengantri ke kiri/depan}

        for i:=1 to q.belakang-1 do
        begin
            q.nama[i]:=q.nama[i+1];
            q.belanja[i]:=q.belanja[i+1];
        end;
        dec(q.belakang); {mengurangi jumlah antrian}
    end;
end;{end of procedure popq}

procedure cetak(var q:antrian);
var i:byte;
begin
    if kosong(q) then writeln('daftar antrian kosong')
    else
    begin
        writeln('DAFTAR PENGANTRI SAAT INI ==> ');
        writeln('---------------------------------------');
        writeln('posisi  nama   belanja');
        writeln('---------------------------------------');
        for i:=1 to q.belakang do
            writeln(i:4,q.nama[i]:15,' ',q.belanja[i]:8);
    end;
    writeln('---------------------------------------');
end;{end of procedure cetak}

begin {program utama}
    q.depan:=1;q.belakang:=0;
    lagi:=true;
    while lagi do
    begin
        clrscr;writeln('ANTRIAN DI KASIR TOKO MAJU JAYA');
        writeln('1. Antrian masuk');
        writeln('2. Layanan kasir');
        writeln('3. Cetak antrian');
        writeln('4. Cek pendapatan sementara');
        writeln('5. Toko tutup dan tampilkan pendapatan hari itu');
        write('Pilih 1-5 --> ');readln(pilih);
        case pilih of
        1: begin
            writeln('nama baru ==> ');readln(masuk);
            writeln('jumlah belanja ==> ');readln(bayarin);
            pushq(q,masuk,bayarin);
            end;
        2: popq(q);
        3: cetak(q);
        4: begin
            writeln('hasil sementara penjualan adalah Rp ',hasil:8:2);
            writeln('jumlah pengunjung sementara ',cacah,' orang');
            end;
        5: begin
            writeln('Pendapatan total hari ini adalah Rp ',hasil:8:2);
            writeln('Pengunjung hari ini sebanyak ',cacah,' orang');
            lagi:=false;
            end;
        end;
    readln;
    end;
end.
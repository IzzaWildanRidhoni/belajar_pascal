program w2_1_array_record;
uses crt;

type
    // membuat record
    rec_buku = record
        kode_buku : string;
        judul_buku : string;
        jml_halaman : integer;
        harga : double;
    end;

    // membuat array dari record
    arr_buku = array [1 .. 5] of rec_buku;

var
    buku,bayangan : arr_buku;
    pil_menu, n, i,j : integer;

procedure tambahData(var buku : arr_buku);
var kode : string;
label ulang;
begin
    writeln(' --- TAMBAH DATA ---');
    inc(n);
    // input data user, dan simpan kedalam array record
    ulang:
    write('masukan kode buku = '); readln(kode);
    // validasi kode buku
    for i := 1 to n do
        begin
            if (kode = buku[i].kode_buku) then
            begin
                writeln('Kode sudah digunakan, ulangi');
                goto ulang;
            end;
        end;

    buku[n].kode_buku := kode;
    write('masukan judul buku = '); readln(buku[n].judul_buku);
    write('masukan halaman buku = ');
    readln(buku[n].jml_halaman);
    write('masukan harga buku = '); readln(buku[n].harga);
end;

procedure tampilkanData(buku : arr_buku);
begin
    writeln(' --- DAFTAR BUKU ---');
    writeln(' No. Kode Judul Buku Halaman Harga ');
    writeln('---------------------------------------------------------');
        for i := 1 to n do
        begin
            writeln(i:3,' ', buku[i].kode_buku:5 ,' ',
            buku[i].judul_buku:15 ,' ', buku[i].jml_halaman:12 ,' ',
            buku[i].harga:15:2);
        end;
writeln('---------------------------------------------------------');
end;

procedure hapusData(var buku : arr_buku);
var
kode : string;
indexData : integer;
isFound : boolean = false;
begin
    writeln(' --- HAPUS DATA ---');
    write('Masukan kode buku yang akan dihapus = ');
    readln(kode);
    // proses pencarian kode
        for i := 1 to n do
        begin
            if kode = buku[i].kode_buku then
                begin
                    indexData := i;
                    isFound := true;
                    break;
                end;
        end;
    // jika ketemu lakukan penghapusan
    // dengan memajukan data untuk menumpuk data yang akandihapus
    // kemudian jumlah data yang ada dikurang 1
    if isFound then
    begin
        for i := indexData to n do
        begin
            buku[i].kode_buku := buku[i + 1].kode_buku;
            buku[i].judul_buku := buku[i + 1].judul_buku;
            buku[i].jml_halaman := buku[i + 1].jml_halaman;
            buku[i].harga := buku[i + 1].harga;
        end;
    writeln('Data berhasil di hapus');
    dec(n);
    end
    else
    writeln('Data tidak ditemukan');
end;

procedure editData(var buku : arr_buku);
var
kode : string;
indexData : integer;
isFound : boolean = false;
begin
writeln(' --- EDIT DATA ---');
write('Masukan kode buku yang akan diubah = ');
readln(kode);
// proses pencarian kode
for i := 1 to n do
begin
    if kode = buku[i].kode_buku then
        begin
            indexData := i;
            isFound := true;
            break;
        end;
    end;
    
// jika ketemu lakukan pengeditan
    if isFound then
        begin
            write('masukan kode buku = ');
            readln(buku[indexData].kode_buku);
            write('masukan judul buku = ');
            readln(buku[indexData].judul_buku);
            write('masukan halaman buku = ');
            readln(buku[indexData].jml_halaman);
            write('masukan harga buku = ');
            readln(buku[indexData].harga);
            writeln;
            writeln('Data berhasil diubah');
        end
    else
    writeln('Data tidak ditemukan');
end;

procedure cariData(buku : arr_buku);
var
    kode : string;
    indexData : integer;
    isFound : boolean = false;
begin
    writeln(' --- CARI DATA ---');
    write('Masukan kode buku = '); readln(kode);
    // proses pencarian kode
    for i := 1 to n do
    begin
    if kode = buku[i].kode_buku then
        begin
            indexData := i;
            isFound := true;
            break;
        end;
    end;

    if isFound then
        begin
            // tampilkan data
            writeln;
            writeln('Kode Buku : ',
            buku[indexData].kode_buku);
            writeln('Judul Buku : ',
            buku[indexData].judul_buku);
            writeln('Jumlah Halaman : ',
            buku[indexData].jml_halaman);
            writeln('Harga : ',
            buku[indexData].harga:0:2);
        end
    else
    writeln('Data tidak ditemukan');
end;

procedure urut_data(var X:arr_buku); {sorting}
var dummy: rec_buku;
begin
    {kirim buku ke record bayangan}
    for i:=1 to n do bayangan[i]:=x[i];
    {proses sorting}
    for i:=1 to n-1 do
    begin
        for j:=i+1 to n do
        begin
            if bayangan[i].judul_buku>bayangan[j].judul_buku then
                begin
                    dummy:=bayangan[i];
                    bayangan[i]:=bayangan[j];
                    bayangan[j]:=dummy;
                end;
        end;
    end;
    {cetak hasil sorting};
    writeln('DATA BUKU SESUDAH DIURUTKAN BERDASAR JUDUL SBB: ');writeln;
    tampilkanData(bayangan);
end;

begin
n := 0;
repeat
clrscr;
writeln('Max Data = ', length(buku));
writeln('Jml data sekarang = ', n);
writeln;
writeln('masukan pilihan menu');
writeln('1. Tambah data');
writeln('2. Tampilkan data');
writeln('3. Hapus data');
writeln('4. Ubah data');
writeln('5. Cari data');
writeln('6. Sorting data');
writeln('0. Keluar');
write('masukan pilihan menu : '); readln(pil_menu);
writeln;

    case pil_menu of
    1 : if n >= length(buku) then writeln('Database penuh') else tambahData(buku);
    2 : if n = 0 then writeln('Database Kosong') else tampilkanData(buku);
    3 : if n = 0 then writeln('Database Kosong') else hapusData(buku);
    4 : if n = 0 then writeln('Database Kosong') else editData(buku);
    5 : if n = 0 then writeln('Database Kosong') else cariData(buku);
    6 : if n = 0 then writeln('Database Kosong') else urut_data(buku);
    0 : writeln('Terimakasih') else writeln('input menu salah');
    end;

readln;
until (pil_menu = 0);
end.
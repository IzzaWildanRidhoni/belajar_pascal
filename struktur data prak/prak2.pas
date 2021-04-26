program  belajarRecord;
uses crt;

type rec_buku = record
            id_buku:string;
            judul_buku:string;
            jml_halaman:Integer;
    end;    

var	buku:rec_buku;

begin
    // input data kedalam record
    buku.id_buku:='B001';
    buku.judul_buku:='c++';
    buku.jml_halaman:=5;

    // cetak isi record
    WriteLn('Id buku',buku.id_buku);
    WriteLn('Judul Buku',buku.judul_buku);
    WriteLn('Jml halaman',buku.jml_halaman);
end.
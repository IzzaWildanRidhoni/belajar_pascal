program latihanpointer;
uses crt;

// deklarasi
var	
    angka:integer;//variabel
    pointer_angka:^Integer;//type data yang berisi alamat dari suatu varibel

begin
    pointer_angka:=@angka;//cara mengisi alamat variabel
    WriteLn(pointer_angka^);//cara menampilkan isi pointer_angka
end.
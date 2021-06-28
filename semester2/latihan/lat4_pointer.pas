program 	tipe_pointer;
uses crt;


var	angka:integer;
    pointer:^integer;
    i:^Word;

begin
    angka:=99;
    WriteLn('variabel angka berisi : ',angka);

    pointer:=@angka;
    WriteLn('variabel pointer merujuk ke nilai : ',pointer^);

    i:=Addr(pointer);
    WriteLn('Alamat memory yang digunakan adalah : ',i^);
end.

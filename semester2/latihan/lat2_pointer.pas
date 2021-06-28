program 	tipepointer;
uses crt;

var	angka:integer;
    pointer_angka:^integer;

begin
    // System('cls');
    angka:=99;
    WriteLn('variabel angka berisi : ',angka);

    pointer_angka:=@angka;
    WriteLn('variabel pointer merujuk ke nilai  : ',pointer_angka^);

    angka:=74;
    WriteLn('variabel pointer merujuk ke nilai  : ',pointer_angka^);
end.
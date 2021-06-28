program 	tipeinteger;
uses crt;


var	nama:string[20];
    pointer:^string;

begin
    nama:='unyil';
    WriteLn('variabel nama berisi : ',nama);

    pointer:=@nama;
    WriteLn('variabel pointer merujuk ke nilai : ',pointer^);
    
    nama:='alex';
    WriteLn('variabel pointer merujuk ke nilai : ',pointer^);
    
    pointer^:='joni';
    WriteLn('variabel nama berisi : ',nama);
    
end.

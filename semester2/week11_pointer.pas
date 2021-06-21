program test_pointer;
uses crt;

type pointer=^integer;

var p,q:Integer;
    ptrp,ptrq,ptrz:pointer;
    i:^word;

begin
    p:=10; q:=15;
    new(ptrp);New(ptrq);New(ptrz); //wajib sebelum menggunakan var pointers hrs diinisialisasi
    WriteLn('p = ',p,' , q = ',q);
    ptrp:=@p;ptrq:=@q; //@ untuk menangkap alamat
    i:=addr(ptrp);WriteLn('Alamat dari p adalah ',i^);
    i:=addr(ptrq);WriteLn('Alamat dari q adalah ',i^);
    ptrz:=ptrp;//copy pointer
    i:=Addr(ptrz);WriteLn('alamat dari z adalah ',i^);
    WriteLn('Masukkan nilai ke alamat ptrp : ');ReadLn(ptrp^);//isi pointer namavar^
    WriteLn('isi pointer p = ',ptrp^);
    WriteLn('Masukkan nilai ke alamat ptrq : ');ReadLn(ptrq^);
    WriteLn('isi pointer q = ',ptrq^);
    WriteLn('Masukkan nilai ke alamat ptrz : ');ReadLn(ptrz^);
    WriteLn('isi pointer z = ',ptrz^);
    // mengkopi isi
    ptrq^:=ptrz^;
    WriteLn('isi pointer q sekarang adalah = ',ptrq^);
    // Dispose(ptrp);Dispose(ptrq);Dispose(ptrz);//dilepaskan tidak wajib tapi disarankan 

end.

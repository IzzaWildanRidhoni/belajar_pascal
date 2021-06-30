program  pelayananPajakLinkedlist;
uses crt;

type Pointer_antri = ^rec_antrian;
     rec_antrian = record
                    no_antri:byte;
                    next:Pointer_antri;
    end;
    Pointer_plyn=^rec_pelayanan;
    rec_pelayanan = record
                    kode_pelayanan,nama,jenis_pajak:string;
                    bayar:LongInt;
                    next:Pointer_plyn;
    end;

var	front,rear:Pointer_antri;
    awal,akhir:Pointer_plyn;
    pil,i:byte;

procedure add_antrian(var X,Y:Pointer_antri);
var baru:Pointer_antri;
begin
    New(baru);
    Inc(i);
    baru^.no_antri:=i;
    baru^.next:=Nil;
    if X=Nil then
    begin
      X:=baru;Y:=baru;
    end 
    else
      begin
        Y^.next:=baru;Y:=baru;
      end;
    WriteLn('------------------------------');
    WriteLn('anda mendapat nomer ke : ',Y^.no_antri);
    WriteLn('------------------------------');
end;    

procedure layanan_pajak(var X,Y:Pointer_antri;var A,B:Pointer_plyn);
var kode:String;baru,token:Pointer_plyn;ada:Boolean;
label ulang;
begin
    clrscr;
    WriteLn('selamat datang di pelayanan pajak');
    WriteLn('------------------------------');
    WriteLn('no antrian ke : ',X^.no_antri);
    WriteLn('------------------------------');

    // hapus no mer antri dari linked list
    // kita pindahkan pointer ke node seudahnyas
    X:=X^.next;

    ulang:
    new(token);
    ada:=False;
    token:=A;

    // masuk pelayanan pajak
    Write('masukkan kode pelayanan : ');ReadLn(kode);
    // cek apakah kode pelayanan unik?
    while token<>Nil do
    begin
        if token^.kode_pelayanan=kode then
        begin
          ada:=true;Break;
        end; 
        token:=token^.next;
    end;

    if ada=true then begin  WriteLn('kode tidak unix, ulangi'); goto ulang; end;
    

    new(baru);
    baru^.kode_pelayanan:=kode;
    Write('masukkan nama lengkap : ');ReadLn(baru^.nama);
    Write('masukkan jenis pajak : ');ReadLn(baru^.jenis_pajak);
    Write('masukkan jumlah bayar : ');ReadLn(baru^.bayar);
    baru^.next:=Nil;
    
    if A=Nil then
    begin
      A:=baru;B:=baru;
    end 
    else
      begin
        B^.next:=baru;B:=baru;
      end;
end;

procedure cetak_antrian(var X,Y:Pointer_antri);
var n:byte;token:Pointer_antri;
begin
  n:=0;
  token:=X;
  WriteLn('-----------------------------------');
  WriteLn('No    No-Antrian ');
  WriteLn('-----------------------------------');
  while token<>Nil do
  begin
    Inc(n);
    WriteLn(n,'  ',token^.no_antri);
    token:=token^.next;
  end;
  WriteLn('-----------------------------------');
  WriteLn('ada  ',n,' antrian');
end;

begin
    new(front);New(rear);New(awal);new(akhir);
    front:=Nil;rear:=Nil;awal:=Nil;akhir:=nil;i:=0;

    repeat
        clrscr;
        WriteLn('-----------------------------------');
        WriteLn('selamat datang di Pelayanan Pajak ');
        WriteLn('-----------------------------------');
        WriteLn('1. Ambil antrian');
        WriteLn('2. pelayanan  pajak');
        WriteLn('3. Cetak antrian');
        WriteLn('0. exit');
        Write('pilih menu ke : ');ReadLn(pil);
        case pil of
        1:add_antrian(front,rear);
        2:if front=nil then WriteLn('belum ada antrian ') else layanan_pajak(front,rear,awal,akhir);
        3:if front=nil then WriteLn('belum ada antrian ') else cetak_antrian(front,rear);
        0:WriteLn('terimakasih ') else WriteLn('anda salah pilih menu');
        end;
    
        ReadLn;
    until pil=0;
end.
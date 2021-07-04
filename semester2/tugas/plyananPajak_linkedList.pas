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
    pil,i,nomer:byte;

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

procedure cetak_pelayanan(var A,B:Pointer_plyn);
var n:byte;token:Pointer_plyn;
begin
  n:=0;
  token:=A;
  WriteLn('laporan pelayanan');
  WriteLn('--------------------------------------');
  WriteLn('No   kode   nama     jenis      bayar');
  WriteLn('--------------------------------------');
  while token<>Nil do
  begin
    Inc(n);
    WriteLn(n,'  ',token^.kode_pelayanan,' ',token^.nama,' ',token^.jenis_pajak,' ',token^.bayar);
    token:=token^.next;
  end;
  WriteLn('-----------------------------------');
  WriteLn('ada  ',n,' antrian');
end;


procedure keluar_antrian(var X,Y:Pointer_antri;var nomer:byte);
var bantu,hapus:Pointer_antri;ada:Boolean;
begin
  ada:=false;
  // cek apakah ada di depan
  if X^.no_antri = nomer then begin
     ada:=true;
     X:=X^.next;
  end
  // apakah ada di terakhir
  else if Y^.no_antri = nomer then 
  begin
    ada:=true;
    new(bantu);bantu:=X;
    if X=Y then begin
        X:=X^.next
    end
    else begin
    //   letakkan pointer bantu ke node sebelum node terakhir
        while (bantu^.next)^.next <> Nil  do bantu:=bantu^.next;
        // bantu sudah ada diposisi node sebelum node terakhir
        hapus:=Y;
        // proses di linked list
        Y:=bantu;Y^.next:=nil;//posisi rear sekarang berada di node bantu, next-nya di nil kan kr merupakan node terakhir
        Dispose(hapus);
    end;
  end
    //  data berada ditengah bukan di front bukan di rear
  else
  begin
    new(bantu);
    bantu:=X;
    while bantu^.next<>nil do
    begin
      if ((bantu^.next)^.no_antri=nomer)then
        begin
            new(hapus);
            ada:=True;
            //   paket ada di node sesudah node bantu
            hapus:=bantu^.next;
            // operasi penghapusan node 
            bantu^.next:=hapus^.next;//lepas kait dari bantu di hubungkan ke node sesudah node tempat paket diambil
            Dispose(hapus);
        end;
        bantu:=bantu^.next;
    end;
  end;
  if not ada  then WriteLn('nomer antri ',nomer,' tidak ditemukan ');
end;


procedure layanan_prioritas(var X,Y:Pointer_antri;var A,B:Pointer_plyn);
var token:Pointer_antri;baru,token2:Pointer_plyn;nomer:byte;ada:Boolean;kode:String;
label ulang,ulang2;
begin
    clrscr;
    WriteLn('LAYANAN PRIORITAS PEMBAYARAN PAJAK');
    cetak_antrian(X,Y);
    WriteLn;

    ulang:
    token:=X;
    ada:=false;

    Write('masukkan nomer antrian yang diprioritaskan : ');ReadLn(nomer);
    while token<>Nil do
    begin
      if token^.no_antri = nomer then
      begin
        ada:=true;
        keluar_antrian(X,Y,nomer);Break;
      end;
      token:=token^.next;
    end;
    if not ada then begin  WriteLn('nomer tidak ada , ulangi'); goto ulang; end;
    
    ulang2:
    token2:=A;
    ada:=false;
    // masuk pelayanan pajak
    Write('masukkan kode pelayanan : ');ReadLn(kode);
    // cek apakah kode pelayanan unik?
    while token2<>Nil do
    begin
        if token2^.kode_pelayanan=kode then
        begin
          ada:=true;Break;
        end; 
        token2:=token2^.next;
    end;

    if ada=true then begin  WriteLn('kode tidak unix, ulangi'); goto ulang2; end;
    

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
        WriteLn('4. Cetak pelayanan');
        WriteLn('5. Layanan prioritas');
        WriteLn('6. keluar dari antrian');
        WriteLn('0. exit');
        Write('pilih menu ke : ');ReadLn(pil);
        case pil of
        1:add_antrian(front,rear);
        2:if front=nil then WriteLn('belum ada antrian ') else layanan_pajak(front,rear,awal,akhir);
        3:if front=nil then WriteLn('belum ada antrian ') else cetak_antrian(front,rear);
        4:if awal=nil then WriteLn('belum ada pelayanan ') else cetak_pelayanan(awal,akhir);
        5:if front=nil then WriteLn('belum ada antrian ') else layanan_prioritas(front,rear,awal,akhir);
        6:if front=nil then WriteLn('belum ada antrian') else begin
          cetak_antrian(front,rear);WriteLn;
          Write('masukkan nomer antri yg akan dikeluarkan  :');ReadLn(nomer);
          keluar_antrian(front,rear,nomer);
        end;
        0:WriteLn('terimakasih ') else WriteLn('anda salah pilih menu');
        end;
    
        ReadLn;
    until pil=0;
end.

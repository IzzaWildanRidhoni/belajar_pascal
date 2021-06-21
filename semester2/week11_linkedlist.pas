program w12linkedlist;
uses crt;

type Pointer = ^rec_pointer;
     rec_pointer = record
                nama,isi_paket:String;
                next:Pointer;
     end;

var	front,rear:Pointer;
    i,pil:byte;

procedure add_rear(var X,Y:Pointer);
var baru:Pointer;
begin
  new(baru);
  WriteLn('catat data paket');
  Write('Penerima  : ');ReadLn(baru^.nama);
  Write('Isi Paket : ');ReadLn(baru^.isi_paket);
  baru^.next:=Nil;
  if X = Nil then //jika awal =nil artinya baru adalah paket pertama yang masuk
    begin
      X:=baru;Y:=baru;
    end
  else 
    begin
      Y^.next:=baru;Y:=baru;
    end;
    WriteLn('Paket sudah ditambahkan di posisi pengantaran terakhir ');
end;

procedure add_front(var X,Y:Pointer);
var baru:Pointer;
begin
  new(baru);
  WriteLn('catat data paket');
  Write('Penerima  : ');ReadLn(baru^.nama);
  Write('Isi Paket : ');ReadLn(baru^.isi_paket);
  baru^.next:=Nil;
  if X = Nil then //jika awal =nil artinya baru adalah paket pertama yang masuk
    begin
      X:=baru;Y:=baru;
    end
  else 
    begin
      baru^.next:=X;X:=baru;//paket baru diantar pertama
    end;
    WriteLn('Paket sudah ditambahkan di posisi pengantaran terakhir ');
end;

procedure print_paket(var X,Y:Pointer);
var token:Pointer;
begin
  new(token);
  token:=X;i:=0;
  WriteLn('------------------------------------');
  WriteLn('No   Penerima       Isi Paket');
  WriteLn('------------------------------------');
  while token<>Nil do
  begin
    Inc(i);
    WriteLn(i:2,'  ',token^.nama:10,'  ',token^.isi_paket:15);
    token:=token^.next;
  end;
  WriteLn('------------------------------------');
  WriteLn('Paket yang harus diantar ada ',i,' buah paket');
end;


begin
    new(front);New(rear);
    front:=Nil;rear:=Nil;
    repeat
        clrscr;
        WriteLn('mengelola paket pengiriman barang');
        WriteLn('1.Tambah paket di posisi terakhir ');
        WriteLn('2.Tambah paket di posisi pertama ');
        WriteLn('3.cetak daftar paket');
        WriteLn('0. selesai');
        Write('pilih menu : ');ReadLn(pil);
        case pil of
        1:add_rear(front,rear);
        2:add_front(front,rear);
        3:if front=Nil then WriteLn('belum ada paket yang akan di antar ') else print_paket(front,rear);
        4:WriteLn('Terimakasih ') else WriteLn('salah pilih menu');
        end;
        ReadLn;
    until pil=0;

end.
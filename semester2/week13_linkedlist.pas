program w13linkedlist;
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

procedure ambil_paket_pertama(var X,Y:Pointer);
var ambilpaket:Pointer;
begin
  new(ambilpaket);
  ambilpaket:=X;
  WriteLn('anda akan mengambil paket yang pertama ');
  WriteLn('paket yang diambil atas nama : ',ambilpaket^.nama);
  WriteLn('isi paket adalah : ',ambilpaket^.isi_paket);
//   proses penghapusan di linked list
// pindahkan pointer ke node sesudah front
  X:=X^.next;
  WriteLn('paket sudah diambil');
  Dispose(ambilpaket);
end;

procedure ambil_paket_terakhir(var X,Y:Pointer);
var ambilpaket,bantu:Pointer;
begin
    new(bantu);bantu:=X;
    WriteLn('Mengambil paket terakhir ');
    if X=Y then begin
      WriteLn('paket tinggal satu');
      ambil_paket_pertama(X,Y);
    end
    else begin
    //   letakkan pointer bantu ke node sebelum node terakhir
        while (bantu^.next)^.next <> Nil  do bantu:=bantu^.next;
        // bantu sudah ada diposisi node sebelum node terakhir
        ambilpaket:=Y;
        WriteLn('anda akan mengambil paket yang terakhir datang');
        WriteLn('paket yang diambil atas nama : ',ambilpaket^.nama);
        WriteLn('isi paket adalah : ',ambilpaket^.isi_paket);
        WriteLn('paket sudah diambil');
        // proses di linked list
        Y:=bantu;Y^.next:=nil;//posisi rear sekarang berada di node bantu, next-nya di nil kan kr merupakan node terakhir
        Dispose(ambilpaket);
    end;
end;

procedure sisip_paket_nomor(var X,Y:pointer);
 var baru,bantu:pointer;
 nom,ii:byte;
 label ulang;

 begin
    new(bantu);bantu:=X;ii:=0;
    //cetak dulu
    print_paket(X,Y);
    ulang:
    write('Paket baru akan diletakkan di nomor urutan berapa? ');readln(nom);
    if (nom<1) or (nom>i+1) then
        begin writeln('Nomor tidak valid, ulangi');goto ulang;end;
    //sudah valid
    if nom=1 then Add_Front(X,Y) else
    if nom=(i+1) then Add_Rear(X,Y) else
    begin
        //letakkan bantu di posisi nom-1
        while (bantu^.next<>nil) do
        begin //while
            inc(ii);
            if(ii=nom-1) then //sudah diposisi sebelum node baru diletakkan
                begin
                    new(baru);
                    writeln('Catat data paket');
                    write('Penerima : ');readln(baru^.nama);
                    write('Isi paket : ');readln(baru^.isi_paket);
                    baru^.next:=nil;
                    //gandengkan
                    baru^.next:=bantu^.next;
                    bantu^.next:=baru;
                    writeln('Paket yang baru sudah diletakkan di posisi nomor ',nom);
                end; //end if
            bantu:=bantu^.next;
        end; //end while
    end;//end else nom<>1 dan nom<>i
end;

procedure ambil_paket_tt(var X,Y:Pointer);
var ambilpaket,bantu:Pointer;
    nama_ambil,isi_ambil:String;
    ada:Boolean;
begin
  print_paket(X,Y);
  ada:=false;
  WriteLn('Mengambil paket tertentu');
  Write('masukkan nama penerima paket');ReadLn(nama_ambil);
  write('isi paket: ');readln(isi_ambil);
//   cek di posisi pertama
  if ((X^.nama=nama_ambil) and (X^.isi_paket=isi_ambil)) then
  begin
    // paket yang diambil ada di posisi pertama
    ada:=true;
    ambil_paket_pertama(X,Y);
  end else
  if ((Y^.nama=nama_ambil) and (Y^.isi_paket=isi_ambil)) then
  begin
    // paket yang diambil ada di posisi terakhir
    ada:=true;
    ambil_paket_pertama(X,Y);
  end 
  else 
  begin
    // paket berada ditengah bukan di front bukan di rear
    new(bantu);
    bantu:=X;
    while bantu^.next<>nil do
    begin
      if ((bantu^.next)^.nama=nama_ambil) and ((bantu^.next)^.isi_paket=isi_ambil) then
        begin
            new(ambilpaket);
            ada:=True;
            //   paket ada di node sesudah node bantu
            ambilpaket:=bantu^.next;
            // cetak paket yang akan diambil
            WriteLn('anda akan mengambil paket atas nama : ',ambilpaket^.nama);
            WriteLn('isi paket                           : ',ambilpaket^.isi_paket);
            WriteLn('paket sudah diambil ');
            // operasi penghapusan node 
            bantu^.next:=ambilpaket^.next;//lepas kait dari bantu di hubungkan ke node sesudah node tempat paket diambil
            Dispose(ambilpaket);
        end;
        bantu:=bantu^.next;
    end;
  end;

  if not ada then WriteLn('paket atas nama ',nama_ambil,' dengan isi ',isi_ambil,' tidak ditemukan ' );
 


end;

begin
    new(front);New(rear);
    front:=Nil;rear:=Nil;
    repeat
        clrscr;
        WriteLn('mengelola paket pengiriman barang');
        WriteLn('1. Tambah paket di posisi terakhir ');
        WriteLn('2. Tambah paket di posisi pertama ');
        WriteLn('3. cetak daftar paket');
        writeln('4. Mengambil paket di posisi pertama');
        writeln('5. Mengambil paket terakhir');
        writeln('6. Menyisipkan paket di urutan tertentu');
        writeln('7. Mengambil paket tertentu');
        WriteLn('0. selesai');
        Write('pilih menu : ');ReadLn(pil);
        case pil of
        1:add_rear(front,rear);
        2:add_front(front,rear);
        3:if front=Nil then WriteLn('belum ada paket yang akan di antar ') else print_paket(front,rear);
        4:if front=nil then WriteLn('belum ada paket yang masuk ') else ambil_paket_pertama(front,rear);
        5:if front=nil then WriteLn('belum ada paket yang masuk ') else ambil_paket_terakhir(front,rear);
        6:if front=nil then WriteLn('penyisipan tidak bisa dilakukan') else sisip_paket_nomor(front,rear);
        7:if front=nil then WriteLn('belum ada paket yang masuk') else ambil_paket_tt(front,rear);
        0:WriteLn('Terimakasih ') else WriteLn('salah pilih menu');
        end;
        ReadLn;
    until pil=0;

end.
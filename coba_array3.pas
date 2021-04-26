program mahasiswa;
uses crt;
const 
    max=4;
type
    mystring=array[1..max] of string;
    mynumber=array[1..max] of integer;
    mychar=array[1..max] of char;
var 
    pil,n:Byte;
    nim,nama:mystring;
    nilai:mynumber;
    huruf:mychar;

function konversi(nilai:integer):char;
begin
    if nilai>=80 then konversi:='A'
    else if nilai >=60 then konversi:='B'
    else if nilai >=40 then konversi:='C'
    else konversi:='D';
end;

procedure input_data_mhs(var X,Y:mystring;var Z:mynumber;var Z1:mychar);
var ya:string;
begin
 repeat
  inc(n);
   
  Write('masukkan nim  :');ReadLn(X[n]);
  Write('masukkan nama :');ReadLn(Y[n]);
  Write('masukkan nilai:');ReadLn(Z[n]);
  Z1[n] := konversi(Z[n]);
  WriteLn;
  Write('tambah ? <y/t>');ReadLn(ya);
 until (n > 4) or (ya <> 'y');
end;

procedure cetak_data_mhs(var X,Y:mystring;var Z:mynumber;var Z1:mychar);
var i:byte;
begin
  writeln('========================');
  writeln('nim   nama    nilai    char');
  writeln('========================');
  for i:=1 to n do
    begin
      writeln(X[i],'    ',Y[i],'    ',Z[i],'    ',Z1[i]);
    end;
    readkey;
end;

procedure edit_data_mhs(var X,Y:mystring;var Z:mynumber;var Z1:mychar);
var edit:string;ada:Boolean;i:Byte;pos:byte;
begin   
    ada:=false;
    WriteLn('disini anda hanya diperkenankan mengedit data nilai');
    cetak_data_mhs(X,Y,Z,Z1);
    Write('masukkan nim yang akan diedit nilainya : ');ReadLn(edit);
    for i:=1 to n do
      begin
        if edit = X[i] then
        begin
          ada:=true;
          pos:=i;
        end;
      end;
    if ada then
    begin
      WriteLn('berikut data mhs yg akan diedit');
      WriteLn('nim :',X[pos]);
      WriteLn('nama :',Y[pos]);
      WriteLn('nilai :',Z[pos]);
      WriteLn('char :',Z1[pos]);
      WriteLn;
      Write('masukkan nilai baru = ');ReadLn(Z[pos]);
      Z1[pos]:=konversi(Z[pos]);
      WriteLn('nilai berhasil diedit');
    end
    else WriteLn('nim ',edit,' tidak ditemukan');
    ReadLn;
end;

procedure hapus_data_mhs(var X,Y:mystring;var Z:mynumber;var Z1:mychar);
var hapus,ya:string;ada:Boolean;i:Byte;pos:byte;
begin   
    ada:=false;
    cetak_data_mhs(X,Y,Z,Z1);
    Write('masukkan nim yang akan dihapus nilainya : ');ReadLn(hapus);
    for i:=1 to n do
      begin
        if hapus = X[i] then
        begin
          ada:=true;
          pos:=i;
        end;
      end;
    if ada then
    begin
      WriteLn('berikut data mhs yg akan hapus');
      WriteLn('nim :',X[pos]);
      WriteLn('nama :',Y[pos]);
      WriteLn('nilai :',Z[pos]);
      WriteLn('char :',Z1[pos]);
      WriteLn;
      Write('yakin ? y/t ');ReadLn(ya);
      if (ya='y') or (ya='Y') then
      begin
        for i:=pos to n-1 do
          begin
            X[i]:=X[i+1];
            Y[i]:=Y[i+1];
            Z[i]:=Z[i+1];
            Z1[i]:=Z1[i+1];
          end;
          dec(n);
          WriteLn('data berhasil dihapus');
      end
      else WriteLn('data batal dihapus ');
      readkey;
    end
    else WriteLn('nim ',hapus,' tidak ditemukan');
    ReadLn;
end;

procedure cari_data_mhs(var X,Y:mystring;var Z:mynumber;var Z1:mychar);
var cari:string;i:byte;
begin   
    Write('cari berdasarkan nim : ');ReadLn(cari);
    for i:=1 to n do
      begin
        if cari= X[i] then
        begin
          writeln('nim : ',X[i],' nama : ',Y[i],' nilai : ',Z[i]);
        end
        else
          begin
             WriteLn('data tidak ditemukan');
          end; 
     end;
     ReadLn;
end;

begin
  n:=0;
  repeat
  
  clrscr;
  WriteLn('menu mahasiswa :');
  WriteLn('1.tambah data');
  WriteLn('2.cetak data');
  WriteLn('3.edit data');
  WriteLn('4.hapus data');
  WriteLn('5.cari data');
  WriteLn('0.selesai');
  Write('pilih menu : ');Readln(pil);

  case pil of
  1:input_data_mhs(nim,nama,nilai,huruf);
  2:cetak_data_mhs(nim,nama,nilai,huruf);
  3:edit_data_mhs(nim,nama,nilai,huruf);
  4:hapus_data_mhs(nim,nama,nilai,huruf);
  5:cari_data_mhs(nim,nama,nilai,huruf);
  0:WriteLn('terimakasih');
  end;

  until pil = 0;
end.

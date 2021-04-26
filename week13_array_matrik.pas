program matrik;
uses crt;
// membuat transpose b.dan a-b
type
    matrix=array[1..10,1..10] of integer;
var 
    A,B,C:matrix;
    bar1,kol1,bar2,kol2,pil:integer;
    i,j:Integer;

procedure input_matrix(var X:matrix;var m,n:integer);
begin
    WriteLn('masukkan elemen matrix');
    for i:=1 to m do
      begin
        for j:=1 to n do
        begin
          Write('masukkan elemen matrix ke[',i,',',j,']=');
          readln(X[i,j]);
        end;
      end;
      WriteLn('matrix sudah diinputkan ');
end;

procedure cetak_matrix(X:matrix;m,n:integer);
begin
  for i:=1 to m do
  begin
    for j:=1 to n do write(X[i,j]:4);
    WriteLn;
  end;
end;

procedure tambah_matrix(var X,Y:matrix;var m,n:integer);
begin
    for i:=1 to m do
      begin
        for j:=1 to n do C[i,j]:=X[i,j]+Y[i,j];
      end;
end;

procedure transpose_matrix(var X:matrix;var m,n:Integer);
begin
     for i:=1 to m do
      begin
        for j:=1 to n do C[i,j]:=X[j,i];
      end;
end;


begin
  repeat
    clrscr;
    WriteLn('manipulasi matrix');
    WriteLn('1.input matrix a');
    WriteLn('2.input matrix b');
    WriteLn('3.cetak matrix a');
    WriteLn('4.cetak matrix b');
    WriteLn('5.A+B');
    WriteLn('6.transpose A');
    WriteLn('0.selesai');
    Write('pilih menu : ');ReadLn(pil);
    case pil of 
        1:begin
            Write('masukkan baris matrix a =');readln(bar1);
            Write('masukkan colom matrix a =');readln(kol1);
            input_matrix(A,bar1,kol1);
        end;
        2:begin
            Write('masukkan baris matrix b =');readln(bar2);
            Write('masukkan colom matrix b =');readln(kol2);
            input_matrix(B,bar2,kol2);
        end;
        3:if(bar1=0) or (kol1=0) then writeln('matrix belum terisi ') 
            else begin
                WriteLn('matrix a = ');
                cetak_matrix(A,bar1,kol1);
            end; 
        4:if(bar2=0) or (kol2=0) then writeln('matrix belum terisi ') 
            else begin
              WriteLn('matrix b = ');  
             cetak_matrix(B,bar2,kol2);
            end;
        5:if(bar1=bar2) and (kol1=kol2) then
          begin
            WriteLn('matrix a =');cetak_matrix(A,bar1,kol1);
            WriteLn('matrix B =');cetak_matrix(B,bar2,kol2);
            WriteLn('hasil a+b =');
            tambah_matrix(A,B,bar1,kol1);
            cetak_matrix(C,bar1,kol1);
          end
          else WriteLn('matrix harus sama ordenya u/k bisa ditambahkan');
        6:if (bar1=0)or(kol1=0) then WriteLn('mastrix blm ada') else
          begin
            WriteLn('matrix a = ');cetak_matrix(A,bar1,kol1);
            transpose_matrix(A,bar1,kol1);
            WriteLn('hasil transpose matrix a =');
            cetak_matrix(C,kol1,bar1);
          end;
        0:WriteLn('terimakasih');else WriteLn('anda salah pil menu');
    end;
    ReadLn;
  until pil=0;


end.
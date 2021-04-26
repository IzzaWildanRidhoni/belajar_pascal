program menginputmahasiswa;
uses 
    crt;
type 
    mhs=array[1..5] of string;
var 
    i:byte;
    data:mhs;
begin
    data[1]:='wildan';
    data[2]:='wildan';
    data[3]:='wildan';
    data[4]:='wildan';
    data[5]:='wildan';
  for i:=1 to 5 do
    begin
      Write('mhs ke ',i,' = ');WriteLn(data[i]);
    end;
end.
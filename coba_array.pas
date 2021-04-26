program menginputmahasiswa;
uses 
    crt;
const max=5;
type 
    mhs=array[1..max] of string;
var 
    i:byte;
    data:mhs;
begin
  for i:=1 to 5 do
    begin
      Write('mhs ke ',i,' = ');ReadLn(data[i]);
    end;

WriteLn('output');
  for i:=1 to 5 do
    begin
      Writeln('mhs ke ',i,' = ',data[i]);
    end;
end.
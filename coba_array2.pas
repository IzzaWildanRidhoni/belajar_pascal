program arraymulti;
uses crt;
const max=3;
var
    matrix:array[1..max,1..max] of integer;
    i,j:byte;
begin
  for i:=1 to max do
    begin
      for j:=1 to max do
       begin
         Write('matrik [',i,',',j,'] =');readln(matrix[i,j]);
       end;
    end;

    WriteLn('output');
    for i:=1 to max do
    begin
      for j:=1 to max do
       begin
         Write(matrix[i,j],' ');
       end;
       WriteLn;
    end;
end.
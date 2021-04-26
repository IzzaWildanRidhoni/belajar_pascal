program for_perulangan; //nama program
uses crt;

var i,max:integer;
	
begin
//never ending loop

	max:=0;
	repeat
		write('masukkan i =');readln(i);
		if(i>0) then
			begin
				if(i>max) then max:=i
			end
		else
			begin
				i:=0;
			end;
	until i=0;
	writeln(max);
end.


program loop;

var i,awal,akhir:integer;

begin
	write('masukkan batas awal : ');readln(awal);
	write('masukkan batas akhir : ');readln(akhir);
	
	for i:=awal to akhir do 
	begin
		if(i mod 2 = 0) then
		begin	
			writeln(i);
		end;
	end;
end.

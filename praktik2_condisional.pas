program kondisional;
uses crt;

var a:integer;

begin
	write('Masukkan Angka:');readln(a);
	//kondisional statement
	if(a>7) then
		begin
		writeln('wildan ganteng dan');
		writeln('dimas ganteng')
		end
		//bisa pakai titik koma asal ada begin dan end
	else if(a=10) then
		writeln('dimas ganteng')
	else
		writeln('dimas kurus');
		
	
	writeln('dimas jomblo');
	
end.

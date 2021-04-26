program week7_while;
uses crt;

var jarak,langkah,tempuh:real;
	jumlang:integer;

begin
	//insialisasi
	tempuh:=0;jumlang:=0;
	writeln('menghitung langkah si jokko');
	//inputan
	write('masukkan jarak yang harus ditempuh joko dalam meter : ');readln(jarak);
	jarak:=jarak*100;
	write('Panjang langkah joko dalam cm : ');readln(langkah);
	while(tempuh < jarak ) and (langkah > 1) do
	begin
		inc(jumlang);tempuh:=tempuh+langkah;
		writeln('Langkah ke ',jumlang,'jarak ditempuh = ',tempuh/100:6:2,' meter');
		if(jumlang mod 20 = 0 ) then langkah:= langkah * 0.9;
		
	end;
	
	if(tempuh >= jarak) then writeln('jok sampai di tujuan melangkah sebanyak ',jumlang,'langkah')
	else writeln('joko hanya berhasil menempuh jarak',tempuh/100:6:2,' masih  kurang ',(jarak-tempuh)/100:6:2);
end.

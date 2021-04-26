program tugas_pd_looping;
uses crt;

var pilih,pertama,kedua,i,p_awal,p_akhir:integer;
begin
	//awal repeat
	repeat
		writeln;
		writeln('Tugas 2');
		writeln('1. Membandingkan angka ');
		writeln('2. Mencari angka yang habis dibagi 7 ');
		writeln('0. keluar ');
		write('pilih program [1 - 2] : ');readln(pilih);
		writeln;
		
		if(pilih = 1) then
		begin
			write('masukkan angka pertama : ');readln(pertama);
			write('masukkan angka kedua  : ');readln(kedua);
			
			if( pertama > kedua ) then
			begin
				writeln(pertama,' lebih besar dari ',kedua);
			end
			else writeln(pertama,' lebih kecil dari ',kedua);
		end
		
		else if( pilih = 2) then
		begin
			write('masukkan pembatas awal : ');readln(p_awal);
			write('masukkan pematas akhir : ');readln(p_akhir);
			write('hasil = ');
			for i:= p_awal+1 to p_akhir-1 do 
			begin
				if(i mod 7 = 0) then
				begin
					write(i,' ');
				end;
			end;
		end;
		
	//akhir repeat
	until(pilih = 0);
	writeln('terimakasih');
	writeln('copyright wildan 2020');
	
end.

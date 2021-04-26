program mengecekStatusHakPiih; //nama program
uses crt;

var nama,hasil,confirm:string; //variabel 
	sk,sm,umur:integer;
	
label ulang,tanyalagi;

begin 
	ulang:
	writeln('Program mengecek status hak pilih  ');
	writeln;
	write('Masukkan nama anda : ');readln(nama);
	writeln('Pilih status kewarganegaraan (1. WNI atau 0. WNA)');
	write('pilih status 1 atau 0 :');readln(sk);

	
	//NB:jika hanya satu kondisi dikasih titik koma
	if(sk = 1) then
	begin
		writeln('Pilih status pernikahan (1. Menikah atau 0. belum menikah)');
		write('pilih status 1 atau 0 :');readln(sm);
			if( sm = 1) then  hasil:=' berhak ' 
			else if(sm = 0) then 
			begin
				write('masukkan umur anda = ');readln(umur);
				if(umur >= 17)then hasil:=' berhak '
				else hasil:=' tidak berhak ';
			end
	end
	
	else if(sk = 0) then
	begin
		write('masukkan umur anda = ');readln(umur);
		if(umur >= 17)then hasil:=' berhak '
		else hasil:=' tidak berhak ';
	end;
	writeln('Saudara / Saudari ',nama,' anda',hasil,'ikut pemilihan ketua PSSI');
	writeln;
	
	tanyaLagi:
	write(nama,' apakah program mau diulang ? y/t = ');readln(confirm);
	if(confirm = 'y') or (confirm ='Y') then goto ulang 
	else if(confirm = 't') or (confirm ='T') then
		begin
		writeln();
		writeln('terimakasih telah mengunakan aplikasi saya :)');	
		writeln('dibuat oleh izza wildan ridhoni')
		end
	else 
		begin
		writeln('anda salah memasukkan inputan ,ketik y/t '); goto tanyaLagi;
		end
end.

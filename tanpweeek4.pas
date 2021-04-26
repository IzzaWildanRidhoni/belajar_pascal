Program kondisional_week4;
uses crt;
var nilai:integer;
	nama,status:string;
label ulang;
begin
	write('masukkan nama anda : ');readln(nama);
	
	ulang:
		write('masukkan nilai anda : ');readln(nilai);
	if(nilai<0) or (nilai>100) then 
		begin 
			writeln('nilai tidak valid');
			goto ulang;
		end;
		
	//if nilai>=80 then writeln('selamat anda lulus');
	if (nilai>=80) then
		begin
			status:='lulus';
			writeln('selamat saudara ',nama,', nilai anda ',nilai,',anda dinyatakan',status);
		end
	else
		begin
			status:='tidak lulus';
			writeln('mohon maaf,saudara ',nama,',nilai anda,',nilai,',anda dinyatakan',status);
		end;
	writeln('terimakasih');
end.

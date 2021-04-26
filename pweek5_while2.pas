program perulangan_while;
uses crt;

const username='administrator';
	  password='123';
var user,pass:string;
	unmatch:boolean;

begin
	unmatch:=true;
	while(unmatch)do
	begin
		write('masukkan username :');readln(user);
		write('masukkan password :');readln(pass);
		
		if(user = username) and (pass = password) then
		begin
			writeln('anda berhasil login');
			unmatch:=false;
		end
		else writeln('akun tidak ditemukan');
		writeln;
		
	end;
	
end.


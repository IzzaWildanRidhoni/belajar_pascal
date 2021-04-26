program repeat_until;

uses crt;
var bil,n,jum:integer;
	rata:real;
	
begin
n:=0;jum:=0;
	repeat
		inc(n);
		write('masukkan biangan ke ',n,' jika akan berhenti  isi nol : ');readln(bil);
		jum:=jum+bil;
	until(bil=0);
	dec(n);
	writeln('anda telah memasukkan ',n,'buah bilangan ');
	writeln('jumlahnya =',jum);
	if( n > 0) then begin rata:=jum/n; writeln('rata rata  ',n,' buah bilangan =',rata:6:3);end;
end.

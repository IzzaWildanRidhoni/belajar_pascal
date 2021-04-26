program contoh_aray_week11;
uses crt;

type my_number=array[1..10] of integer;
var data:my_number;
	n,i:byte;ya:char;

procedure isi_data(var X:my_number);
begin
	writeln('input data maksimal  10 data atau input data 0');
	repeat
		inc(n);
		write('masukkan data ke ',n,' : ');readln(X[n]);
	until(n>10) or (X[n]=0);
	dec(n);
end;

procedure cetak_data(X:my_number);
begin
	writeln('data yang sudah anda inputkan ');
	writeln('------------------------------');
	writeln('data ke      Data');
	writeln('------------------------------');
	for i:=1 to n do writeln(i:4,'     ',X[i]:4);
	writeln('------------------------------');
end;

function rata_rata(X:my_number):real;
var jum:longint;
begin
	jum:=0;
	for i:=1 to n do jum:=jum+X[i];
	rata_rata:=jum/n;
end;

function max(X:my_number):integer;
begin
	max:=X[1];
	for i:=2 to n do if X[i] > max then max:=X[i];
end;

function min(X:my_number):integer;
begin
	min:=X[1];
	for i:=2 to n do if X[i] < min then min:=X[i];
end;

	
begin
repeat
	clrscr;
	n:=0;
	isi_data(data);
	cetak_data(data);
	writeln(' rata rata data diatas adalah ',rata_rata(data):6:2);
	writeln('data terbesar dari data diatas adalah ',max(data));
	writeln('data terkecil dari data diatas adalah ',min(data));
	writeln;
	write('apakah akan mencoba lagi ? ');readln(ya);
until(ya<>'y') and (ya<>'Y');
	
end.

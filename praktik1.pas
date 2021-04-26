program week1;
uses crt;

var harga,harga_selusin,bayar,bnyk_pensil:longint;
	 

begin
	writeln('====================================');
	writeln('   Porgram pembayaran Pensil By wildan');
	writeln('====================================');
	writeln;
	
	harga:=1000;
	harga_selusin:=9000;
	writeln(' harga 1 buah pensil = ',harga);
	writeln( 'harga 1 lusin pensil = ',harga_selusin);
	write('banyak pensil yang kamu beli :');readln(bnyk_pensil);
	bayar:=((bnyk_pensil div 12) * 9000 ) + ((bnyk_pensil mod 12) * 1000);
	writeln('bayar = ',bayar);
	
end.

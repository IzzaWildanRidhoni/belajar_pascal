program convertSuhu;
uses crt;

var C,F,K:real;

begin
	writeln('====================================');
	writeln('   PROGRAM CONVERSI SUHU By wildan');
	writeln('====================================');
	writeln;
	
	//celcius ke fahrenheit
	write(' masukkan Celsius = ');readln(C);
	F:=((9/5)* C)+32;
	writeln(' celcius ke fahrenheit = ',F:0:2,' F');
	writeln;
	
	//fahrenheit ke celcius
	write(' masukkan Farenheit  = ');readln(F);
	C:=(5/9)*(F-32);
	writeln('fahrenheit ke celcius = ',C:0:2,' C');
	writeln;
	
	//celcius ke kelfin
	write(' masukkan Celcius  = ');readln(C);
	K:=C+273;
	writeln('celcius ke kelfin = ',K:0:2,' K');
	writeln;
	
	//kelfin ke celcius
	write(' masukkan kelfin  = ');readln(K);
	C:=K-273;
	writeln(' kelfin ke celcius = ',C:0:2,' C');
	writeln;
	
end.


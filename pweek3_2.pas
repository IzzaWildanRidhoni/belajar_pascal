Program mengelola_angka;
uses crt;
var a,b,c:integer;
	d:real;

begin
	writeln('mengelola angka-angka');
	write('masukkan bilangan bulat:');readln(a);
	write('masukkan bilangan bulat:');readln(b);
	c:=a+b;writeln('a+b=',c);
	c:=a-b;writeln('a-b=',c);
	c:=a div b;writeln('a div b=',c);
	c:=a mod b;writeln('a mod b=',c);
	c:=sqr(a);writeln('sqr a = ',c);
	c:=sqr(b);writeln('sqr b = ',c);
	d:=sqrt(b);writeln('sqrt(b)=',d);
	d:=sqrt(a);writeln('sqrt(a)=',d:6:2);//mepersingkat format angka
	c:=a*b;writeln('a*b =',c);
	d:=a*b;writeln('a*b =',d);
end.

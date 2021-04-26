program for_perulangan; //nama program
uses crt;

var i,a,b:integer;//counter harus bilangan bulat
	ada:boolean;
	ya:longinteger;
	
begin

repeat

	//cetaklah bilangan genap
	ada:=false;
	write('masukkan bilangan bulat a = ');readln(a);
	write('masukkan bilangan bulat b = ');readln(b);
	if(a=b) then writeln('tidak ada bilangan di antara ',a,'dan',b)
	else if(a<b) then //loop naik
	begin
		for i:=a+1 to b-1 do if(i mod 2 = 0) then begin ada:=true;write(i,' ');end;//minimal ada 1 yg memenuhi maka ada ->true
		writeln;
	end
	else
	begin //loop turun
		for i:=a-1 downto b+1 do if (i mod 2 = 0 ) then begin ada:=true;write(i,' ');end;//minimal ada 1 sama seperti diatas
		writeln;
	end;
	if not ada then writeln('tidak ada hasil yang memenuhi');
	//kita tanyakan diulang
	writeln;
	write('apakah akan mencoba lagi <y/t>?');readln(ya);
until((ya<>'y') and(ya<>'Y'));
writeln('terimakasih sudah mencoba program ini');
	
end.

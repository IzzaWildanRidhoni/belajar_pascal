program perulangan_while;
uses crt;
var jml_jrk_lompatan,i,pjng_lintasan,jrk_lompat:integer;

begin
	write('Masukkan batas panjang lintasan (cm)= ');readln(pjng_lintasan);
	i:=1;
	jml_jrk_lompatan:=0;
	jrk_lompat:=15;
	while(jml_jrk_lompatan < pjng_lintasan)do
	begin
		
		writeln('loncatan ke-',i,'katak melompat sejauh ',jrk_lompat,' cm');
		inc(i);
		jml_jrk_lompatan:=jml_jrk_lompatan+jrk_lompat;
		jrk_lompat:=jrk_lompat-2;
		
		
		if(jrk_lompat < 2) then
		begin
			writeln('katak sedang istirahat');
			writeln;
			jrk_lompat:=15;
		end;
	end;
	writeln;
	writeln('jarak yang ditempuh katak = ',jml_jrk_lompatan,' cm');
end.


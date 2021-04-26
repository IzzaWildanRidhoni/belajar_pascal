program hitungPantulan;
uses crt;

var tinggi,i,jml_pantulan,jml_lintasan:integer;
	melambung:boolean;

begin
	writeln('PANTULAN DAN PANJANG LINTASAN BOLA ');
	writeln;
	write('berapa meter tinggi lemparan bola : ');read(tinggi);
	melambung:=true;
	i:=1;
	jml_lintasan:=0;
	jml_pantulan:=0;
	
	if(tinggi < 3) then writeln('lemparan bola kurang tinggi')
	else 
		begin
			
			while(melambung) do
			begin
				jml_lintasan:=jml_lintasan+(tinggi*2);
			
				
				if(tinggi < 3) then
				begin
					melambung:=false;
				end
				else
				begin
					tinggi:=tinggi-3;
					writeln('pantulan ke-',i,' tingginya = ',tinggi,' m');
					inc(jml_pantulan);
				end;
				i:=i+1;
			end;
			writeln;
			writeln('panjang lintasannya = ',jml_lintasan);
			writeln('jumlah pantulannya = ',jml_pantulan,' kali ');
		end;
end.

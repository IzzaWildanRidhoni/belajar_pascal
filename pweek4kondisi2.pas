program cek_kesehatan_anda;
uses crt;
var nama,status1,status2,status3:string;
	tekdar,guldar:integer;
begin
	write('masukkan nama anda : ');readln(nama);
	write('berapa tekanan darah anda : ');readln('tekdar');
	write('berapa kadar gula darah anda : ');readln('guldar');
	
	//cek tensi
	if(tekdar > 300) then status1:='hipertensi akut'
	else if(tekdar<=300)and(tekdar>150) then status1:='hipertensi ringan'
	else if(tekdar<=1500)and(tekdar>=1000then status1:='normal'
	else status1:='hipotensi';
	writeln('nama',nama,'status tekanan darah',status1);
	//cek gula darah
	if(guldar>300)then status2:='diabet';
	else if(guldar<=300)and(guldar>120)then status2:='Waspada dibet' else status2:='normal';
	writeln('nama',nama,'status gula darah',status2);
	//menentukan apakah orang tab sehat atau kurang sehat
	if(status1='normal')and(status2='normal')then status3:='kurang sehat';
	writeln('saudara',nama,'dinyatakan',status3);
	writeln('terimakasih'

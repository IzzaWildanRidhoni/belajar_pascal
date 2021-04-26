program sales;
uses crt;

var nm_sales,kategori:string;
	poin,omset:longint;

begin
	writeln('======================================');
	writeln(' MENENTUKAN POIN DAN KATEGORI SALES');
	writeln('  create by izza wildan ridhoni');	writeln('  create by izza wildan ridhoni');
	writeln('======================================');
	write('masukkan nama sales : ');readln(nm_sales);
	write('masukkan omset penjualan : Rp.');readln(omset);
	poin:=omset div 5000;
	writeln(nm_sales,' poin  anda  sebanyak ',poin,' maka termasuk kategori : ');
	if(poin >= 1000)then
		begin
			writeln('outstanding');
		end
	else if(poin>=500)then
		begin
			writeln('very good');
		end
	else
		begin
			writeln('not good');
		end;
end.

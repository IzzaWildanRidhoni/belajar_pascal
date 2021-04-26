program uangkembalianbelanja;
uses crt;

var harga_barang,bayar,kupon,kembalian:longint;
label ulang;

begin
	writeln('======================================');
	writeln('SELAMAT DATANG DI KASIR SUPERMAARKET');
	writeln('    create by izza wildan ridhoni');
	writeln('======================================');
	write('masukkan harga semua barang yang dibeli : Rp.');readln(harga_barang);
	ulang:
	write('dibayar : Rp.');readln(bayar);
	
	if(bayar<harga_barang) then
		begin
			writeln('maaf uang anda tidak cukup untuk membayar barang :) ');
			writeln('--------------------------------------------------');
			goto ulang;
		end;
	if(harga_barang >=7500) then
		begin
			kupon:=harga_barang div 7500;
			writeln('mendapatkan : ',kupon,' kupon');
		end;
	kembalian:=bayar-harga_barang;
	writeln('uang kembalian : Rp.',kembalian);
end.

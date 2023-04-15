-- membuat table produk
CREATE TABLE produk(
    -> id int NOT NULL auto_increment primary key,
    -> kode varchar(10) unique,
    -> nama varchar(45) NOT NULL,
    -> harga_beli double default 0,
    -> harga_jual double default 0,
    -> stok int(11),
    -> min_stok int(11),
    -> jenis_produk_id int NOT NULL REFERENCES jenis_produk(id));
	
-- membuat table pesanan_item
CREATE TABLE pesanan_item(
    -> id int NOT NULL auto_increment primary key,
    -> produk_id int NOT NULL REFERENCES produk(id),
    -> pesanan_id int NOT NULL REFERENCES pesanan(id),
    -> qty int(11),
    -> harga double default 0);

-- membuat tabel vendor
CREATE TABLE vendor(
    -> id int NOT NULL auto_increment primary key,
    -> nomor varchar(4) unique,
    -> nama varchar(40) NOT NULL,
    -> kota varchar(30),
    -> kontak varchar(30));
	
-- membuat tabel pembelian
CREATE TABLE pembelian(
    -> id int NOT NULL auto_increment primary key,
    -> tanggal date,
    -> nomor varchar(10) unique,
    -> produk_id int REFERENCES produk(id),
    -> jumlah int(11),
    -> harga double default 0,
    -> vendor_id int REFERENCES vendor(id));
	
-- menambah kolom alamat pada pelanggan
ALTER TABLE pelanggan
    -> ADD COLUMN alamat varchar(10);

-- mengubah kolom nama menjadi nama_pelanggan
ALTER TABLE pelanggan
    -> CHANGE nama nama_pelanggan varchar(45);
	
-- mengubah tipe data nama_pelanggan
ALTER TABLE pelanggan
    -> MODIFY nama_pelanggan varchar(50);
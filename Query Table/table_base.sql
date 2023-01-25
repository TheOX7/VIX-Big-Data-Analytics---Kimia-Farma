USE rakamin_db;

CREATE TABLE distributor_dim (
	id_distributor VARCHAR(3) PRIMARY KEY,
    nama_distributor VARCHAR(30)
);
CREATE TABLE group_dim (
	id_group CHAR(3) PRIMARY KEY,
    nama_group VARCHAR(10)
);
CREATE TABLE cabang_sales_dim (
	id_cabang_sales CHAR(5) PRIMARY KEY,
    cabang_sales VARCHAR(30)
);
CREATE TABLE unit_dim (
	id_unit CHAR(3) PRIMARY KEY,
    deskripsi_unit VARCHAR(20)
);
CREATE TABLE brand_dim (
	id_brand CHAR(7) PRIMARY KEY,
    nama_brand VARCHAR(30)
);
CREATE TABLE tipe_dim (
	tipe CHAR(4) PRIMARY KEY,
    nama_tipe VARCHAR(20)
);
CREATE TABLE lini_dim (
	kode_lini CHAR(3) PRIMARY KEY,
    lini VARCHAR(10)
);
CREATE TABLE customer_dim(
	id_customer CHAR(9) PRIMARY KEY,
    level VARCHAR(20),
	nama VARCHAR(30),
    id_cabang_sales CHAR(5),
    id_group CHAR(3),
    FOREIGN KEY(id_cabang_sales) REFERENCES cabang_sales_dim(id_cabang_sales),
    FOREIGN KEY(id_group) REFERENCES group_dim(id_group)
);

CREATE TABLE barang_dim(
	kode_barang CHAR(7) PRIMARY KEY,
    sektor CHAR(1),
    nama_barang VARCHAR(30),
    tipe CHAR(4),
    kode_lini INT,
    kemasan VARCHAR(10),
    FOREIGN KEY(tipe) REFERENCES tipe_dim(tipe),
    FOREIGN KEY(kode_lini) REFERENCES lini_dm(kode_lini)
);

CREATE TABLE fact_penjualan(
	id_distributor VARCHAR(3),
    id_customer CHAR(9),
    id_barang CHAR(7),
    id_unit CHAR(3),
    id_brand CHAR(7),
    jumlah_barang INT,
    harga INT,
    FOREIGN KEY(id_distributor) REFERENCES distributor_dim(id_distributor),
    FOREIGN KEY(id_customer) REFERENCES customer_dim(id_customer),
    FOREIGN KEY(id_barang) REFERENCES barang_dim(kode_barang),
    FOREIGN KEY(id_unit) REFERENCES unit_dim(id_unit),
    FOREIGN KEY(id_brand) REFERENCES brand_dim(id_brand)
)

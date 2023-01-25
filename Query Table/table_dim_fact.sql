USE rakamin_db;

INSERT INTO distributor_dim(id_distributor)
	SELECT DISTINCT id_distributor
    FROM tb_penjualan;
    
INSERT INTO group_dim
	SELECT DISTINCT pl.id_group, pl.group
    FROM tb_pelanggan pl;
    
INSERT INTO cabang_sales_dim
	SELECT DISTINCT pl.id_cabang_sales, pl.cabang_sales
    FROM tb_pelanggan pl;

INSERT INTO customer_dim
	SELECT DISTINCT pl.id_customer, pl.level, pl.nama, cb.id_cabang_sales, g.id_group
    FROM tb_pelanggan pl
    JOIN cabang_sales_dim cb ON (pl.id_cabang_sales = cb.id_cabang_sales)
    JOIN group_dim g ON (pl.id_group = g.id_group);
    
INSERT INTO unit_dim(id_unit)
	SELECT DISTINCT unit 
    FROM tb_penjualan; 
    
INSERT INTO brand_dim(id_brand)
	SELECT DISTINCT brand_id 
    FROM tb_penjualan;   

INSERT INTO tipe_dim
	SELECT DISTINCT tipe, nama_tipe
    FROM tb_barang;
    
INSERT INTO lini_dim
	SELECT DISTINCT kode_lini, lini
    FROM tb_barang;

INSERT INTO barang_dim
	SELECT DISTINCT br.kode_barang, br.sektor, br.nama_barang, t.tipe, l.kode_lini, br.kemasan
    FROM tb_barang br
    JOIN tipe_dim t ON (br.tipe = t.tipe)
    JOIN lini_dim l ON (br.kode_lini = l.kode_lini);

INSERT INTO fact_penjualan
	SELECT d.id_distributor, c.id_customer, br.kode_barang, u.id_unit, b.id_brand, pj.jumlah_barang, pj.harga
    FROM tb_penjualan pj
    JOIN distributor_dim d ON (pj.id_distributor = d.id_distributor)
    JOIN customer_dim c ON (pj.id_customer = c.id_customer) 
    JOIN barang_dim br ON (pj.id_barang = br.kode_barang)
    JOIN unit_dim u ON (pj.unit = u.id_unit)
    JOIN brand_dim b ON (pj.brand_id = b.id_brand);
    
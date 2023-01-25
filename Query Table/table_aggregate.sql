CREATE TABLE penjualan_agg (
    id_invoice CHAR(6),
    id_distributor VARCHAR(3),
    id_customer CHAR(9),
    id_barang CHAR(7),
    id_unit CHAR(3),
    id_brand CHAR(7),
    tanggal DATE,
    total_harga INT
);

INSERT INTO penjualan_agg
	SELECT fp.id_invoice, fp.id_distributor, fp.id_customer, fp.id_barang, fp.id_unit, fp.id_brand, tp.tanggal, SUM(fp.jumlah_barang * fp.harga)
    FROM fact_penjualan fp, tb_penjualan tp
    GROUP BY 1, 2, 3, 4, 5, 6, 7;

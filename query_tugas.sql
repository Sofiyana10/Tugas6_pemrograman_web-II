-- ===== STATISTIK BUKU =====

-- Total buku
SELECT COUNT(*) AS total_buku FROM buku;

-- Total nilai inventaris
SELECT SUM(harga * stok) AS total_inventaris FROM buku;

-- Rata-rata harga
SELECT AVG(harga) AS rata_rata_harga FROM buku;

-- Buku termahal
SELECT judul, harga FROM buku ORDER BY harga DESC LIMIT 1;

-- Stok terbanyak
SELECT judul, stok FROM buku ORDER BY stok DESC LIMIT 1;

-- ===== FILTER & PENCARIAN =====

SELECT * FROM buku
WHERE kategori = 'Programming' AND harga < 100000;

SELECT * FROM buku
WHERE judul LIKE '%PHP%' OR judul LIKE '%MySQL%';

SELECT * FROM buku
WHERE tahun_terbit = 2024;

SELECT * FROM buku
WHERE stok BETWEEN 5 AND 10;

SELECT * FROM buku
WHERE pengarang = 'Budi Raharjo';

-- ===== GROUPING =====

SELECT kategori, COUNT(*) AS jumlah_buku, SUM(stok) AS total_stok
FROM buku
GROUP BY kategori;

SELECT kategori, AVG(harga) AS rata_harga
FROM buku
GROUP BY kategori;

SELECT kategori, SUM(harga * stok) AS total_inventaris
FROM buku
GROUP BY kategori
ORDER BY total_inventaris DESC
LIMIT 1;

-- ===== LAPORAN =====

SELECT * FROM buku WHERE stok < 5;

SELECT judul, harga
FROM buku
ORDER BY harga DESC
LIMIT 5;

-- ===== UPDATE =====

UPDATE buku
SET harga = harga * 1.05
WHERE kategori = 'Programming';

UPDATE buku
SET stok = stok + 10
WHERE stok < 5;
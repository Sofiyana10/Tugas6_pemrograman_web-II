-- ===== CREATE DATABASE =====
CREATE DATABASE perpustakaan_lengkap;
USE perpustakaan_lengkap;

-- ===== TABEL KATEGORI =====
CREATE TABLE kategori_buku (
    id_kategori INT AUTO_INCREMENT PRIMARY KEY,
    nama_kategori VARCHAR(50) NOT NULL UNIQUE,
    deskripsi TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ===== TABEL PENERBIT =====
CREATE TABLE penerbit (
    id_penerbit INT AUTO_INCREMENT PRIMARY KEY,
    nama_penerbit VARCHAR(100) NOT NULL,
    alamat TEXT,
    telepon VARCHAR(15),
    email VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ===== TABEL BUKU =====
CREATE TABLE buku (
    id_buku INT AUTO_INCREMENT PRIMARY KEY,
    judul VARCHAR(100),
    pengarang VARCHAR(100),
    harga INT,
    stok INT,
    tahun_terbit YEAR,
    id_kategori INT,
    id_penerbit INT,

    FOREIGN KEY (id_kategori) REFERENCES kategori_buku(id_kategori),
    FOREIGN KEY (id_penerbit) REFERENCES penerbit(id_penerbit)
);

-- ===== kategori (minimal 5) =====
INSERT INTO kategori_buku (nama_kategori, deskripsi) VALUES
('Programming', 'Buku coding'),
('Database', 'Basis data'),
('Jaringan', 'Networking'),
('AI', 'Artificial Intelligence'),
('Web', 'Web development');

-- ===== penerbit (minimal 5) =====
INSERT INTO penerbit (nama_penerbit, alamat, telepon, email) VALUES
('Informatika', 'Bandung', '0811', 'info@informatika.com'),
('Erlangga', 'Jakarta', '0822', 'info@erlangga.com'),
('Gramedia', 'Jakarta', '0833', 'info@gramedia.com'),
('Andi Offset', 'Jogja', '0844', 'info@andi.com'),
('Deepublish', 'Jogja', '0855', 'info@deepublish.com');

-- ===== DATA BUKU (15 DATA) =====
INSERT INTO buku (judul, pengarang, harga, stok, tahun_terbit, id_kategori, id_penerbit) VALUES
('Belajar PHP', 'Budi Raharjo', 90000, 10, 2023, 1, 1),
('PHP Lanjutan', 'Budi Raharjo', 110000, 5, 2024, 1, 2),
('MySQL Dasar', 'Andi', 85000, 8, 2024, 2, 2),
('Mastering MySQL', 'Rudi', 120000, 3, 2023, 2, 3),
('Jaringan Komputer', 'Ahmad', 80000, 6, 2022, 3, 3),
('Cisco Networking', 'Deni', 130000, 4, 2024, 3, 4),
('AI Dasar', 'Siti', 150000, 7, 2024, 4, 4),
('Machine Learning', 'Rina', 170000, 2, 2023, 4, 5),
('Deep Learning', 'Fajar', 180000, 5, 2024, 4, 1),
('Web Development', 'Agus', 95000, 9, 2023, 5, 5),
('HTML & CSS', 'Lina', 70000, 12, 2022, 5, 2),
('JavaScript Dasar', 'Budi', 85000, 11, 2023, 5, 3),
('Python Programming', 'Rudi', 100000, 6, 2024, 1, 4),
('Database Design', 'Sari', 140000, 4, 2023, 2, 5),
('Cyber Security', 'Andi', 160000, 3, 2024, 3, 1);

-- ===== Query JOIN =====

-- Buku + kategori + penerbit
SELECT b.judul, k.nama_kategori, p.nama_penerbit
FROM buku b
JOIN kategori_buku k ON b.id_kategori = k.id_kategori
JOIN penerbit p ON b.id_penerbit = p.id_penerbit;

-- Jumlah buku per kategori
SELECT k.nama_kategori, COUNT(*) AS jumlah
FROM buku b
JOIN kategori_buku k ON b.id_kategori = k.id_kategori
GROUP BY k.nama_kategori;

-- Jumlah buku per penerbit
SELECT p.nama_penerbit, COUNT(*) AS jumlah
FROM buku b
JOIN penerbit p ON b.id_penerbit = p.id_penerbit
GROUP BY p.nama_penerbit;

-- Detail lengkap
SELECT b.*, k.nama_kategori, p.nama_penerbit
FROM buku b
JOIN kategori_buku k ON b.id_kategori = k.id_kategori
JOIN penerbit p ON b.id_penerbit = p.id_penerbit;
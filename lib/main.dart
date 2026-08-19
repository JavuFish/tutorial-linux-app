import 'package:flutter/material.dart';

void main() {
  runApp(const TutorialLinuxLengkapApp());
}

class TutorialLinuxLengkapApp extends StatelessWidget {
  const TutorialLinuxLengkapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tutorial Linux Lengkap',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.greenAccent[400],
        scaffoldBackgroundColor: const Color(0xFF0F0F0F),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontFamily: 'monospace', fontSize: 15, height: 1.7),
          bodyMedium: TextStyle(fontFamily: 'monospace', fontSize: 14, height: 1.7),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HalamanDaftarMateri(),
    );
  }
}

class HalamanDaftarMateri extends StatelessWidget {
  const HalamanDaftarMateri({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🐧 Tutorial Linux LENGKAP', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF1A1A1A),
        elevation: 6,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          // ==============================================
          // 📘 BAGIAN 1: FILOSOFI & DASAR SISTEM
          // ==============================================
          BagianJudul('📘 BAGIAN 1 — FILOSOFI & DASAR SISTEM'),
          KartuMateri(
            judul: '4 Filosofi Inti Linux',
            isi: '''
🔹 1. SEMUA ADALAH BERKAS
Segala sesuatu di Linux — perangkat keras, proses, jaringan, printer — semuanya diperlakukan sebagai berkas teks/biner. Inilah kekuatan utama Linux.

🔹 2. ALAT KECIL, SATU TUGAS
Setiap program dirancang untuk melakukan SATU hal dengan sempurna. Gabungkan alat sederhana dengan simbol pipa (|) untuk menyelesaikan tugas kompleks.

🔹 3. KONFIGURASI BERBASIS TEKS
Tidak ada database tersembunyi. Semua pengaturan ada di berkas teks biasa di folder /etc. Mudah dibaca, diedit, dicadangkan, dan dibagikan.

🔹 4. IZIN & PENGGUNA SEJAK AWAL
Keamanan bukan tambahan — sudah tertanam. Setiap berkas punya pemilik, grup, dan izin (baca/tulis/jalankan). Tidak ada yang bisa mengubah sistem tanpa izin.
''',
            icon: Icons.lightbulb,
          ),
          KartuMateri(
            judul: 'Struktur Sistem Berkas — Penjelasan Lengkap',
            isi: '''
/           → Akar sistem, induk dari semua folder
├── /home   → Folder pribadi tiap pengguna (/home/andi, /home/budi)
├── /etc    → Konfigurasi sistem: passwd, hosts, nginx, ssh...
├── /bin    → Perintah dasar: ls, cat, cd, cp, mv, rm...
├── /sbin   → Perintah admin: ifconfig, iptables, reboot...
├── /usr    → Program, dokumen, pustaka tambahan
│   ├── /usr/bin → aplikasi yang dipakai pengguna
│   ├── /usr/lib → pustaka program
│   └── /usr/share → data bersama: manual, ikon, dokumen
├── /var    → Data berubah: log, database, email, cache
├── /root   → Folder pribadi administrator (bukan /home/root!)
├── /tmp    → Berkas sementara — dihapus saat restart
├── /dev    → Berkas perangkat: /dev/sda (disk), /dev/null (lubang hitam)
├── /proc   → Informasi proses & sistem — berkas virtual, dibuat otomatis
└── /mnt & /media → Tempat me-mount penyimpanan eksternal
''',
            icon: Icons.folder_open,
          ),
          KartuMateri(
            judul: 'Pengguna, Grup & Izin — Pahami Sekali Selamanya',
            isi: '''
👤 PENGGUNA: Setiap orang punya nama pengguna & ID unik (UID)
👥 GRUP: Pengguna bisa masuk grup untuk berbagi izin (GID)
🔐 IZIN: Tiap berkas punya 3 level — Pemilik | Grup | Lainnya

Format:  rwx  r-x  r-x
         ↓↓↓  ↓↓↓  ↓↓↓
         Pemilik Grup Semua

r = baca (4) | w = tulis (2) | x = jalankan (1)
Contoh angka:
  755 → rwx r-x r-x = standar folder/program
  644 → rw- r-- r-- = berkas teks biasa
  600 → rw- --- --- → hanya pemilik yang bisa baca/tulis (sangat aman!)
''',
            icon: Icons.security,
          ),

          // ==============================================
          // ⌨️ BAGIAN 2: PERINTAH DASAR — PAKAI PALING SERING
          // ==============================================
          BagianJudul('⌨️ BAGIAN 2 — PERINTAH DASAR (Hafal Ini Dulu!)'),
          KartuPerintah(
            perintah: 'pwd',
            fungsi: 'Tampilkan jalur direktori saat ini',
            contoh: r'$ pwd
/home/andi/proyek/latihan',
          ),
          KartuPerintah(
            perintah: 'ls',
            fungsi: 'Lihat isi folder',
            contoh: r'$ ls              → tampil nama saja
$ ls -l            → tampil detail: izin, pemilik, ukuran, tanggal
$ ls -la           → + tampil berkas tersembunyi (nama diawali .)
$ ls -lh           → ukuran dalam format mudah dibaca (KB/MB)
$ ls -lt           → urutkan berdasarkan waktu diubah',
          ),
          KartuPerintah(
            perintah: 'cd',
            fungsi: 'Pindah ke direktori lain',
            contoh: r'$ cd Dokumen          → masuk folder Dokumen
$ cd ..                → naik satu tingkat ke atas
$ cd ../..             → naik dua tingkat
$ cd /etc              → pindah langsung ke folder /etc
$ cd ~                 → kembali ke folder rumah (/home/andi)
$ cd -                 → kembali ke folder sebelumnya',
          ),
          KartuPerintah(
            perintah: 'mkdir',
            fungsi: 'Buat folder baru',
            contoh: r'$ mkdir proyek_baru
$ mkdir -p a/b/c/d    → buat sekaligus bertingkat otomatis
$ mkdir dok{1,2,3}    → buat dok1, dok2, dok3 sekaligus',
          ),
          KartuPerintah(
            perintah: 'cp',
            fungsi: 'Salin berkas/folder',
            contoh: r'$ cat file.txt salinan.txt
$ cp -r folder1 folder2     → salin folder + semua isinya
$ cp *.txt ~/Dokumen/       → salin semua .txt ke folder Dokumen
$ cp file{1,2}.txt          → salin file1.txt jadi file2.txt',
          ),
          KartuPerintah(
            perintah: 'mv',
            fungsi: 'Pindah berkas ATAU ganti nama',
            contoh: r'$ mv lama.txt baru.txt    → ganti nama
$ mv file.txt ~/Unduhan/    → pindah ke folder lain
$ mv *.pdf ~/Dokumen/Buku/  → pindah semua PDF',
          ),
          KartuPerintah(
            perintah: 'rm',
            fungsi: 'Hapus berkas/folder — ⚠️ TIDAK BISA DIKEMBALIKAN!',
            contoh: r'$ rm sampah.txt
$ rm -rf folder_saya        → hapus folder + SEMUA isinya (HATI-HATI!)
$ rm *.tmp                  → hapus semua berkas .tmp',
          ),
          KartuPerintah(
            perintah: 'cat / less / head / tail',
            fungsi: 'Lihat isi berkas teks',
            contoh: r'$ cat catatan.txt        → tampil seluruh isi
$ less buku.txt          → tampil halaman demi halaman (q=keluar)
$ head -20 log.txt       → tampil 20 baris pertama
$ tail -f /var/log/nginx/access.log  → pantau log secara REAL-TIME!',
          ),

          // ==============================================
          // 🔐 BAGIAN 3: IZIN, PENGGUNA & MANAJEMEN SISTEM
          // ==============================================
          BagianJudul('🔐 BAGIAN 3 — Izin, Pengguna & Manajemen Sistem'),
          KartuPerintah(
            perintah: 'chmod',
            fungsi: 'Ubah izin akses berkas',
            contoh: r'$ chmod 755 skrip.sh    → rwx r-x r-x
$ chmod 644 berkas.txt   → rw- r-- r--
$ chmod +x program.sh    → tambah izin jalankan untuk semua
$ chmod -w rahasia.txt   → hapus izin tulis untuk semua',
          ),
          KartuPerintah(
            perintah: 'chown',
            fungsi: 'Ubah pemilik dan/atau grup berkas',
            contoh: r'$ sudo chown andi:andi file.txt
$ sudo chown -R andi:andi folder/  → ubah SEMUA isi folder sekaligus',
          ),
          KartuPerintah(
            perintah: 'useradd / usermod / userdel',
            fungsi: 'Buat, ubah, hapus pengguna',
            contoh: r'$ sudo useradd -m budi     → buat pengguna + folder rumah
$ sudo passwd budi          → atur kata sandi
$ sudo userdel -r budi      → hapus pengguna + folder rumah',
          ),
          KartuPerintah(
            perintah: 'df -h / du -sh',
            fungsi: 'Cek ruang disk & ukuran berkas/folder',
            contoh: r'$ df -h          → sisa ruang tiap partisi
Filesystem  Size  Used Avail Use%
/dev/sda1    58G   12G   43G  22%

$ du -sh Dokumen/   → ukuran folder
145M    Dokumen/',
          ),
          KartuPerintah(
            perintah: 'free -h',
            fungsi: 'Cek penggunaan memori RAM',
            contoh: r'$ free -h
              total        used        free
Mem:          8.0Gi       2.3Gi       5.7Gi',
          ),

          // ==============================================
          // 🔍 BAGIAN 4: PIPA, FILTER & PENCARIAN
          // ==============================================
          BagianJudul('🔍 BAGIAN 4 — Pipa, Filter & Pencarian'),
          KartuPerintah(
            perintah: 'grep',
            fungsi: 'Cari teks di dalam berkas atau output',
            contoh: r'$ grep "error" log.txt        → cari baris berisi kata error
$ grep -r "fungsi" .           → cari di SEMUA berkas mulai folder ini
$ grep -i "kata" berkas.txt    → cari TANPA membedakan huruf besar/kecil
$ ls -la | grep ".txt"         → gabung dengan pipa — filter hasil ls',
          ),
          KartuPerintah(
            perintah: 'find',
            fungsi: 'Cari berkas berdasarkan nama, ukuran, waktu...',
            contoh: r'$ find . -name "*.pdf"        → cari semua berkas PDF
$ find /home -type d -name proyek  → cari FOLDER bernama proyek
$ find . -size +100M            → cari berkas lebih besar dari 100 MB
$ find . -mtime -2              → diubah dalam 2 hari terakhir',
          ),
          KartuPerintah(
            perintah: 'sort / uniq / wc',
            fungsi: 'Urutkan, hapus duplikat, hitung baris/kata',
            contoh: r'$ daftar.txt | sort              → urutkan A-Z
$ daftar.txt | sort | uniq       → urutkan + hapus baris ganda
$ wc -l buku.txt                 → hitung jumlah baris
1240 buku.txt',
          ),
          KartuPerintah(
            perintah: 'cut / paste',
            fungsi: 'Pilih kolom tertentu dari teks',
            contoh: r'$ cat daftar.txt
Andi 25 Jakarta
Budi 30 Bandung

$ cut -d" " -f1 daftar.txt      → ambil kolom pertama
Andi
Budi',
          ),

          // ==============================================
          // 🌐 BAGIAN 5: PROSES & JARINGAN
          // ==============================================
          BagianJudul('🌐 BAGIAN 5 — Proses & Jaringan'),
          KartuPerintah(
            perintah: 'ps / top / htop',
            fungsi: 'Lihat proses yang sedang berjalan',
            contoh: r'$ ps aux           → tampil SEMUA proses semua pengguna
$ ps ef              → tampil + pohon hubungan proses
$ htop               → tampilan interaktif cantik (direkomendasikan!)',
          ),
          KartuPerintah(
            perintah: 'kill / killall / pkill',
            fungsi: 'Hentikan proses yang bermasalah',
            contoh: r'$ kill 1234        → minta berhenti dengan sopan (PID 1234)
$ kill -9 1234     → PAKSA berhenti segera
$ killall firefox  → hentikan semua proses bernama firefox
$ pkill -f node    → hentikan proses yang berisi kata node',
          ),
          KartuPerintah(
            perintah: 'systemctl / service',
            fungsi: 'Kelola layanan sistem (mulai/hentikan/aktifkan otomatis)',
            contoh: r'$ sudo systemctl start nginx     → mulai server web
$ sudo systemctl stop nginx      → hentikan
$ sudo systemctl enable nginx    → nyalakan otomatis saat boot
$ sudo systemctl status nginx    → cek status berjalan/tidak',
          ),
          KartuPerintah(
            perintah: 'ip / ifconfig / ping',
            fungsi: 'Konfigurasi & cek jaringan',
            contoh: r'$ ip a              → lihat semua alamat IP antarmuka
$ ping google.com    → cek koneksi internet (Ctrl+C untuk berhenti)
$ ping -c 4 google.com  → kirim 4 kali saja lalu berhenti',
          ),
          KartuPerintah(
            perintah: 'curl / wget / nc',
            fungsi: 'Unduh berkas & uji koneksi jaringan',
            contoh: r'$ curl ifconfig.me          → lihat IP publik kamu
$ wget https://contoh.com/file.zip  → unduh berkas
$ nc -zv google.com 443      → cek apakah port 443 terbuka',
          ),
          KartuPerintah(
            perintah: 'ssh / scp',
            fungsi: 'Masuk ke server jarak jauh & salin berkas antar komputer',
            contoh: r'$ ssh andi@192.168.1.100     → masuk ke server jarak jauh
$ scp file.zip andi@server:/home/andi  → kirim berkas ke server
$ scp andi@server:/home/andi/file.zip ./  → ambil berkas dari server',
          ),

          // ==============================================
          // 📦 BAGIAN 6: MANAJEMEN PAKET & PEMBARUAN
          // ==============================================
          BagianJudul('📦 BAGIAN 6 — Manajemen Paket & Pembaruan'),
          KartuMateri(
            judul: 'Perintah Paket — Debian/Ubuntu & Termux',
            isi: '''
🔹 UBUNTU/DEBIAN (PC/Server):
$ sudo apt update && sudo apt upgrade -y   → update daftar + upgrade semua
$ sudo apt install firefox                 → pasang program
$ sudo apt remove firefox                  → hapus program
$ apt search editor                        → cari program berdasarkan nama
$ apt show firefox                         → lihat detail paket

🔹 TERMUX (Android):
$ pkg update && pkg upgrade -y             → update sistem Termux
$ pkg install nodejs python git            → pasang paket
$ pkg remove nodejs                        → hapus paket
$ pkg search flutter                       → cari paket
''',
            icon: Icons.install_desktop,
          ),

          // ==============================================
          // 🤖 BAGIAN 7: BASH SCRIPTING & OTOMASI
          // ==============================================
          BagianJudul('🤖 BAGIAN 7 — Bash Scripting & Otomasi'),
          KartuMateri(
            judul: 'Dasar Bash Script — Dari Nol',
            isi: r'''
📄 Buat berkas: nano halo.sh
---
#!/bin/bash
# Skrip pertama saya — ini baris komentar

# === VARIABEL ===
nama="Dunia"
echo "Halo, $nama!"        # Gunakan $ untuk ambil nilai variabel

# === INPUT PENGGUNA ===
echo -n "Siapa namamu? "
read nama_user
echo "Selamat datang, $nama_user!"

# === KONDISI IF ===
if [ $1 = "rahasia" ]; then
  echo "Kamu memasukkan kata kunci rahasia!"
else
  echo "Kata kunci tidak ditemukan."
fi

# === PERULANGAN FOR ===
echo "Menghitung sampai 5:"
for i in {1..5}; do
  echo "  $i..."
done

# === FUNGSI ===
fungsi_saya() {
  echo "Ini pesan dari fungsi!"
}
fungsi_saya    # Panggil fungsi
---
▶️ Jalankan:
  chmod +x halo.sh    → beri izin jalankan
  ./halo.sh           → eksekusi
  ./halo.sh rahasia   → jalankan + beri argumen
''',
            icon: Icons.code,
          ),
          KartuPerintah(
            perintah: 'crontab',
            fungsi: 'Jadwalkan perintah berjalan OTOMATIS sesuai waktu',
            contoh: r'$ crontab -e        → buka editor jadwal
# Format: menit jam tanggal bulan hari perintah
# Contoh:
  0 3 * * * ~/cadangan.sh          → tiap jam 3 pagi
  */30 * * * * ~/cek_server.sh     → tiap 30 menit
  0 8 * * 1-5 ~/laporan.sh         → tiap Senin-Jumat jam 8 pagi
  0 0 1 * * ~/bulanan.sh           → tiap tanggal 1 tengah malam

$ crontab -l        → lihat daftar jadwal
$ crontab -r        → hapus semua jadwal',
          ),

          // ==============================================
          // 🛠️ BAGIAN 8: ALAT PENGEMBANG & LANJUTAN
          // ==============================================
          BagianJudul('🛠️ BAGIAN 8 — Alat Pengembang & Fitur Lanjutan'),
          KartuPerintah(
            perintah: 'git',
            fungsi: 'Kontrol versi — kelola kode sumber, kolaborasi',
            contoh: r'$ git init .                  → buat repositori baru
$ git add .                   → tandai semua berkas
$ git commit -m "Versi pertama" → simpan perubahan
$ git push origin main        → kirim ke GitHub/GitLab
$ git pull                    → ambil versi terbaru dari server
$ git status                  → lihat status berkas',
          ),
          KartuPerintah(
            perintah: 'tar / gzip / zip',
            fungsi: 'Kompresi & ekstrak berkas arsip',
            contoh: r'$ tar -czf arsip.tar.gz folder/    → kompres folder jadi .tar.gz
$ tar -xzf arsip.tar.gz                 → ekstrak .tar.gz
$ zip -r arsip.zip folder/              → kompres jadi .zip
$ unzip arsip.zip                       → ekstrak .zip',
          ),
          KartuPerintah(
            perintah: 'alias',
            fungsi: 'Buat nama pendek untuk perintah panjang',
            contoh: r'$ alias ll="ls -la"         → ketik ll = ls -la
$ alias update="sudo apt update && sudo apt upgrade -y"
$ update   → langsung jalankan update lengkap!

# Agar permanen: tambahkan ke ~/.bashrc atau ~/.zshrc',
          ),

          // ==============================================
          // 💡 BAGIAN 9: TRIK & KEBIAASAAN AHLI
          // ==============================================
          BagianJudul('💡 BAGIAN 9 — Trik & Kebiasaan Pengguna Ahli'),
          KartuMateri(
            judul: '30 Trik yang Menghemat Jam Kerja',
            isi: '''
⌨️ PINTASAN KIBOR:
  TAB          → pelengkap otomatis nama berkas/perintah (WAJIB PAKAI!)
  ↑ ↓          → panggil ulang perintah sebelumnya
  Ctrl + R     → cari perintah lama dengan kata kunci
  Ctrl + A     → lompat ke awal baris perintah
  Ctrl + E     → lompat ke akhir baris
  Ctrl + U     → hapus seluruh baris ke kiri kursor
  Ctrl + K     → hapus seluruh baris ke kanan kursor
  Ctrl + W     → hapus satu kata ke kiri
  Ctrl + L     → bersihkan layar (sama dengan perintah clear)
  Ctrl + C     → BATALKAN perintah yang sedang berjalan — SELALU BERGUNA!
  Ctrl + D     → keluar dari terminal/sesi saat ini
  Ctrl + Z     → hentikan sementara proses (ketik fg untuk lanjutkan)

📖 BANTUAN & INFORMASI:
  man ls       → baca panduan lengkap perintah ls (manual)
  ls --help    → bantuan singkat langsung
  whatis ls    → penjelasan singkat satu baris
  apropos cari → cari perintah yang berisi kata "cari"

📝 RIWAYAT PERINTAH:
  history       → tampil semua perintah yang pernah diketik
  !42           → jalankan perintah nomor 42 dari history
  !ls           → jalankan perintah terakhir yang diawali dengan ls
  !!            → ulangi perintah terakhir
  sudo !!       → ulangi perintah terakhir dengan sudo (sangat berguna!)

⚠️ ATURAN EMAS:
  JANGAN hafal SEMUA perintah. Hafal 15 yang paling sering dipakai.
  Sisanya cari dengan: man perintah → atau Google "linux perintah nama"
  Tak perlu takut salah ketik — dari kesalahanlah kamu belajar paling cepat!
''',
            icon: Icons.tips_and_updates,
          ),

          // ==============================================
          // ⚠️ BAGIAN 10: PEMECAHAN MASALAH & KESELAMATAN
          // ==============================================
          BagianJudul('⚠️ BAGIAN 10 — Pemecahan Masalah & Keselamatan'),
          KartuMateri(
            judul: 'Masalah Umum & Cara Mengatasinya',
            isi: '''
🔹 "Permission denied" → Tambahkan sudo, atau cek izin berkas (ls -l)
🔹 "Command not found" → Cek ketikan, atau install paket yang sesuai
🔹 Ruang disk penuh → Jalankan df -h, cari folder besar dengan du -sh, hapus log lama
🔹 Terminal melambat → Cek proses berat dengan htop, hentikan yang tidak perlu
🔹 Tidak bisa masuk server → Cek koneksi (ping), cek port (nc -zv), cek firewall
🔹 Perintah terhenti → Tekan Ctrl+C untuk membatalkan

🛡️ KESELAMATAN & PENCEGAHAN:
  ✅ Selalu cek perintah sebelum tekan Enter — terutama yang diawali sudo
  ✅ Jangan jalankan perintah dari internet yang tidak kamu pahami
  ✅ Sebelum hapus folder penting — cadangkan dulu!
  ✅ Baca pesan error — biasanya sudah memberi tahu penyebabnya
  ✅ Jangan panik — sebagian besar masalah bisa diperbaiki
''',
            icon: Icons.error_outline,
          ),

          // ==============================================
          // 📋 REFERENSI
          // ==============================================
          BagianJudul('📋 REFERENSI CEPAT — LEMBAR BANTUAN'),
          KartuMateri(
            judul: 'Ringkasan Perintah Paling Sering Dipakai',
            isi: '''
📂 NAVIGASI & BERKAS
  pwd, ls, cd, mkdir, cp, mv, rm, cat, less, head, tail

🔐 IZIN & PENGGUNA
  chmod, chown, sudo, su, passwd, whoami, id

🔍 PENCARIAN & FILTER
  grep, find, sort, uniq, wc, cut, awk, sed

📊 SISTEM & PROSES
  df, du, free, ps, top, htop, kill, systemctl, shutdown

🌐 JARINGAN
  ip, ping, curl, wget, ssh, scp, netstat, ss

📦 PAKET
  apt update, apt install, apt remove, pkg update, pkg install

🤖 OTOMASI
  bash, crontab, alias, & (jalankan di latar belakang), nohup

💡 INGAT: Konsistensi > Kecepatan. Latih 30 menit/hari, dalam 1 bulan kamu sudah mahir!
''',
            icon: Icons.menu_book,
          ),
        ],
      ),
    );
  }
}

// === KOMPONEN WIDGET ===
class BagianJudul extends StatelessWidget {
  final String teks;
  const BagianJudul(this.teks, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 32, 0, 12),
      child: Text(
        teks,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.greenAccent,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

class KartuMateri extends StatelessWidget {
  final String judul, isi;
  final IconData icon;
  const KartuMateri({super.key, required this.judul, required this.isi, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: const Color(0xFF1A1A1A),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        leading: Icon(icon, color: Colors.greenAccent, size: 28),
        title: Text(
          judul,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              isi,
              style: const TextStyle(
                color: Color(0xFFE0E0E0),
                height: 1.8,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class KartuPerintah extends StatelessWidget {
  final String perintah, fungsi, contoh;
  const KartuPerintah({super.key, required this.perintah, required this.fungsi, required this.contoh});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 7),
      color: const Color(0xFF151515),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.greenAccent.withOpacity(0.3)),
                  ),
                  child: Text(
                    perintah,
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    fungsi,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blueGrey.withOpacity(0.3)),
              ),
              child: Text(
                contoh,
                style: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 13,
                  color: Colors.cyanAccent,
                  height: 1.6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

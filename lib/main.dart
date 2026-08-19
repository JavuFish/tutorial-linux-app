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
        children: [
          // ==============================================
          // 📘 BAGIAN 1: FILOSOFI & DASAR SISTEM
          // ==============================================
          const BagianJudul('📘 BAGIAN 1 — FILOSOFI & DASAR SISTEM'),
          const KartuMateri(
            judul: '4 Filosofi Inti Linux',
            isi: r'''
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
          const KartuMateri(
            judul: 'Struktur Sistem Berkas — Penjelasan Lengkap',
            isi: r'''
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
          const KartuMateri(
            judul: 'Pengguna, Grup & Izin — Pahami Sekali Selamanya',
            isi: r'''
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
          // ⌨️ BAGIAN 2: PERINTAH DASAR
          // ==============================================
          const BagianJudul('⌨️ BAGIAN 2 — PERINTAH DASAR (Hafal Ini Dulu!)'),
          const KartuPerintah(
            perintah: 'pwd',
            fungsi: 'Tampilkan jalur direktori saat ini',
            contoh: r'$ pwd\n/home/andi/proyek/latihan',
          ),
          const KartuPerintah(
            perintah: 'ls',
            fungsi: 'Lihat isi folder',
            contoh: r'$ ls              → tampil nama saja\n$ ls -l            → tampil detail\n$ ls -la           → + berkas tersembunyi\n$ ls -lh           → ukuran mudah dibaca\n$ ls -lt           → urutkan waktu ubah',
          ),
          const KartuPerintah(
            perintah: 'cd',
            fungsi: 'Pindah ke direktori lain',
            contoh: r'$ cd Dokumen          → masuk folder\n$ cd ..                → naik satu tingkat\n$ cd ../..             → naik dua tingkat\n$ cd /etc              → pindah langsung\n$ cd ~                 → kembali ke folder rumah\n$ cd -                 → kembali ke folder sebelumnya',
          ),
          const KartuPerintah(
            perintah: 'mkdir',
            fungsi: 'Buat folder baru',
            contoh: r'$ mkdir proyek_baru\n$ mkdir -p a/b/c/d    → buat bertingkat\n$ mkdir dok{1,2,3}    → buat sekaligus',
          ),
          const KartuPerintah(
            perintah: 'cp',
            fungsi: 'Salin berkas/folder',
            contoh: r'$ cp file.txt salinan.txt\n$ cp -r folder1 folder2     → salin folder + isi\n$ cp *.txt ~/Dokumen/       → salin semua .txt',
          ),
          const KartuPerintah(
            perintah: 'mv',
            fungsi: 'Pindah berkas atau ganti nama',
            contoh: r'$ mv lama.txt baru.txt    → ganti nama\n$ mv file.txt ~/Unduhan/    → pindah ke folder lain',
          ),
          const KartuPerintah(
            perintah: 'rm',
            fungsi: 'Hapus berkas/folder — ⚠️ TIDAK BISA DIKEMBALIKAN!',
            contoh: r'$ rm sampah.txt\n$ rm -rf folder_saya        → hapus folder + SEMUA isinya\n$ rm *.tmp                  → hapus semua .tmp',
          ),
          const KartuPerintah(
            perintah: 'cat / less / head / tail',
            fungsi: 'Lihat isi berkas teks',
            contoh: r'$ cat catatan.txt        → tampil seluruh isi\n$ less buku.txt          → tampil halaman demi halaman (q=keluar)\n$ head -20 log.txt       → tampil 20 baris pertama\n$ tail -f /var/log/nginx/access.log  → pantau log real-time',
          ),

          // ==============================================
          // 🔐 BAGIAN 3: IZIN, PENGGUNA & MANAJEMEN SISTEM
          // ==============================================
          const BagianJudul('🔐 BAGIAN 3 — Izin, Pengguna & Manajemen Sistem'),
          const KartuPerintah(
            perintah: 'chmod',
            fungsi: 'Ubah izin akses berkas',
            contoh: r'$ chmod 755 skrip.sh    → rwx r-x r-x\n$ chmod 644 berkas.txt   → rw- r-- r--\n$ chmod +x program.sh    → tambah izin jalankan\n$ chmod -w rahasia.txt   → hapus izin tulis',
          ),
          const KartuPerintah(
            perintah: 'chown',
            fungsi: 'Ubah pemilik dan/atau grup berkas',
            contoh: r'$ sudo chown andi:andi file.txt\n$ sudo chown -R andi:andi folder/  → ubah SEMUA isi folder sekaligus',
          ),
          const KartuPerintah(
            perintah: 'useradd / usermod / userdel',
            fungsi: 'Buat, ubah, hapus pengguna',
            contoh: r'$ sudo useradd -m budi     → buat pengguna + folder rumah\n$ sudo passwd budi          → atur kata sandi\n$ sudo userdel -r budi      → hapus pengguna + folder rumah',
          ),
          const KartuPerintah(
            perintah: 'df -h / du -sh',
            fungsi: 'Cek ruang disk & ukuran berkas/folder',
            contoh: r'$ df -h          → sisa ruang tiap partisi\nFilesystem  Size  Used Avail Use%\n/dev/sda1    58G   12G   43G  22%\n\n$ du -sh Dokumen/   → ukuran folder\n145M    Dokumen/',
          ),
          const KartuPerintah(
            perintah: 'free -h',
            fungsi: 'Cek penggunaan memori RAM',
            contoh: r'$ free -h\n              total        used        free\nMem:          8.0Gi       2.3Gi       5.7Gi',
          ),

          // ==============================================
          // 🔍 BAGIAN 4: PIPA, FILTER & PENCARIAN
          // ==============================================
          const BagianJudul('🔍 BAGIAN 4 — Pipa, Filter & Pencarian'),
          const KartuPerintah(
            perintah: 'grep',
            fungsi: 'Cari teks di dalam berkas atau output',
            contoh: r'$ grep "error" log.txt        → cari baris berisi kata error\n$ grep -r "fungsi" .           → cari di SEMUA berkas\n$ grep -i "kata" berkas.txt    → cari tanpa bedakan huruf besar/kecil\n$ ls -la | grep ".txt"         → filter hasil ls',
          ),
          const KartuPerintah(
            perintah: 'find',
            fungsi: 'Cari berkas berdasarkan nama, ukuran, waktu...',
            contoh: r'$ find . -name "*.pdf"        → cari semua berkas PDF\n$ find /home -type d -name proyek  → cari folder bernama proyek\n$ find . -size +100M            → cari berkas > 100 MB\n$ find . -mtime -2              → diubah dalam 2 hari terakhir',
          ),
          const KartuPerintah(
            perintah: 'sort / uniq / wc',
            fungsi: 'Urutkan, hapus duplikat, hitung baris/kata',
            contoh: r'$ daftar.txt | sort              → urutkan A-Z\n$ daftar.txt | sort | uniq       → urutkan + hapus ganda\n$ wc -l buku.txt                 → hitung jumlah baris\n1240 buku.txt',
          ),
          const KartuPerintah(
            perintah: 'cut / paste',
            fungsi: 'Pilih kolom tertentu dari teks',
            contoh: r'$ cat daftar.txt\nAndi 25 Jakarta\nBudi 30 Bandung\n\n$ cut -d" " -f1 daftar.txt      → ambil kolom pertama\nAndi\nBudi',
          ),

          // ==============================================
          // 🌐 BAGIAN 5: PROSES & JARINGAN
          // ==============================================
          const BagianJudul('🌐 BAGIAN 5 — Proses & Jaringan'),
          const KartuPerintah(
            perintah: 'ps / top / htop',
            fungsi: 'Lihat proses yang sedang berjalan',
            contoh: r'$ ps aux           → tampil SEMUA proses\n$ ps ef              → tampil + pohon hubungan\n$ htop               → tampilan interaktif cantik',
          ),
          const KartuPerintah(
            perintah: 'kill / killall / pkill',
            fungsi: 'Hentikan proses yang bermasalah',
            contoh: r'$ kill 1234        → minta berhenti dengan sopan\n$ kill -9 1234     → PAKSA berhenti segera\n$ killall firefox  → hentikan semua proses firefox\n$ pkill -f node    → hentikan proses yang berisi kata node',
          ),
          const KartuPerintah(
            perintah: 'systemctl / service',
            fungsi: 'Kelola layanan sistem',
            contoh: r'$ sudo systemctl start nginx     → mulai server web\n$ sudo systemctl stop nginx      → hentikan\n$ sudo systemctl enable nginx    → nyalakan otomatis saat boot\n$ sudo systemctl status nginx    → cek status',
          ),
          const KartuPerintah(
            perintah: 'ip / ifconfig / ping',
            fungsi: 'Konfigurasi & cek jaringan',
            contoh: r'$ ip a              → lihat semua alamat IP\n$ ping google.com    → cek koneksi internet (Ctrl+C berhenti)\n$ ping -c 4 google.com  → kirim 4 kali lalu berhenti',
          ),
          const KartuPerintah(
            perintah: 'curl / wget / nc',
            fungsi: 'Unduh berkas & uji koneksi jaringan',
            contoh: r'$ curl ifconfig.me          → lihat IP publik\n$ wget https://contoh.com/file.zip  → unduh berkas\n$ nc -zv google.com 443      → cek apakah port 443 terbuka',
          ),
          const KartuPerintah(
            perintah: 'ssh / scp',
            fungsi: 'Masuk ke server jarak jauh & salin berkas',
            contoh: r'$ ssh andi@192.168.1.100     → masuk ke server jarak jauh\n$ scp file.zip andi@server:/home/andi  → kirim berkas ke server\n$ scp andi@server:/home/andi/file.zip ./  → ambil berkas dari server',
          ),

          // ==============================================
          // 📦 BAGIAN 6: MANAJEMEN PAKET — ✅ SUDAH DIPERBAIKI!
          // ==============================================
          const BagianJudul('📦 BAGIAN 6 — Manajemen Paket & Pembaruan'),
          const KartuMateri(
            judul: 'Perintah Paket — Debian/Ubuntu & Termux',
            isi: r'''
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
          const BagianJudul('🤖 BAGIAN 7 — Bash Scripting & Otomasi'),
          const KartuMateri(
            judul: 'Dasar Bash Script — Dari Nol',
            isi: r'''
📄 Buat berkas: nano halo.sh
---
#!/bin/bash
# Skrip pertama saya — ini baris komentar

# === VARIABEL ===
nama="Dunia"
echo "Halo, $nama!"        → pakai $ untuk ambil nilai variabel

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
fungsi_saya    → panggil fungsi
---
▶️ Jalankan:
  chmod +x halo.sh    → beri izin jalankan
  ./halo.sh           → eksekusi
  ./halo.sh rahasia   → jalankan + beri argumen
''',
            icon: Icons.code,
          ),
          const KartuPerintah(
            perintah: 'crontab',
            fungsi: 'Jadwalkan perintah berjalan otomatis',
            contoh: r'$ crontab -e        → buka editor jadwal\n# menit jam tanggal bulan hari perintah\n  0 3 * * * ~/cadangan.sh          → tiap jam 3 pagi\n  */30 * * * * ~/cek_server.sh     → tiap 30 menit\n  0 8 * * 1-5 ~/laporan.sh         → Senin-Jumat jam 8 pagi\n  0 0 1 * * ~/bulanan.sh           → tiap tanggal 1 tengah malam\n\n$ crontab -l        → lihat daftar jadwal\n$ crontab -r        → hapus semua jadwal',
          ),

          // ==============================================
          // 🛠️ BAGIAN 8: ALAT PENGEMBANG & LANJUTAN
          // ==============================================
          const BagianJudul('🛠️ BAGIAN 8 — Alat Pengembang & Fitur Lanjutan'),
          const KartuPerintah(
            perintah: 'git',
            fungsi: 'Kontrol versi — kelola kode sumber',
            contoh: r'$ git init .                  → buat repositori baru\n$ git add .                   → tandai semua berkas\n$ git commit -m "Versi pertama" → simpan perubahan\n$ git push origin main        → kirim ke GitHub\n$ git pull                    → ambil versi terbaru\n$ git status                  → lihat status berkas',
          ),
          const KartuPerintah(
            perintah: 'tar / gzip / zip',
            fungsi: 'Kompresi & ekstrak berkas arsip',
            contoh: r'$ tar -czf arsip.tar.gz folder/    → kompres jadi .tar.gz\n$ tar -xzf arsip.tar.gz                 → ekstrak .tar.gz\n$ zip -r arsip.zip folder/              → kompres jadi .zip\n$ unzip arsip.zip                       → ekstrak .zip',
          ),
          const KartuPerintah(
            perintah: 'alias',
            fungsi: 'Buat nama pendek untuk perintah panjang',
            contoh: r'$ alias ll="ls -la"         → ketik ll = ls -la\n$ alias update="sudo apt update && sudo apt upgrade -y"\n$ update   → langsung jalankan update lengkap!\n\n# Agar permanen: tambahkan ke ~/.bashrc atau ~/.zshrc',
          ),

          // ==============================================
          // 💡 BAGIAN 9: TRIK & KEBIAASAAN AHLI
          // ==============================================
          const BagianJudul('💡 BAGIAN 9 — Trik & Kebiasaan Pengguna Ahli'),
          const KartuMateri(
            judul: '30 Trik yang Menghemat Jam Kerja',
            isi: r'''
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
  Ctrl + C     → BATALKAN perintah yang sedang berjalan
  Ctrl + D     → keluar dari terminal/sesi saat ini
  Ctrl + Z     → hentikan sementara proses (ketik fg untuk lanjutkan)

📖 BANTUAN & INFORMASI:
  man ls       → baca panduan lengkap perintah ls
  ls --help    → bantuan singkat
  whatis ls    → penjelasan singkat satu baris
  apropos cari → cari perintah yang berisi kata "cari"

📝 RIWAYAT PERINTAH:
  history       → tampil semua perintah yang pernah diketik
  !42           → jalankan perintah nomor 42
  !ls           → jalankan perintah terakhir yang diawali dengan ls
  !!            → ulangi perintah terakhir
  sudo !!       → ulangi dengan sudo (sangat berguna!)

⚠️ ATURAN EMAS:
  Jangan hafal SEMUA perintah. Hafal 15 yang paling sering dipakai.
  Sisanya cari dengan: man perintah atau Google.
  Tak perlu takut salah ketik — dari kesalahanlah kamu belajar paling cepat!
''',
            icon: Icons.tips_and_updates,
          ),

          // ==============================================
          // ⚠️ BAGIAN 10: PEMECAHAN MASALAH & KESELAMATAN
          // ==============================================
          const BagianJudul('⚠️ BAGIAN 10 — Pemecahan Masalah & Keselamatan'),
          const KartuMateri(
            judul: 'Masalah Umum & Cara Mengatasinya',
            isi: r'''
🔹 "Permission denied" → Tambahkan sudo, atau cek izin berkas (ls -l)
🔹 "Command not found" → Cek ketikan, atau install paket yang sesuai
🔹 Ruang disk penuh → Jalankan df -h, cari folder besar dengan du -sh, hapus log lama
🔹 Terminal melambat → Cek proses berat dengan htop, hentikan yang tidak perlu
🔹 Tidak bisa masuk server → Cek koneksi (ping), cek port (nc -zv), cek firewall
🔹 Perintah terhenti → Tekan Ctrl+C untuk membatalkan

🛡️ KESELAMATAN:
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
          const BagianJudul('📋 REFERENSI CEPAT — LEMBAR BANTUAN'),
          const KartuMateri(
            judul: 'Ringkasan Perintah Paling Sering Dipakai',
            isi: r'''
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

# Smart-Certificate

Cara menggunakan aplikasi
1. Upload file "Certificate.sol" pada website https://remix.ethereum.org/
2. Compile Certificate.sol
3. Jalankan aplikasi Ganache agar dapat terhubung dengan jaringan ethereum local
4. Navigasi ke halaman "Deploy & run transactions" pada website remix.ethereum, ubah environment remix agar menggunakan "Custom - External Http Provider", ganti alamat IP dan Port yang sesuai dengan di aplikasi Ganache untuk terhubung dengan jaringan ethereum local
5. pada aplikasi remix, klik "Deploy" untuk mendeploy program Smart Certificate
6. Copy alamat smart certificate (terletak di bagian "Deployed Contracts") lalu paste di file index.html line 68 dan register.html line 102
7. Save kedua file index.html dan register.html, lalu buka file index.html di browser untuk mendaftarkan dan memverifikasi sertifikat

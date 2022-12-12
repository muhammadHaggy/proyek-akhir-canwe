# CanWe <img src="https://cdn-icons-png.flaticon.com/128/2904/2904948.png" width="30" height="30">

[![Build and Deploy](https://github.com/muhammadHaggy/proyek-akhir-canwe/actions/workflows/release.yml/badge.svg)](https://github.com/muhammadHaggy/proyek-akhir-canwe/actions/workflows/release.yml)

### 😎 Nama Anggota
1. 2106750370 - Muhammad Haggy
2. 2106706691 - Febrian Dwi Kimhan
3. 2106751846 - Zanetta Aisha Dharmawan
4. 2106751474 - Maritza Rahayu Indriyani
5. 2106707076 - Muhammad Hadziq Razin
<br>

### 🔗📱Link apk : install.appcenter.ms/users/canwe/apps/canwe-android/distribution_groups/testers 

### 🔗💻Link web: https://canwe.pythonanywhere.com/


### 📖 Cerita CanWe
Menurut Global Hunger Index (GHI), tingkat kelaparan Indonesia menempati urutan ketiga tertinggi di Asia Tenggara pada 2021. Indonesia mendapatkan skor indeks sebesar 18 poin atau termasuk ke dalam level moderat. GHI menggambarkan situasi kelaparan suatu negara yang berhubungan dengan kebutuhan dasar fisiologis manusia, yaitu kebutuhan pangan dan nutrisi. Skor indeks GHI didasarkan pada empat komponen, yaitu kondisi kurang gizi, anak yang kurus, stunting anak, dan kematian anak.
<br>

CanWe hadir untuk membantu menanggulangi permasalahan yang dihadapi masyarakat Indonesia dalam memenuhi kebutuhan pangan dan nutrisi. CanWe merupakan situs yang bertujuan untuk mengumpulkan donasi dan penggalangan dana agar dapat meningkatkan kualitas hidup anak-anak dan keluarga yang membutuhkan dengan menyediakan makanan sehat dan pendidikan gizi. Melalui CanWe, kami berharap dapat memastikan bahwa lebih banyak anak yang tidak hanya dapat bertahan, melainkan berkembang, hari ini, dan seterusnya. **Can We? Yes, We Can!**
<br>

### 👨🏻‍💻 Role Peran Pengguna
User | Moderator
---- | ---------
User memiliki otoritas untuk mengakses landing page, mengakses halaman profil, melakukan donasi maupun penggalangan dana, mendapatkan notifikasi, serta mengirimkan pertanyaan kepada pengelola website. | Moderator berperan sebagai pemegang kendali website dan memiliki akses penuh untuk melakukan moderasi konten yang ada pada CanWe.
<br>

### ✅ Daftar Modul dan Kontrak Kinerja
CanWe mengimplementasikan beberapa fitur atau modul sebagai berikut.
No. | Modul | Deskripsi Modul | Anggota yang mengerjakan
--- | ----- | ----------------|------------------------
1 | Donasi | Halaman untuk menampilkan donasi yang tersedia dan user dapat melakukan donasi |Muhammad Hadziq Razin
2 | Penggalangan Dana | Halaman untuk melakukan penggalangan dana baik jenis penggalangan dana untuk makanan atau penyuluhan pendidikan gizi | Febrian Dwi Kimhan
3 | Notifikasi | Halaman untuk melihat notifikasi yang dikirimkan oleh pihak CanWe |Zanetta Aisha Dharmawan
4 | Profil | Halaman untuk mengupdate data profil |Muhammad Haggy
5 | FAQ | Halaman untuk memberikan pertanyaan kepada pihak CanWe |Maritza Rahayu Indriyani


### Alur pengintegrasian dengan web service untuk terhubung dengan aplikasi web yang sudah dibuat saat Proyek Tengah Semester
1. Melengkapi end point pada web untuk tiap modul (baik untuk menambil dan mengirim data)
2. Menambahkan middleware di Django agar API dapat diakses dari luar website
3. Membuat fungsi asynchronous untuk setiap proses yang berkaitan dengan mengambil, mengirim, ataupun mengubah data
4. Pengambilan data akan menggunakan http.get dari endpoint data di web yang hasil pemanggilannya akan digunakan untuk ditampilkan pada widget yang digunakan
5. Untuk mengirim data akan digunakan request http.post yang menuju ke endpoint untuk menyimpan data yang disimpan di database Django

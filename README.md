FunkyFit — Laporan Proyek

**Ringkasan singkat**

Proyek "FunkyFit" mengembangkan sebuah aplikasi demo belanja berbasis Flutter dengan penekanan pada navigasi multi-layar menggunakan named routes dan dukungan deep linking pada Android. Implementasi memungkinkan produk tertentu dibuka langsung melalui skema URI kustom dan ditangani oleh aplikasi melalui paket `uni_links`.

**Tujuan:** Implementasi navigasi bernama dan deep linking untuk tugas akademik.

**Target pengguna:** Dosen dan mahasiswa dalam konteks penilaian proyek serta pengembang yang mempelajari pola deep linking.

---

## 1. Fitur yang Diimplementasikan

- Navigasi menggunakan Flutter named routes (`Navigator.pushNamed`).
- Layar: Home, Product Detail, Cart, About.
- Passing `productId` melalui argumen route (route arguments).
- Deep linking Android dengan skema kustom: `funkyfit://product/{id}`.
- Penanganan deep link menggunakan paket `uni_links`.
- Navigasi app via bottom navigation bar atau drawer untuk perpindahan antar layar.
- Penanganan error untuk `productId` tidak valid (halaman error tersendiri).
- Antarmuka mengikuti prinsip Material Design konsisten.

---

## 2. Detil Teknis

- Framework: Flutter (Dart)
- Platform fokus: Android (intent filters pada `AndroidManifest.xml`)
- Routing: `Navigator.pushNamed(context, '/product', arguments: id)`
- Deep linking: konfigurasi `intent-filter` di Android + pendengaran URI via `uni_links` pada titik inisialisasi aplikasi (biasanya di `main()` atau pada `initState()` halaman root).

Contoh pengiriman argumen saat navigasi:

```dart
Navigator.pushNamed(context, '/product', arguments: {'id': product.id});
```

Contoh intent adb (pengujian):

```bash
# ganti [package_name] dengan package aplikasi Anda
adb shell am start -a android.intent.action.VIEW -d "funkyfit://product/2" [package_name]
# contoh nyata:
adb shell am start -a android.intent.action.VIEW -d "funkyfit://product/2" com.example.funkyfit
```

---

## 3. Arsitektur Navigasi dan Deep Linking

Alur navigasi utama memanfaatkan named routes yang dideklarasikan pada `MaterialApp` (`routes` atau `onGenerateRoute`). Untuk membuka detail produk, aplikasi menunggu argumen `id` pada route `/product`. Ketika aplikasi menerima URI dari Android (melalui intent), `uni_links` mem-parsing URI dan memutuskan tindakan: jika pola cocok `funkyfit://product/{id}`, aplikasi melakukan navigasi ke route `/product` dengan `id` sebagai argumen.

Penempatan logika deep link dilakukan pada tahap inisialisasi aplikasi sehingga deep link dapat ditangani baik ketika aplikasi dalam keadaan cold-start maupun ketika sudah berjalan (warm). Mekanisme ini juga memvalidasi `id` sebelum navigasi sehingga mencegah navigasi ke resource yang tidak ada.

---

## 4. Penanganan Error untuk ID Produk Tidak Valid

Jika `productId` yang diterima tidak ditemukan pada repository lokal, aplikasi menavigasi ke halaman error yang informatif. Halaman ini menampilkan pesan kesalahan, tombol kembali ke Home, dan opsi untuk melaporkan masalah. Validasi dilakukan sebelum membuat tampilan detail sehingga tidak terjadi exception UI.

---

## 5. Cara Build & Jalankan (Singkat)

1. Pastikan Flutter SDK terpasang dan tersetup untuk Android.
2. Jalankan dependensi:

```bash
flutter pub get
```

3. Jalankan pada perangkat Android/AVD:

```bash
flutter run -d <device-id>
```

4. Untuk mengetes deep link via ADB, jalankan contoh perintah di bagian sebelumnya.

---

## 6. Screenshot

1. Tampilan Login

	![Login](images/Login (FunkyFit).jpeg)

	Deskripsi: Halaman login aplikasi FunkyFit.

2. Layar Home / Dashboard

	![Home](images/dashboard (FunkyFit).jpeg)

	Deskripsi: Halaman utama menampilkan katalog produk dan navigasi.

3. Detail Produk

	![Product detail](images/detail produk (FunkyFit).jpeg)

	Deskripsi: Halaman detail produk yang dibuka dari Home atau deep link.

4. Tampilan Keranjang (Cart)

	![Cart](images/cart atau keranjang (FunkyFit).jpeg)

	Deskripsi: Tampilan keranjang yang menampilkan item yang ditambahkan dan total harga.

Catatan: file gambar sudah tersedia di folder `images/` dengan nama seperti tercantum di atas.

---

## 7. Refleksi (400–600 kata)

Arsitektur navigasi pada proyek ini didesain untuk memisahkan logika routing dari logika presentasi sehingga setiap layar dapat dipanggil baik dari alur internal aplikasi maupun dari sumber eksternal melalui deep link. Implementasi named routes di `MaterialApp` memudahkan pemetaan path ke widget, sementara penggunaan `arguments` memungkinkan pengiriman `productId` secara eksplisit ke `ProductDetailScreen`. Untuk mengakomodasi deep linking, saya memposisikan pendengar URI (`uni_links`) pada tahap inisialisasi aplikasi sehingga penerimaan intent dapat ditangani baik saat aplikasi cold-start maupun sudah berjalan. Pendekatan ini menjaga konsistensi pengalaman pengguna: ketika menerima URI `shopmate://product/{id}`, aplikasi akan memvalidasi `id` terhadap repository lokal, lalu menavigasi ke route `/product` dengan argumen yang sesuai.

Tantangan teknis utama adalah memastikan robustitas saat menerima URI yang tidak valid dan menjaga urutan navigasi yang benar saat aplikasi belum siap (mis. sebelum widget root terinisialisasi). Untuk mengatasi ini, saya menerapkan queue sederhana untuk menyimpan URI yang masuk sementara aplikasi belum siap, lalu memproses queue tersebut setelah inisialisasi selesai. Selain itu, pengecekan validitas `productId` dilakukan sebelum panggilan `Navigator` sehingga mencegah rendering halaman detail dengan data null yang berpotensi menyebabkan exception. Pada sisi Android, konfigurasi `intent-filter` pada `AndroidManifest.xml` harus tepat (action VIEW, category BROWSABLE) agar intent dikirim ke aplikasi; pengujian intensif dilakukan menggunakan perintah `adb shell am start ...` untuk memastikan perilaku cold-start dan warm-start sama.

Deep linking meningkatkan kegunaan dan discoverability aplikasi dengan dua cara utama. Pertama, pengguna atau sumber eksternal (mis. kampanye pemasaran, notifikasi, atau tautan di web) dapat membuka langsung konten spesifik tanpa harus melewati serangkaian layar. Hal ini mengurangi jumlah langkah untuk mencapai produk yang dituju, meningkatkan konversi dan kepuasan pengguna. Kedua, deep link memungkinkan integrasi dengan ekosistem lain (mis. mesin pencari internal, email, atau iklan), sehingga aplikasi lebih mudah diindeks dan ditemukan oleh pengguna yang relevan.

Jika aplikasi ini dipublikasikan, satu fitur utama yang direkomendasikan adalah menambahkan dukungan Universal Links / App Links lintas platform (termasuk konfigurasi domain untuk Android App Links dan Apple Universal Links). Fitur ini memungkinkan link HTTP/HTTPS mengarah langsung ke aplikasi tanpa interstitial, meningkatkan keamanan dan keandalan deep linking. Selain itu, integrasi analytics untuk mengevaluasi efektivitas deep link akan membantu mengoptimalkan pengalaman pengguna.

---

## 8. Referensi singkat

- Paket `uni_links` untuk menangani intent/URI di Flutter
- Dokumentasi Android tentang `intent-filter` dan App Links

---

Jika Anda ingin, saya dapat:

- Memindahkan atau menamai ulang file screenshot di folder `images/` sesuai placeholder di atas,
- Menambahkan potongan `AndroidManifest.xml` contoh untuk intent-filter,
- Atau membuat contoh `onGenerateRoute` untuk routing yang lebih kompleks.



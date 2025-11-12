# ⚽ bolabelishop - Repository Tugas PBP

**Repository Tugas Individu Pemrograman Berbasis Platform (PBP)**  
**Fakultas Ilmu Komputer, Universitas Indonesia**

**Nama:** Dimas Abyan Diasta
**NPM:** 2406432633
**Kelas:** PBP C


---

<details open>
<summary><h2>📦 Tugas 7: Elemen Dasar Flutter</h2></summary>

## Deskripsi Tugas
Pada tugas ini, saya membuat aplikasi mobile Flutter bernama **bolabelishop** yang merupakan aplikasi untuk mengelola produk sepak bola. Aplikasi ini mengimplementasikan konsep dasar Flutter seperti widget tree, stateless widget, dan user interaction.

---

## 📝 Jawaban Pertanyaan

### 1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.

**Widget Tree** adalah struktur hierarki yang menggambarkan bagaimana widget-widget di Flutter disusun dan saling berhubungan. Setiap aplikasi Flutter pada dasarnya adalah sebuah pohon widget yang dimulai dari widget root (biasanya `MaterialApp` atau `CupertinoApp`).

**Hubungan Parent-Child:**
- Setiap widget dapat memiliki satu atau lebih widget **child** (anak)
- Widget **parent** (induk) bertanggung jawab untuk mengatur layout, posisi, dan ukuran widget child-nya
- Komunikasi data biasanya mengalir dari parent ke child melalui constructor parameters
- Child widget dapat mengirim informasi ke parent melalui callback functions

**Contoh dalam proyek ini:**
```
MyApp (root)
└── MaterialApp
    └── MyHomePage
        └── Scaffold
            ├── AppBar
            │   └── Text
            └── Body
                └── Padding
                    └── Column
                        ├── Row (InfoCard)
                        └── GridView (ItemCard)
```

---

### 2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.

**Widget yang Digunakan:**

1. **MaterialApp** - Widget root aplikasi yang menyediakan konfigurasi tema, routing, dan material design

2. **Scaffold** - Menyediakan struktur dasar halaman dengan AppBar, Body, dan komponen material design lainnya

3. **AppBar** - Bar di bagian atas aplikasi yang menampilkan judul dan actions

4. **Text** - Menampilkan teks di layar

5. **Padding** - Memberikan jarak/ruang kosong di sekitar widget child

6. **Column** - Menyusun widget children secara vertikal (dari atas ke bawah)

7. **Row** - Menyusun widget children secara horizontal (dari kiri ke kanan)

8. **Card** - Widget material design yang menampilkan informasi dalam bentuk kartu dengan bayangan

9. **Container** - Widget serbaguna untuk mengatur ukuran, padding, margin, dan dekorasi

10. **GridView.count** - Menampilkan widget children dalam bentuk grid dengan jumlah kolom tetap

11. **Material** - Menyediakan visual material design seperti warna latar belakang dan efek ripple

12. **InkWell** - Widget yang mendeteksi gesture tap dan memberikan efek ripple saat ditekan

13. **Icon** - Menampilkan ikon dari material design icon library

14. **SizedBox** - Widget untuk memberikan jarak kosong dengan ukuran tertentu

15. **Center** - Menempatkan child widget di tengah-tengah

16. **SnackBar** - Menampilkan pesan singkat di bagian bawah layar

---

### 3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.

**Fungsi MaterialApp:**
- Menyediakan konfigurasi dasar untuk aplikasi yang mengikuti Material Design
- Mengatur tema aplikasi (warna, font, dll)
- Mengelola routing/navigasi antar halaman
- Menyediakan widget-widget pendukung seperti Navigator, Theme, MediaQuery, dll

**Mengapa Sering Digunakan sebagai Widget Root:**
1. **Konfigurasi Terpusat**: Semua konfigurasi aplikasi (tema, routing, localization) ada di satu tempat
2. **Material Design**: Otomatis menerapkan prinsip-prinsip Material Design dari Google
3. **Navigator**: Menyediakan sistem navigasi bawaan untuk berpindah antar halaman
4. **Konsistensi**: Memastikan tampilan konsisten di seluruh aplikasi
5. **Best Practice**: Sudah menjadi standar dalam pengembangan Flutter

---

### 4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?

**StatelessWidget:**
- Widget yang tidak memiliki state (keadaan) yang dapat berubah
- Immutable - sekali dibuat, tidak dapat diubah
- Hanya melakukan rebuild jika parent widget berubah
- Lebih efisien dalam penggunaan memori

**StatefulWidget:**
- Widget yang memiliki state yang dapat berubah selama aplikasi berjalan
- Mutable - dapat diupdate menggunakan `setState()`
- Dapat melakukan rebuild kapan saja state berubah
- Memiliki lifecycle methods (initState, dispose, dll)

**Kapan Menggunakan:**

**Gunakan StatelessWidget jika:**
- Tampilan tidak berubah selama runtime
- Hanya menampilkan data statis
- Tidak ada interaksi yang mengubah tampilan
- Contoh: Text, Icon, Image statis, Layout containers

**Gunakan StatefulWidget jika:**
- Tampilan berubah berdasarkan interaksi user
- Ada data yang di-update secara dinamis
- Perlu mengelola lifecycle widget
- Contoh: Form input, Animation, Counter, Checkbox

**Dalam proyek ini**, saya menggunakan **StatelessWidget** karena tombol-tombol hanya menampilkan SnackBar tanpa mengubah state internal widget.

---

### 5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?

**BuildContext** adalah objek yang merepresentasikan lokasi widget dalam widget tree. Setiap widget memiliki BuildContext sendiri.

**Mengapa Penting:**
1. **Akses ke Widget Tree**: Memberikan akses ke widget parent di atasnya
2. **Theme & MediaQuery**: Mengakses tema aplikasi dan informasi device
3. **Navigation**: Digunakan untuk navigasi antar halaman
4. **Inherited Widgets**: Mengakses data yang diteruskan dari widget ancestor
5. **ScaffoldMessenger**: Menampilkan SnackBar, Dialog, dll

**Penggunaan di Metode Build:**

```dart
@override
Widget build(BuildContext context) {
  // Mengakses tema
  final theme = Theme.of(context);
  
  // Mengakses ukuran layar
  final screenWidth = MediaQuery.of(context).size.width;
  
  // Menampilkan SnackBar
  ScaffoldMessenger.of(context).showSnackBar(...);
  
  // Navigasi
  Navigator.push(context, ...);
  
  return Widget(...);
}
```

**Dalam proyek ini**, BuildContext digunakan untuk:
- Mengakses tema aplikasi: `Theme.of(context).colorScheme.primary`
- Menampilkan SnackBar: `ScaffoldMessenger.of(context).showSnackBar(...)`
- Mendapatkan ukuran layar: `MediaQuery.of(context).size.width`

---

### 6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".

**Hot Reload:**
- Menginjeksi kode yang diupdate ke dalam Dart VM yang sedang berjalan
- Mempertahankan state aplikasi yang sedang berjalan
- Sangat cepat (biasanya < 1 detik)
- Cocok untuk perubahan UI dan logic kecil
- **Shortcut**: `r` di terminal atau `Ctrl+S` / `Cmd+S` dengan auto-save

**Kelebihan Hot Reload:**
- State tetap terjaga (contoh: counter tidak reset)
- Tidak perlu menavigasi ulang ke halaman yang sama
- Produktivitas tinggi saat development

**Hot Restart:**
- Me-restart aplikasi dari awal
- Menghapus semua state yang ada
- Lebih lambat dari hot reload (beberapa detik)
- Cocok untuk perubahan besar seperti perubahan pada `main()`, initState, atau global variables
- **Shortcut**: `R` di terminal

**Kapan Menggunakan:**

**Hot Reload jika:**
- Mengubah tampilan UI
- Mengubah logic dalam method
- Menambah atau mengubah widget

**Hot Restart jika:**
- Mengubah fungsi `main()`
- Menambah dependency baru
- Mengubah global variables atau constants
- Mengubah native code (iOS/Android)
- Hot reload tidak memberikan hasil yang diharapkan

<details open>
<summary><h2>📦 Tugas 8: Flutter Navigation, Layouts, Forms, and Input Elements</h2></summary>

## Deskripsi Tugas
Pada tugas ini, saya mengimplementasikan navigation, layout, form, dan form input elements pada aplikasi mobile Flutter bernama **bolabelishop**. Aplikasi ini dilengkapi dengan drawer navigation, form untuk menambah produk dengan validasi, serta integrasi navigasi yang konsisten di seluruh aplikasi.

---

## 📝 Jawaban Pertanyaan

### 1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?

**Navigator.push():**
- Menambahkan halaman baru ke dalam stack navigasi
- Halaman sebelumnya tetap berada di dalam stack
- Menampilkan tombol back secara otomatis di AppBar
- Memungkinkan user untuk kembali ke halaman sebelumnya

**Navigator.pushReplacement():**
- Mengganti halaman saat ini dengan halaman baru
- Menghapus halaman sebelumnya dari stack
- Tidak menampilkan tombol back
- User tidak dapat kembali ke halaman sebelumnya

**Penggunaan dalam aplikasi Football Shop:**

Saya menggunakan **Navigator.push()** pada tombol "Create Product" di halaman utama:
```dart
if (item.name == "Create Product") {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const ProductEntryFormPage(),
    ),
  );
}
```
Hal ini memungkinkan user untuk kembali ke halaman utama setelah selesai mengisi form atau membatalkan input.

Saya menggunakan **Navigator.pushReplacement()** pada drawer menu:
```dart
Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => MyHomePage(),
  )
);
```
Hal ini mencegah penumpukan halaman di stack saat navigasi melalui menu, sehingga lebih efisien dan mencegah user "terjebak" dalam loop navigasi.

---

### 2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?

Saya memanfaatkan **hierarchy widget** dengan cara berikut:

**1. Scaffold sebagai struktur dasar**

Scaffold digunakan di setiap halaman untuk menyediakan struktur konsisten:
```dart
return Scaffold(
  appBar: AppBar(...),
  drawer: const LeftDrawer(),
  body: ...,
);
```

**2. AppBar sebagai header konsisten**

Setiap halaman memiliki AppBar dengan styling yang sama:
- Warna background menggunakan `Theme.of(context).colorScheme.primary`
- Text berwarna putih dengan font bold
- Icon theme berwarna putih

**3. Drawer sebagai menu navigasi konsisten**

Saya membuat widget `LeftDrawer` yang dapat digunakan kembali di semua halaman:
```dart
class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});
  // ...
}
```

Dengan menggunakan widget yang sama di setiap halaman, saya memastikan:
- Navigasi selalu accessible dari manapun
- Tampilan menu konsisten
- Maintenance lebih mudah (update di satu tempat berlaku untuk semua halaman)

---

### 3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.

**1. Padding**

Memberikan spacing/jarak di sekitar widget untuk meningkatkan readability dan estetika:

```dart
Padding(
  padding: const EdgeInsets.all(8.0),
  child: TextFormField(
    decoration: InputDecoration(
      hintText: "Nama Produk",
      labelText: "Nama Produk",
      // ...
    ),
  ),
),
```

Kelebihan: Membuat tampilan tidak cramped dan lebih mudah dibaca.

**2. SingleChildScrollView**

Memungkinkan konten untuk di-scroll jika melebihi ukuran layar:

```dart
body: Form(
  key: _formKey,
  child: SingleChildScrollView(
    child: Column(
      children: [
        // Multiple input fields
      ],
    ),
  ),
)
```

Kelebihan:
- Mencegah overflow error pada layar kecil
- Form tetap accessible meski keyboard muncul
- Semua field dapat diakses dengan scroll

**3. ListView**

Efficient rendering untuk list items dengan lazy loading:

```dart
Drawer(
  child: ListView(
    children: [
      DrawerHeader(...),
      ListTile(...),
      ListTile(...),
    ],
  ),
)
```

Kelebihan:
- Performa baik untuk list panjang
- Built-in scrolling behavior
- Hanya render item yang visible di layar

---

### 4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?

Saya menggunakan **Material Theme System** dengan mendefinisikan theme di `main.dart`:

```dart
theme: ThemeData(
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.deepPurple,
  ).copyWith(secondary: Colors.deepPurple[400]),
  useMaterial3: true,
),
```

**Konsistensi tema diterapkan pada:**

1. **AppBar**: Menggunakan `Theme.of(context).colorScheme.primary`
2. **Drawer Header**: Menggunakan primary color untuk background
3. **Button**: Menggunakan primary color untuk background
4. **Card Colors**: Menggunakan warna semantic (blue, green, red) untuk membedakan jenis aksi

**Keuntungan pendekatan ini:**
- Warna konsisten di seluruh aplikasi
- Mudah diubah dari satu tempat (centralized theme)
- Otomatis diterapkan ke semua widget yang menggunakan theme
- Memberikan identitas visual yang kuat dengan warna deepPurple sebagai brand color

---

### 5. Melakukan add, commit, dan push ke GitHub.

Saya melakukan workflow Git standar untuk menyimpan progress:

```bash
# Menambahkan file ke staging area
git add .

# Commit dengan pesan yang deskriptif
git commit -m "Add product entry form and drawer navigation for Tugas 8"

# Push ke GitHub
git push origin main
```

**Commit message yang digunakan:**
```
Add product entry form and drawer navigation for Tugas 8

- Implement ProductEntryFormPage with validation
- Create LeftDrawer widget for navigation
- Update menu.dart with drawer integration
- Add Navigator.push and pushReplacement
```

---

<div align="center">
  <b>⚽ bolabelishop - Your Football Product Marketplace ⚽</b>
  <br>
  Made with ❤️ using Flutter
</div>
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

</details>

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
</details>

<details open>
<summary><h2>📦 Tugas 9: Integrasi Layanan Web Django dengan Aplikasi Flutter</h2></summary>

---

## 📝 Jawaban Pertanyaan

### 1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?

**Mengapa Perlu Membuat Model Dart:**

Model Dart memberikan struktur yang jelas dan type-safe untuk data yang diterima dari API. Beberapa alasan pentingnya:

**1. Type Safety**
- Model memastikan setiap field memiliki tipe data yang benar
- Compiler Flutter dapat mendeteksi error tipe data saat compile-time, bukan runtime
- Mencegah error seperti mengakses field yang tidak ada atau salah tipe

**2. Null Safety**
- Dart memiliki null-safety yang ketat, model membantu menangani nullable fields dengan jelas
- Dapat mendefinisikan field mana yang nullable (`String?`) dan mana yang required (`String`)
- Mengurangi null pointer exceptions

**3. Maintainability**
- Kode lebih mudah dibaca dan dipahami
- Jika struktur API berubah, cukup update model di satu tempat
- IDE dapat memberikan autocomplete untuk fields

**4. Validation**
- Model dapat memiliki validation logic bawaan
- Memastikan data yang diterima sesuai format yang diharapkan

**Konsekuensi Tanpa Model (Langsung Map<String, dynamic>):**

```dart
// ❌ Tanpa Model - Rawan Error
Map<String, dynamic> product = jsonData[0];
String name = product['name']; // Tidak ada type checking
int price = product['price']; // Bisa crash jika price null atau string
```

**Masalah yang muncul:**
- **Runtime Errors**: Error baru ketahuan saat aplikasi berjalan
- **Typo Prone**: Salah ketik nama field tidak terdeteksi compiler
- **Null Errors**: Tidak jelas field mana yang bisa null
- **Sulit Maintain**: Perubahan API structure sulit dilacak
- **No IDE Support**: Tidak ada autocomplete atau type hints

```dart
// ✅ Dengan Model - Type Safe
Product product = Product.fromJson(jsonData[0]);
String name = product.name; // Type safe, autocomplete works
int price = product.price; // Compiler tahu ini integer
String? brand = product.brand; // Jelas bahwa brand bisa null
```

**Dalam proyek ini**, saya membuat model `Product` yang memastikan:
- Semua field memiliki tipe yang benar
- Nullable fields ditangani dengan proper null-safety
- Mudah di-maintain jika struktur API berubah

---

### 2. Jelaskan fungsi package http dan CookieRequest dalam tugas ini! Jelaskan perbedaan peran http vs CookieRequest.

**Package http:**

Package `http` adalah package standar Flutter untuk melakukan HTTP requests (GET, POST, PUT, DELETE) ke web service.

**Fungsi:**
- Mengirim HTTP request ke server
- Menerima HTTP response dari server
- Mendukung berbagai HTTP methods (GET, POST, dll)
- Handling headers, body, dan query parameters

**Contoh penggunaan:**
```dart
import 'package:http/http.dart' as http;

final response = await http.get(
  Uri.parse('http://localhost:8000/json/')
);
```

**CookieRequest (dari pbp_django_auth):**

`CookieRequest` adalah custom class dari package `pbp_django_auth` yang extend fungsi `http` dengan menambahkan cookie management dan session handling.

**Fungsi:**
- Otomatis mengelola cookies (login session)
- Menyimpan authentication state
- Mengirim cookies di setiap request
- Menyediakan method `login()`, `logout()`, `get()`, `post()`, `postJson()`

**Contoh penggunaan:**
```dart
final request = context.watch<CookieRequest>();
final response = await request.login(
  "http://localhost:8000/auth/login/",
  {'username': username, 'password': password}
);
```

**Perbedaan Peran:**

| Aspek | http | CookieRequest |
|-------|------|---------------|
| **Session Management** | ❌ Tidak ada | ✅ Otomatis mengelola session |
| **Cookie Handling** | ⚠️ Manual | ✅ Otomatis menyimpan & kirim cookies |
| **Authentication State** | ❌ Tidak ada | ✅ Track login status (`loggedIn`) |
| **Use Case** | Public API tanpa auth | Aplikasi dengan login/authentication |
| **Complexity** | Simple, straightforward | Higher level abstraction |

**Dalam proyek ini:**
- `CookieRequest` digunakan untuk semua request yang memerlukan authentication
- Memastikan session user tetap terjaga di semua halaman
- Otomatis mengirim cookies Django CSRF dan session di setiap request

---

### 3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

**Alasan instance CookieRequest perlu dibagikan:**

**1. Konsistensi Session**

Session user harus konsisten di seluruh aplikasi. Jika setiap halaman membuat instance sendiri, maka:
- Login di satu halaman tidak akan dikenali di halaman lain
- Cookies tidak akan ter-share antar halaman
- User harus login berulang kali

**2. Centralized Authentication State**

Dengan satu instance global:
- Semua komponen tahu apakah user sudah login atau belum
- Perubahan authentication state (login/logout) langsung terefleksi di semua halaman
- Tidak ada inkonsistensi data authentication

**3. Memory Efficiency**

Satu instance yang di-share lebih efisien daripada membuat instance baru di setiap halaman:
- Mengurangi penggunaan memory
- Cookies disimpan sekali, digunakan berkali-kali

**4. State Management**

Menggunakan `Provider` untuk share instance memungkinkan:
- Reactive updates: Widget otomatis rebuild saat state berubah
- Global access: Semua widget bisa akses dengan `context.watch<CookieRequest>()`
- Clean architecture: Separation of concerns yang jelas

**Implementasi dalam proyek:**

```dart
// Di main.dart - Create provider di root level
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(...),
    );
  }
}

// Di setiap halaman - Akses instance yang sama
final request = context.watch<CookieRequest>();
```

Dengan cara ini:
- Login di halaman A → Session tersimpan
- Pindah ke halaman B → Session tetap ada
- Logout di halaman C → Semua halaman tahu user sudah logout

---

### 4. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

**Mekanisme Lengkap Pengiriman Data:**

**STEP 1: Input Data di Flutter**

User mengisi form di `ProductEntryFormPage`:
```dart
TextFormField(
  onChanged: (String? value) {
    setState(() {
      _name = value!;
    });
  },
)
```

Data disimpan dalam state variables (`_name`, `_price`, `_description`, dll)

---

**STEP 2: Validasi di Flutter**

Sebelum dikirim, data divalidasi menggunakan `Form` validator:
```dart
validator: (String? value) {
  if (value == null || value.isEmpty) {
    return "Nama produk tidak boleh kosong!";
  }
  return null;
}
```

---

**STEP 3: Convert ke JSON & Kirim ke Django**

Setelah validasi lolos, data di-convert ke JSON dan dikirim via POST request:
```dart
final response = await request.postJson(
  "http://127.0.0.1:8000/create-flutter/",
  jsonEncode(<String, String>{
    'name': _name,
    'price': _price.toString(),
    'description': _description,
    'category': _category,
    'thumbnail': _thumbnail,
    'stock': _stock.toString(),
    'brand': _brand,
    'is_featured': _isFeatured.toString(),
  }),
);
```

---

**STEP 4: Django Menerima & Proses Data**

Django view (`create_product_flutter`) menerima request:
```python
@csrf_exempt
def create_product_flutter(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        new_product = Product.objects.create(
            user=request.user,
            name=data["name"],
            price=int(data["price"]),
            description=data["description"],
            # ... field lainnya
        )
        new_product.save()
        return JsonResponse({"status": "success"}, status=200)
```

Data disimpan ke database PostgreSQL/SQLite.

---

**STEP 5: Django Kirim Response**

Django mengirim JSON response ke Flutter:
```python
return JsonResponse({"status": "success"}, status=200)
```

---

**STEP 6: Flutter Terima Response & Update UI**

Flutter menerima response dan update UI:
```dart
if (response['status'] == 'success') {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text("Produk baru berhasil disimpan!"))
  );
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => MyHomePage()),
  );
}
```

---

**STEP 7: Fetch & Display Data**

Untuk menampilkan data, Flutter fetch dari Django:
```dart
Future<List<Product>> fetchProduct(CookieRequest request) async {
  final response = await request.get('http://127.0.0.1:8000/json/');
  List<Product> listProduct = [];
  for (var d in response) {
    if (d != null) {
      listProduct.add(Product.fromJson(d));
    }
  }
  return listProduct;
}
```

---

**STEP 8: Render di UI menggunakan FutureBuilder**

```dart
FutureBuilder(
  future: fetchProduct(request),
  builder: (context, AsyncSnapshot snapshot) {
    if (snapshot.data == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return ListView.builder(
        itemCount: snapshot.data!.length,
        itemBuilder: (_, index) {
          return ProductCard(snapshot.data![index]);
        },
      );
    }
  },
)
```

**Flow Diagram:**
```
User Input → Validation → JSON Encode → HTTP POST 
    ↓
Django Receive → Process → Save to DB → JSON Response
    ↓
Flutter Receive → Parse Response → Update UI
    ↓
Fetch Data (GET) → JSON Response → Parse to Model → Display
```

---

### 5. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

**A. REGISTER (Pendaftaran Akun Baru)**

**STEP 1: Input Data di Flutter**

User mengisi form di `RegisterPage`:
```dart
TextFormField(
  controller: _usernameController,
  decoration: InputDecoration(labelText: 'Username'),
)
TextFormField(
  controller: _passwordController,
  decoration: InputDecoration(labelText: 'Password'),
  obscureText: true,
)
TextFormField(
  controller: _confirmPasswordController,
  decoration: InputDecoration(labelText: 'Confirm Password'),
  obscureText: true,
)
```

---

**STEP 2: Kirim ke Django**

Flutter mengirim data registrasi:
```dart
final response = await request.postJson(
  "http://127.0.0.1:8000/auth/register/",
  jsonEncode({
    "username": username,
    "password1": password1,
    "password2": password2,
  })
);
```

---

**STEP 3: Django Proses Registrasi**

Django view `register` memproses:
```python
@csrf_exempt
def register(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        username = data['username']
        password1 = data['password1']
        password2 = data['password2']

        # Validasi password match
        if password1 != password2:
            return JsonResponse({
                "status": False,
                "message": "Passwords do not match."
            }, status=400)
        
        # Cek username sudah ada atau belum
        if User.objects.filter(username=username).exists():
            return JsonResponse({
                "status": False,
                "message": "Username already exists."
            }, status=400)
        
        # Buat user baru
        user = User.objects.create_user(
            username=username, 
            password=password1
        )
        user.save()
        
        return JsonResponse({
            "username": user.username,
            "status": 'success',
            "message": "User created successfully!"
        }, status=200)
```

---

**STEP 4: Response & Redirect**

Flutter menerima response dan redirect ke login:
```dart
if (response['status'] == 'success') {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('Successfully registered!'))
  );
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const LoginPage()),
  );
}
```

---

**B. LOGIN (Masuk ke Aplikasi)**

**STEP 1: Input Credentials**

User memasukkan username dan password di `LoginPage`:
```dart
TextField(
  controller: _usernameController,
  decoration: InputDecoration(labelText: 'Username'),
)
TextField(
  controller: _passwordController,
  decoration: InputDecoration(labelText: 'Password'),
  obscureText: true,
)
```

---

**STEP 2: Kirim ke Django untuk Autentikasi**

Flutter mengirim credentials:
```dart
final response = await request.login(
  "http://127.0.0.1:8000/auth/login/",
  {
    'username': username,
    'password': password,
  }
);
```

---

**STEP 3: Django Autentikasi**

Django view `login` memverifikasi credentials:
```python
@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    
    # Autentikasi user
    user = authenticate(username=username, password=password)
    
    if user is not None:
        if user.is_active:
            # Login user & buat session
            auth_login(request, user)
            return JsonResponse({
                "username": user.username,
                "status": True,
                "message": "Login sukses!"
            }, status=200)
        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, akun dinonaktifkan."
            }, status=401)
    else:
        return JsonResponse({
            "status": False,
            "message": "Login gagal, periksa kembali email atau kata sandi."
        }, status=401)
```

**Yang Terjadi di Backend:**
- Django memverifikasi username & password dengan database
- Jika valid, Django membuat session dan mengirim cookies
- CookieRequest otomatis menyimpan cookies ini

---

**STEP 4: Flutter Simpan Session & Navigate**

Jika login sukses:
```dart
if (request.loggedIn) {
  String message = response['message'];
  String uname = response['username'];
  
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => MyHomePage()),
  );
  
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text("$message Selamat datang, $uname."))
  );
}
```

**Session Status:**
- `request.loggedIn` = `true`
- Cookies tersimpan di CookieRequest
- Semua request selanjutnya otomatis include cookies

---

**C. AUTHENTICATED REQUESTS (Request Setelah Login)**

Setelah login, semua request otomatis include authentication cookies:

```dart
// Fetch data produk - Otomatis include session cookies
final response = await request.get('http://127.0.0.1:8000/json/');

// Create produk - Otomatis include session cookies
final response = await request.postJson(
  "http://127.0.0.1:8000/create-flutter/",
  jsonEncode({...})
);
```

Django dapat mengidentifikasi user dari cookies:
```python
def create_product_flutter(request):
    # request.user otomatis terisi dari session cookies
    new_product = Product.objects.create(
        user=request.user,  # User yang sedang login
        name=data["name"],
        # ...
    )
```

---

**D. LOGOUT (Keluar dari Aplikasi)**

**STEP 1: Trigger Logout**

User menekan tombol logout:
```dart
if (item.name == "Logout") {
  final response = await request.logout(
    "http://127.0.0.1:8000/auth/logout/"
  );
}
```

---

**STEP 2: Django Hapus Session**

Django view `logout` menghapus session:
```python
@csrf_exempt
def logout(request):
    username = request.user.username
    try:
        auth_logout(request)  # Hapus session Django
        return JsonResponse({
            "username": username,
            "status": True,
            "message": "Logout berhasil!"
        }, status=200)
    except:
        return JsonResponse({
            "status": False,
            "message": "Logout gagal."
        }, status=401)
```

---

**STEP 3: Clear Cookies & Redirect**

Flutter clear cookies dan redirect ke login:
```dart
if (response['status']) {
  String message = response["message"];
  String uname = response["username"];
  
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text("$message Sampai jumpa, $uname."))
  );
  
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const LoginPage()),
  );
}
```

**Session Status:**
- `request.loggedIn` = `false`
- Cookies dihapus dari CookieRequest
- User kembali ke halaman login

---

**DIAGRAM FLOW AUTENTIKASI:**

```
REGISTER FLOW:
Flutter Input → POST /auth/register/ → Django Validate
→ Create User → Response Success → Redirect to Login

LOGIN FLOW:
Flutter Input → POST /auth/login/ → Django Authenticate
→ Create Session → Send Cookies → CookieRequest Save
→ Set loggedIn=true → Navigate to HomePage

AUTHENTICATED REQUEST FLOW:
Flutter Request → Include Cookies → Django Verify Session
→ Identify User (request.user) → Process Request → Response

LOGOUT FLOW:
Flutter Logout Button → POST /auth/logout/ → Django Clear Session
→ Response Success → CookieRequest Clear Cookies
→ Set loggedIn=false → Navigate to LoginPage
```

---

**Keseluruhan Mekanisme:**

1. **Register**: User membuat akun baru → Django simpan ke database
2. **Login**: User masukkan credentials → Django verifikasi → Buat session & cookies → Flutter simpan cookies
3. **Authenticated State**: Semua request dari Flutter otomatis include cookies → Django tahu siapa user yang sedang login
4. **Logout**: User logout → Django hapus session → Flutter hapus cookies → Kembali ke login page

**Keamanan yang Diterapkan:**
- Password di-hash di Django (tidak disimpan plain text)
- Session cookies untuk maintain authentication
- CSRF protection dengan `@csrf_exempt` di view yang perlu
- CORS configuration untuk allow Flutter domain

---

### 6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

**Implementasi Tutorial 8 Step-by-Step:**

---

**STEP 1: Setup Django Backend - Authentication**

**1.1 Install Django CORS Headers**
```bash
pip install django-cors-headers
```

**1.2 Update `settings.py`**

Tambahkan di `INSTALLED_APPS`:
```python
INSTALLED_APPS = [
    ...
    'corsheaders',
    'authentication',
]
```

Tambahkan di `MIDDLEWARE`:
```python
MIDDLEWARE = [
    'corsheaders.middleware.CorsMiddleware',
    ...
]
```

Tambahkan CORS settings:
```python
CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True
CSRF_COOKIE_SECURE = True
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SAMESITE = 'None'
SESSION_COOKIE_SAMESITE = 'None'
```

**1.3 Buat App Authentication**
```bash
python manage.py startapp authentication
```

**1.4 Buat Views untuk Login, Register, Logout**

Di `authentication/views.py`:
```python
from django.contrib.auth import authenticate, login as auth_login, logout as auth_logout
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.models import User
import json

@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        if user.is_active:
            auth_login(request, user)
            return JsonResponse({
                "username": user.username,
                "status": True,
                "message": "Login sukses!"
            }, status=200)
    return JsonResponse({
        "status": False,
        "message": "Login gagal, periksa kembali email atau kata sandi."
    }, status=401)

@csrf_exempt
def register(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        username = data['username']
        password1 = data['password1']
        password2 = data['password2']
        
        if password1 != password2:
            return JsonResponse({"status": False, "message": "Passwords do not match."}, status=400)
        
        if User.objects.filter(username=username).exists():
            return JsonResponse({"status": False, "message": "Username already exists."}, status=400)
        
        user = User.objects.create_user(username=username, password=password1)
        user.save()
        
        return JsonResponse({"username": user.username, "status": 'success', "message": "User created successfully!"}, status=200)

@csrf_exempt
def logout(request):
    username = request.user.username
    try:
        auth_logout(request)
        return JsonResponse({"username": username, "status": True, "message": "Logout berhasil!"}, status=200)
    except:
        return JsonResponse({"status": False, "message": "Logout gagal."}, status=401)
```

**1.5 Setup URL Routing**

Buat `authentication/urls.py`:
```python
from django.urls import path
from authentication.views import login, register, logout

app_name = 'authentication'

urlpatterns = [
    path('login/', login, name='login'),
    path('register/', register, name='register'),
    path('logout/', logout, name='logout'),
]
```

Update `BolaBelishop/urls.py`:
```python
urlpatterns = [
    ...
    path('auth/', include('authentication.urls')),
]
```

**1.6 Buat Endpoint untuk Flutter**

Di `main/views.py`, tambahkan:
```python
@csrf_exempt
def create_product_flutter(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        new_product = Product.objects.create(
            user=request.user,
            name=data["name"],
            price=int(data["price"]),
            description=data["description"],
            category=data["category"],
            thumbnail=data.get("thumbnail", ""),
            stock=int(data.get("stock", 0)),
            brand=data.get("brand", ""),
            is_featured=data["is_featured"].lower() == 'true'
        )
        new_product.save()
        return JsonResponse({"status": "success"}, status=200)
    return JsonResponse({"status": "error"}, status=401)
```

Update `main/urls.py`:
```python
urlpatterns = [
    ...
    path('create-flutter/', create_product_flutter, name='create_product_flutter'),
]
```

---

**STEP 2: Setup Flutter Frontend - Install Packages**

**2.1 Install Required Packages**
```bash
flutter pub add provider
flutter pub add pbp_django_auth
```

**2.2 Update `main.dart` dengan Provider**
```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:bolabelishopmobile/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'BolaBelishop',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.deepPurple,
          ).copyWith(secondary: Colors.deepPurple[400]),
        ),
        home: const LoginPage(),
      ),
    );
  }
}
```

---

**STEP 3: Implementasi Fitur Registrasi Akun**

**3.1 Buat `lib/screens/register.dart`**
```dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:bolabelishopmobile/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  const Text('Register', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(labelText: 'Username', border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
                    obscureText: true,
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration: const InputDecoration(labelText: 'Confirm Password', border: OutlineInputBorder()),
                    obscureText: true,
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () async {
                      String username = _usernameController.text;
                      String password1 = _passwordController.text;
                      String password2 = _confirmPasswordController.text;

                      final response = await request.postJson(
                        "http://127.0.0.1:8000/auth/register/",
                        jsonEncode({"username": username, "password1": password1, "password2": password2}),
                      );
                      if (context.mounted) {
                        if (response['status'] == 'success') {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Successfully registered!')));
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response['message'])));
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    child: const Text('Register'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

---

**STEP 4: Membuat Halaman Login**

**4.1 Buat `lib/screens/login.dart`**
```dart
import 'package:bolabelishopmobile/menu.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:bolabelishopmobile/screens/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Text('Login', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 30.0),
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(labelText: 'Username', border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 12.0),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
                    obscureText: true,
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () async {
                      String username = _usernameController.text;
                      String password = _passwordController.text;

                      final response = await request.login("http://127.0.0.1:8000/auth/login/", {
                        'username': username,
                        'password': password,
                      });

                      if (request.loggedIn) {
                        String message = response['message'];
                        String uname = response['username'];
                        if (context.mounted) {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$message Selamat datang, $uname.")));
                        }
                      } else {
                        if (context.mounted) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Login Gagal'),
                              content: Text(response['message']),
                              actions: [TextButton(child: const Text('OK'), onPressed: () => Navigator.pop(context))],
                            ),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 36.0),
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage())),
                    child: Text("Don't have an account? Register", style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 16.0)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

---

**STEP 5: Mengintegrasikan Sistem Autentikasi Django dengan Flutter**

Sudah terimplementasi di step 3 dan 4 dengan menggunakan:
- `CookieRequest` untuk handle authentication state
- `request.login()` untuk login
- `request.loggedIn` untuk check status login
- Provider untuk share instance ke seluruh app

---

**STEP 6: Membuat Model Kustom Sesuai Proyek Django**

**6.1 Buat `lib/models/product_entry.dart`**
```dart
import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    String id;
    String name;
    int price;
    String description;
    String category;
    String? thumbnail;
    bool isFeatured;
    int stock;
    String? brand;
    DateTime createdAt;
    int productViews;
    int? userId;
    String? username;

    Product({
        required this.id,
        required this.name,
        required this.price,
        required this.description,
        required this.category,
        this.thumbnail,
        required this.isFeatured,
        required this.stock,
        this.brand,
        required this.createdAt,
        required this.productViews,
        this.userId,
        this.username,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        isFeatured: json["is_featured"],
        stock: json["stock"],
        brand: json["brand"],
        createdAt: DateTime.parse(json["created_at"]),
        productViews: json["product_views"],
        userId: json["user_id"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "category": category,
        "thumbnail": thumbnail,
        "is_featured": isFeatured,
        "stock": stock,
        "brand": brand,
        "created_at": createdAt.toIso8601String(),
        "product_views": productViews,
        "user_id": userId,
        "username": username,
    };
}
```

---

**STEP 7: Membuat Halaman Daftar Item dari Endpoint JSON Django**

**7.1 Buat `lib/screens/list_productentry.dart`**
```dart
import 'package:flutter/material.dart';
import 'package:bolabelishopmobile/models/product_entry.dart';
import 'package:bolabelishopmobile/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:bolabelishopmobile/screens/product_detail.dart';

class ProductEntryPage extends StatefulWidget {
  const ProductEntryPage({super.key});

  @override
  State<ProductEntryPage> createState() => _ProductEntryPageState();
}

class _ProductEntryPageState extends State<ProductEntryPage> {
  Future<List<Product>> fetchProduct(CookieRequest request) async {
    final response = await request.get('http://127.0.0.1:8000/json/');
    var data = response;
    List<Product> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(Product.fromJson(d));
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(title: const Text('Product List')),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProduct(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text('Belum ada produk pada BolaBelishop.', style: TextStyle(fontSize: 20, color: Color(0xff59A5D8))),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) {
                  var product = snapshot.data![index];
                  return InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(product: product))),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 2, blurRadius: 5, offset: const Offset(0, 3))],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product.name, style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 10),
                          Text("Harga: Rp ${product.price}"),
                          const SizedBox(height: 10),
                          Text("Kategori: ${product.category}"),
                          const SizedBox(height: 10),
                          Text(product.description, maxLines: 2, overflow: TextOverflow.ellipsis),
                          const SizedBox(height: 10),
                          if (product.isFeatured)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(8)),
                              child: const Text('Featured', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
```

---

**STEP 8: Membuat Halaman Detail untuk Setiap Item**

**8.1 Buat `lib/screens/product_detail.dart`**
```dart
import 'package:flutter/material.dart';
import 'package:bolabelishopmobile/models/product_entry.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (product.thumbnail != null && product.thumbnail!.isNotEmpty)
              Center(
                child: Image.network(
                  product.thumbnail!,
                  height: 250,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 250,
                      color: Colors.grey[300],
                      child: const Icon(Icons.image_not_supported, size: 100, color: Colors.grey),
                    );
                  },
                ),
              ),
            const SizedBox(height: 20),
            Text(product.name, style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text("Rp ${product.price}", style: const TextStyle(fontSize: 20.0, color: Colors.green, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              children: [
                Chip(label: Text(product.category), backgroundColor: Colors.blue[100]),
                const SizedBox(width: 10),
                if (product.isFeatured) const Chip(label: Text('Featured'), backgroundColor: Colors.amber),
              ],
            ),
            const SizedBox(height: 20),
            const Text("Description:", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(product.description, style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 10),
            _buildInfoRow("Stock", "${product.stock}"),
            if (product.brand != null && product.brand!.isNotEmpty) _buildInfoRow("Brand", product.brand!),
            _buildInfoRow("Views", "${product.productViews}"),
            if (product.username != null) _buildInfoRow("Seller", product.username!),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: const Text('Back to List', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text("$label:", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
          ),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 16.0))),
        ],
      ),
    );
  }
}
```

---

**STEP 9: Melakukan Filter pada Halaman Daftar Item**

Filter item berdasarkan user yang login sudah terimplementasi di Django endpoint `/json/`:

Di `main/views.py`, modifikasi `show_json`:
```python
def show_json(request):
    # Filter hanya produk milik user yang login
    product_list = Product.objects.filter(user=request.user)
    data = [
        {
            'id': str(product.id),
            'name': product.name,
            # ... field lainnya
        }
        for product in product_list
    ]
    return JsonResponse(data, safe=False)
```

Untuk menampilkan semua produk atau hanya milik user, bisa tambahkan query parameter:
```python
def show_json(request):
    filter_type = request.GET.get("filter", "all")
    
    if filter_type == "my":
        product_list = Product.objects.filter(user=request.user)
    else:
        product_list = Product.objects.all()
    
    # ... rest of code
```

Di Flutter, untuk fetch dengan filter:
```dart
// Fetch semua produk
final response = await request.get('http://127.0.0.1:8000/json/?filter=all');

// Fetch produk user saja
final response = await request.get('http://127.0.0.1:8000/json/?filter=my');
```

---

**STEP 10: Update Navigation & Integration**

**10.1 Update `lib/menu.dart`**

Tambahkan navigasi ke list produk:
```dart
final List<ItemHomepage> items = [
  ItemHomepage("Lihat Daftar Produk", Icons.shopping_bag, Colors.blue),
  ItemHomepage("Tambah Produk", Icons.add_box, Colors.green),
  ItemHomepage("Logout", Icons.logout, Colors.red),
];

// Di onTap ItemCard
if (item.name == "Lihat Daftar Produk") {
  Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductEntryPage()));
} else if (item.name == "Logout") {
  final response = await request.logout("http://127.0.0.1:8000/auth/logout/");
  // Handle logout response
}
```

**10.2 Update `lib/widgets/left_drawer.dart`**

Tambahkan menu untuk list produk:
```dart
ListTile(
  leading: const Icon(Icons.shopping_bag),
  title: const Text('Daftar Produk'),
  onTap: () {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductEntryPage()));
  },
),
```

**10.3 Update `lib/screens/productentry_form.dart`**

Integrasikan dengan Django untuk create product:
```dart
final response = await request.postJson(
  "http://127.0.0.1:8000/create-flutter/",
  jsonEncode(<String, String>{
    'name': _name,
    'price': _price.toString(),
    'description': _description,
    'category': _category,
    'thumbnail': _thumbnail,
    'stock': _stock.toString(),
    'brand': _brand,
    'is_featured': _isFeatured.toString(),
  }),
);

if (context.mounted) {
  if (response['status'] == 'success') {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Produk baru berhasil disimpan!")));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }
}
```
</details>


<div align="center">
  <b>⚽ bolabelishop - Your Football Product Marketplace ⚽</b>
  <br>
  Made with ❤️ using Flutter
</div>
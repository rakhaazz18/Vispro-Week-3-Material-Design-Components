Andi Muhammad Rakha Zulkarnain
0806022410019

MDC-101: Material Components (Flutter) Basics
Di step pertama ini, kita diajar mengenai dasar penggunaan Material Design Components di Flutter untuk membuat UI (user interface) yang konsisten dengan prinsip desain material,dengan tujuan utamanya yaitu memahami struktur dasar aplikasi Flutter dengan Scaffold, AppBar, Text, dan Button.Hasil akhirnya adalah tampilan halaman sederhana yang mengikuti tema warna dari MDC - 101 ini

MDC-102: Material Structure and Layout
Pada bagian kedua ini,pengguna mempelajari bagaimana mengatur tata letak aplikasi dengan menggunakan layout widgets seperti Column, Row, GridView, dan Card. Konsep responsive design juga diperkenalkan agar tampilan tetap proporsional di berbagai ukuran layar. Hasil akhirnya adalah tampilan aplikasi yang lebih terstruktur, rapi, dan responsif dengan hierarki visual yang jelas.

MDC-103: Material Theming with Color, Shape, Elevation, and Type
Modul ini berfokus pada kustomisasi tampilan aplikasi melalui Material Theming. Pengguna belajar mengubah warna utama, bentuk tombol, elevasi, dan tipografi menggunakan ThemeData dan ColorScheme. Tujuannya adalah membuat aplikasi memiliki identitas visual unik namun tetap sesuai pedoman Material Design.

MDC-104: Advanced Material Components
Bagian terakhir ini memperkenalkan komponen Material lanjutan seperti TabBar, BottomNavigationBar, SliverAppBar, dan transition animations. Fokusnya adalah meningkatkan pengalaman pengguna (UX) melalui navigasi yang intuitif dan animasi halus. Hasil akhirnya adalah aplikasi yang lebih kompleks, interaktif, dan siap untuk dikembangkan menjadi proyek nyata.

<<<<<<< HEAD
For help getting started with Flutter, view our online
[documentation](https://flutter.io/).

## Reflection Report

This project refactors the original Material Design Codelab demo into a small shopping app with structured, named-route navigation and Android deep linking.

- Navigation structure: I configured `MaterialApp` with named routes for the main screens (`/`, `/product`, `/cart`, `/about`, `/login`). A `navigatorKey` is used so the app can programmatically navigate when a deep link arrives. The `Backdrop` widget remains the home scaffold and exposes a drawer to switch between Home, Cart and About.
- Passing data: The `/product` route accepts an `int` argument (product ID). The `ProductDetailScreen` reads the `productId` from `ModalRoute.of(context)!.settings.arguments` and looks up the product using `ProductsRepository.findById`.
- Deep linking (Android): I added an Android `intent-filter` for the custom scheme `shopmate` and host `product` in `android/app/src/main/AndroidManifest.xml`. Instead of relying on the `uni_links` plugin, this project implements a lightweight platform bridge: `MainActivity.kt` exposes a `MethodChannel` (`app.channel.shared.data`) that answers `getInitialLink` and forwards runtime intents via `onNewIntent`. Dart listens on the same `MethodChannel`, parses the URI, and navigates to `/product` by passing the numeric product ID as the route argument.

Technical challenges and solutions

- Handling links reliably: deep links can arrive when the app is cold-started or while running. I used `getInitialUri()` to catch cold starts and `uriLinkStream` to handle runtime links, and centralized navigation through a `navigatorKey` to route from outside widget build contexts.
- Missing product lookup: the original repo had `ProductsRepository.loadProducts` but no helper to fetch a single product. I added `ProductsRepository.findById` which returns `null` if not found, and the detail screen shows a friendly "Product not found" message for invalid IDs.

Usability benefits of deep linking

Deep linking improves discoverability and UX by allowing direct navigation to specific content from external sources (notifications, web pages, QR codes). Users can open a product directly, reducing friction and increasing conversion potential.

Next feature I'd add

I would add persistent cart state and shareable web URLs (universal links) so cart contents and product pages are bookmarkable and sync across devices.

## Testing instructions (Android)

1. Install dependencies and build the app:

```bash
flutter pub get
flutter build apk
```

2. Install/run the app on an Android device or emulator and trigger a deep link with `adb`:

```bash
# install or run the app first (choose one)
flutter install
# or
flutter run -d <device-id>

# then trigger the deep link (replace package name with your applicationId)
adb shell am start -a android.intent.action.VIEW -d "shopmate://product/2" com.example.shrine
```

Replace `com.example.shrine` with your `applicationId` if you changed it (see `android/app/build.gradle.kts`). The app should open and show the product detail for product ID 2. If the ID is invalid, the app shows "Product not found".

If the emulator has GPU/OpenGL issues, launch it with software rendering and wipe data:

```bash
emulator -avd <AVD_NAME> -wipe-data -gpu swiftshader_indirect
```

Wait for the emulator to fully boot (`adb devices` shows `device`) before running the `adb shell am start` test.

## Notes

- Deep linking is implemented using an Android `intent-filter` and a lightweight `MethodChannel` bridge in `MainActivity.kt` (no `uni_links` dependency in the current code). Dart requests the initial intent via `getInitialLink` over the channel and listens for runtime `newLink` events.
- I added `lib/product_detail.dart`, `lib/cart.dart`, and `lib/about.dart`. The About screen includes a "Test deep link → product/2" button that simulates the deep link when running in Chrome.
- Screenshot: add a screenshot of a successful deep-link test at `assets/screenshots/deep_link_chrome.png`. If you provide that image (or allow me to add it), I will commit it and update this README to embed it.

=======
>>>>>>> 62b7e02083bf127ddca2791d2343df5852d2b763

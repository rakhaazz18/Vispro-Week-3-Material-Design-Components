// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'colors.dart' as shrine_colors;
import 'home.dart';
import 'login.dart';
import 'supplemental/cut_corners_border.dart';
import 'backdrop.dart';
import 'model/product.dart';
import 'supplemental/category_menu_page.dart';
import 'product_detail.dart';
import 'cart.dart';
import 'about.dart';


// TODO: Convert ShrineApp to stateful widget (104)
class ShrineApp extends StatefulWidget {
  const ShrineApp({Key? key}) : super(key: key);

  @override
  State<ShrineApp> createState() => _ShrineAppState();
}

class _ShrineAppState extends State<ShrineApp> {
  Category _currentCategory = Category.all;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  static const MethodChannel _channel = MethodChannel('app.channel.shared.data');
  StreamSubscription? _sub; // not used but keep for compatibility

  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      title: 'ShopMate',
      initialRoute: '/',
      routes: {
        '/login': (BuildContext context) => const LoginPage(),
        '/': (BuildContext context) => Backdrop(
              currentCategory: _currentCategory,
              frontLayer: HomePage(category: _currentCategory),
              backLayer: CategoryMenuPage(
                currentCategory: _currentCategory,
                onCategoryTap: _onCategoryTap,
              ),
              frontTitle: const Text('FUNKYFIT'),
              backTitle: const Text('MENU'),
            ),
        '/cart': (BuildContext context) => const CartScreen(),
        '/about': (BuildContext context) => const AboutScreen(),
        '/product': (BuildContext context) {
          final args = ModalRoute.of(context)!.settings.arguments;
          return ProductDetailScreen(productId: args is int ? args : int.tryParse(args?.toString() ?? '') );
        },
      },
      theme: _kShrineTheme,
    );
  }

  @override
  void initState() {
    super.initState();
    // Handle initial link if app was cold-started from a deep link
    _initPlatformLinks();
  }
  Future<void> _initPlatformLinks() async {
    // Listen for method channel calls from Android MainActivity
    _channel.setMethodCallHandler((call) async {
      if (call.method == 'initialLink' || call.method == 'newLink') {
        final String? uriString = call.arguments as String?;
        if (uriString != null) _handleIncomingUri(Uri.parse(uriString));
      }
      return null;
    });

    // Try to get initial link synchronously if possible
    try {
      final initial = await _channel.invokeMethod<String>('getInitialLink');
      if (initial != null) _handleIncomingUri(Uri.parse(initial));
    } catch (_) {}
  }

  void _handleIncomingUri(Uri uri) {
    if (uri.host == 'product') {
      final idSegment = uri.pathSegments.isNotEmpty ? uri.pathSegments[0] : null;
      final id = idSegment != null ? int.tryParse(idSegment) : null;
      if (id != null) {
        _navigatorKey.currentState?.pushNamed('/product', arguments: id);
      }
    }
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}

// TODO: Build a Shrine Theme (103)
final ThemeData _kShrineTheme = _buildShrineTheme();

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.dark(useMaterial3: true);
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: shrine_colors.kLuxuryGold,
      onPrimary: shrine_colors.kLuxuryBlack,
      secondary: shrine_colors.kLuxuryGoldDark,
      error: shrine_colors.kShrineErrorRed,
      surface: shrine_colors.kLuxuryGray,
      onSurface: shrine_colors.kLuxuryWhite,
    ),
    scaffoldBackgroundColor: shrine_colors.kLuxuryBlack,
    textTheme: _buildShrineTextTheme(base.textTheme),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: shrine_colors.kLuxuryGold.withAlpha(77),
      cursorColor: shrine_colors.kLuxuryGold,
    ),
    appBarTheme: const AppBarTheme(
      foregroundColor: shrine_colors.kLuxuryWhite,
      backgroundColor: shrine_colors.kLuxuryBlack,
      elevation: 0,
      iconTheme: IconThemeData(color: shrine_colors.kLuxuryWhite),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: CutCornersBorder(),
      focusedBorder: CutCornersBorder(
        borderSide: BorderSide(
          width: 2.0,
          color: shrine_colors.kLuxuryGold,
        ),
      ),
      floatingLabelStyle: TextStyle(
        color: shrine_colors.kLuxuryGold,
      ),
    ),
    cardTheme: CardThemeData(
      color: shrine_colors.kLuxuryGray,
      elevation: 4,
      shadowColor: Colors.black.withAlpha(128),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
        backgroundColor: shrine_colors.kLuxuryGold,
        foregroundColor: shrine_colors.kLuxuryBlack,
        elevation: 4,
        shadowColor: shrine_colors.kLuxuryGold.withAlpha(77),
      ),
    ),
  );
}

// TODO: Build a Shrine Text Theme (103)
TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        headlineSmall: base.headlineSmall!.copyWith(
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0,
          color: shrine_colors.kLuxuryGold,
        ),
        titleLarge: base.titleLarge!.copyWith(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
          color: shrine_colors.kLuxuryGold,
        ),
        titleMedium: base.titleMedium!.copyWith(
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          color: shrine_colors.kLuxuryWhite,
        ),
        titleSmall: base.titleSmall!.copyWith(
          fontWeight: FontWeight.w400,
          color: shrine_colors.kLuxuryWhite,
        ),
        bodySmall: base.bodySmall!.copyWith(
          fontWeight: FontWeight.w300,
          fontSize: 14.0,
          color: shrine_colors.kLuxuryWhite.withAlpha(179),
        ),
        bodyLarge: base.bodyLarge!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 18.0,
          letterSpacing: 0.5,
          color: shrine_colors.kLuxuryWhite,
        ),
        bodyMedium: base.bodyMedium!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 15.0,
          color: shrine_colors.kLuxuryGold,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: shrine_colors.kLuxuryWhite,
        bodyColor: shrine_colors.kLuxuryWhite,
      );
}

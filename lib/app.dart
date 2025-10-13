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
import 'colors.dart' as shrine_colors;
import 'home.dart';
import 'login.dart';
import 'supplemental/cut_corners_border.dart';
import 'backdrop.dart';
import 'model/product.dart';
import 'supplemental/category_menu_page.dart';


// TODO: Convert ShrineApp to stateful widget (104)
class ShrineApp extends StatefulWidget {
  const ShrineApp({Key? key}) : super(key: key);

  @override
  State<ShrineApp> createState() => _ShrineAppState();
}

class _ShrineAppState extends State<ShrineApp> {
  Category _currentCategory = Category.all;

  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => const LoginPage(),
        // TODO: Change to a Backdrop with a HomePage frontLayer (104)
        '/': (BuildContext context) => Backdrop(
              // TODO: Make currentCategory field take _currentCategory (104)
              currentCategory: _currentCategory,
              // TODO: Pass _currentCategory for frontLayer (104)
              frontLayer: HomePage(category: _currentCategory),
              // TODO: Change backLayer field value to CategoryMenuPage (104)
              backLayer: CategoryMenuPage(
                currentCategory: _currentCategory,
                onCategoryTap: _onCategoryTap,
              ),
              frontTitle: const Text('FUNKYFIT'),
              backTitle: const Text('MENU'),
            ),

          },
      // TODO: Customize the theme (103)
      theme: _kShrineTheme, // New code
    );
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
      background: shrine_colors.kLuxuryBlack,
      onBackground: shrine_colors.kLuxuryWhite,
      onSurface: shrine_colors.kLuxuryWhite,
    ),
    scaffoldBackgroundColor: shrine_colors.kLuxuryBlack,
    textTheme: _buildShrineTextTheme(base.textTheme),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: shrine_colors.kLuxuryGold.withOpacity(0.3),
      cursorColor: shrine_colors.kLuxuryGold,
    ),
    appBarTheme: const AppBarTheme(
      foregroundColor: shrine_colors.kLuxuryWhite,
      backgroundColor: shrine_colors.kLuxuryBlack,
      elevation: 0,
      iconTheme: IconThemeData(color: shrine_colors.kLuxuryWhite),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: const CutCornersBorder(),
      focusedBorder: CutCornersBorder(
        borderSide: BorderSide(
          width: 2.0,
          color: shrine_colors.kLuxuryGold,
        ),
      ),
      floatingLabelStyle: const TextStyle(
        color: shrine_colors.kLuxuryGold,
      ),
    ),
    cardTheme: CardThemeData(
      color: shrine_colors.kLuxuryGray,
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: shrine_colors.kLuxuryGold,
        foregroundColor: shrine_colors.kLuxuryBlack,
        elevation: 4,
        shadowColor: shrine_colors.kLuxuryGold.withOpacity(0.3),
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
          color: shrine_colors.kLuxuryWhite.withOpacity(0.7),
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

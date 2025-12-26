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

// Luxury Black & Gold Colors
const kLuxuryBlack = Color(0xFF0A0A0A);
const kLuxuryGold = Color(0xFFD4AF37);
const kLuxuryWhite = Color(0xFFFFFFFF);
const kLuxuryGray = Color(0xFF1A1A1A);

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // TODO: Add text editing controllers (101)
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLuxuryBlack,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          children: <Widget>[
            const SizedBox(height: 60.0),
            Column(
              children: <Widget>[
                // Logo dengan border gold
                Container(
                  padding: const EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    color: kLuxuryGray,
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(
                      color: kLuxuryGold,
                      width: 2.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: kLuxuryGold.withAlpha(77),
                        blurRadius: 20.0,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/Img Logo/Logo FunkyFit.png', 
                    height: 80
                  ),
                ),
                const SizedBox(height: 24.0),
                Text(
                  'FUNKYFIT',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    letterSpacing: 4.0,
                    fontWeight: FontWeight.bold,
                    color: kLuxuryGold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 80.0),
            // Username field
            TextField(
              controller: _usernameController,
              style: const TextStyle(color: kLuxuryWhite, fontSize: 15.0),
              decoration: InputDecoration(
                filled: true,
                fillColor: kLuxuryGray,
                labelText: 'Username',
                labelStyle: TextStyle(
                  color: kLuxuryWhite.withAlpha(153),
                  fontWeight: FontWeight.w300,
                  letterSpacing: 0.5,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: kLuxuryGray),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: kLuxuryGray, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: kLuxuryGold, width: 2.0),
                ),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 18.0),
              ),
            ),
            const SizedBox(height: 16.0),
            // Password field
            TextField(
              controller: _passwordController,
              obscureText: true,
              style: const TextStyle(color: kLuxuryWhite, fontSize: 15.0),
              decoration: InputDecoration(
                filled: true,
                fillColor: kLuxuryGray,
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: kLuxuryWhite.withAlpha(153),
                  fontWeight: FontWeight.w300,
                  letterSpacing: 0.5,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: kLuxuryGray),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: kLuxuryGray, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: kLuxuryGold, width: 2.0),
                ),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 18.0),
              ),
            ),
            const SizedBox(height: 32.0),
            // TODO: Add button bar (101)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // TODO: Add buttons (101)
                // TODO: Add buttons (101)
                TextButton(
                  child: const Text(
                    'CANCEL',
                    style: TextStyle(
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onPressed: () {
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: kLuxuryWhite.withAlpha(179),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, 
                      vertical: 12.0
                    ),
                  ),
                ),

                // TODO: Add an elevation to NEXT (103)
                // TODO: Add a beveled rectangular border to NEXT (103)
                Expanded(
                  child: ElevatedButton(
                    child: const Text(
                      'SIGN IN',
                      style: TextStyle(
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                        color: kLuxuryBlack,
                      ),
                    ),
                    onPressed: () {
                      // TODO: Show the next page (101)
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: kLuxuryBlack,
                      backgroundColor: kLuxuryGold,
                      elevation: 6.0,
                      shadowColor: kLuxuryGold.withAlpha(128),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

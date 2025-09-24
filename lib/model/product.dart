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

enum Category {
  all,
  accessories,
  clothing,
  home,
}

class Product {
  const Product({
    required this.category,
    required this.id,
    required this.isFeatured,
    required this.name,
    required this.price,
  });

  final Category category;
  final int id;
  final bool isFeatured;
  final String name;
  final int price;

  String get assetName {
    // List of image names from Img Product folder
    final imageNames = [
      'Agus.jpg', // id 0
      'Andi.jpg', // id 1
      'Arasu.jpg', // id 2
      'Aris.png', // id 3
      'Aristo.jpg', // id 4
      'Arjun.jpg', // id 5
      'Bayu.jpg', // id 6
      'Budi.jpg', // id 7
      'Dedi.jpg', // id 8
      'Dewi.jpg', // id 9
      'Dian.jpg', // id 10
      'Doni.jpg', // id 11
      'Eko.jpg', // id 12
      'Fadly.png', // id 13
      'Faiz.jpg', // id 14
      'Fajar.jpg', // id 15
      'Gladys.jpg', // id 16
      'Hadi.jpg', // id 17
      'Jami.jpg', // id 18
      'Joko.jpg', // id 19
      'Komeng.jpg', // id 20
      'Lia.jpg', // id 21
      'Lina.jpg', // id 22
      'Maya.jpg', // id 23
      'Mega.png', // id 24
      'Nagita.jpg', // id 25
      'Nita.jpg', // id 26
      'Rafi.jpg', // id 27
      'Rina.jpg', // id 28
      'Rini.jpg', // id 29
      'Risa.jpg', // id 30
      'Rossi.jpg', // id 31
      'Rudi.jpg', // id 32
      'Sari.jpg', // id 33
      'Sassy.jpg', // id 34
      'Siti.jpg', // id 35
      'uya kuya.jpg', // id 36
      'Yuni.jpg', // id 37
    ];

    if (id < imageNames.length) {
      return 'assets/Img Product/${imageNames[id]}';
    }
    return 'assets/Img Product/Agus.jpg'; // fallback
  }

  String? get assetPackage => null; // Use local assets instead of package

  @override
  String toString() => "$name (id=$id)";
}

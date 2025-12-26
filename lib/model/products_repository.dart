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

import 'product.dart';

class ProductsRepository {
  static List<Product> loadProducts(Category category) {
    const allProducts = <Product>[
      Product(
        category: Category.accessories,
        id: 0,
        isFeatured: true,
        name: 'Agus Sumedang',
        price: 50000,
      ),
      Product(
        category: Category.accessories,
        id: 1,
        isFeatured: true,
        name: 'Andi Jakarta',
        price: 75000,
      ),
      Product(
        category: Category.accessories,
        id: 2,
        isFeatured: false,
        name: 'Arasu Bandung',
        price: 45000,
      ),
      Product(
        category: Category.accessories,
        id: 3,
        isFeatured: true,
        name: 'Aris Bogor',
        price: 60000,
      ),
      Product(
        category: Category.accessories,
        id: 4,
        isFeatured: false,
        name: 'Aristo Bekasi',
        price: 55000,
      ),
      Product(
        category: Category.accessories,
        id: 5,
        isFeatured: false,
        name: 'Arjun Depok',
        price: 40000,
      ),
      Product(
        category: Category.accessories,
        id: 6,
        isFeatured: false,
        name: 'Bayu Cirebon',
        price: 35000,
      ),
      Product(
        category: Category.accessories,
        id: 7,
        isFeatured: true,
        name: 'Budi Tangerang',
        price: 70000,
      ),
      Product(
        category: Category.accessories,
        id: 8,
        isFeatured: true,
        name: 'Dedi Yogya',
        price: 80000,
      ),
      Product(
        category: Category.home,
        id: 9,
        isFeatured: true,
        name: 'Dewi Solo',
        price: 65000,
      ),
      Product(
        category: Category.home,
        id: 10,
        isFeatured: false,
        name: 'Dian Semarang',
        price: 42000,
      ),
      Product(
        category: Category.home,
        id: 11,
        isFeatured: false,
        name: 'Doni Malang',
        price: 48000,
      ),
      Product(
        category: Category.home,
        id: 12,
        isFeatured: false,
        name: 'Eko Surabaya',
        price: 52000,
      ),
      Product(
        category: Category.home,
        id: 13,
        isFeatured: true,
        name: 'Fadly Medan',
        price: 38000,
      ),
      Product(
        category: Category.home,
        id: 14,
        isFeatured: true,
        name: 'Faiz Palembang',
        price: 45000,
      ),
      Product(
        category: Category.home,
        id: 15,
        isFeatured: true,
        name: 'Fajar Makassar',
        price: 35000,
      ),
      Product(
        category: Category.home,
        id: 16,
        isFeatured: true,
        name: 'Gladys Bali',
        price: 40000,
      ),
      Product(
        category: Category.home,
        id: 17,
        isFeatured: false,
        name: 'Hadi Pontianak',
        price: 85000,
      ),
      Product(
        category: Category.home,
        id: 18,
        isFeatured: true,
        name: 'Jami Batam',
        price: 58000,
      ),
      Product(
        category: Category.clothing,
        id: 19,
        isFeatured: false,
        name: 'Joko Manado',
        price: 47000,
      ),
      Product(
        category: Category.clothing,
        id: 20,
        isFeatured: false,
        name: 'Komeng Pekanbaru',
        price: 46000,
      ),
      Product(
        category: Category.clothing,
        id: 21,
        isFeatured: false,
        name: 'Lia Jambi',
        price: 43000,
      ),
      Product(
        category: Category.clothing,
        id: 22,
        isFeatured: false,
        name: 'Lina Padang',
        price: 67000,
      ),
      Product(
        category: Category.clothing,
        id: 23,
        isFeatured: false,
        name: 'Maya Lampung',
        price: 68000,
      ),
      Product(
        category: Category.clothing,
        id: 24,
        isFeatured: true,
        name: 'Mega Banjarmasin',
        price: 62000,
      ),
      Product(
        category: Category.clothing,
        id: 25,
        isFeatured: false,
        name: 'Nagita Bubur',
        price: 85000,
      ),
      Product(
        category: Category.clothing,
        id: 26,
        isFeatured: false,
        name: 'Nita Samarinda',
        price: 72000,
      ),
      Product(
        category: Category.clothing,
        id: 27,
        isFeatured: true,
        name: 'Rafi Balikpapan',
        price: 44000,
      ),
      Product(
        category: Category.clothing,
        id: 28,
        isFeatured: true,
        name: 'Rina Manokwari',
        price: 49000,
      ),
      Product(
        category: Category.clothing,
        id: 29,
        isFeatured: true,
        name: 'Rini Jayapura',
        price: 95000,
      ),
      Product(
        category: Category.clothing,
        id: 30,
        isFeatured: true,
        name: 'Risa Ambon',
        price: 66000,
      ),
      Product(
        category: Category.clothing,
        id: 31,
        isFeatured: false,
        name: 'Rossi Ternate',
        price: 41000,
      ),
      Product(
        category: Category.clothing,
        id: 32,
        isFeatured: false,
        name: 'Rudi Kupang',
        price: 56000,
      ),
      Product(
        category: Category.clothing,
        id: 33,
        isFeatured: true,
        name: 'Sari Mataram',
        price: 45000,
      ),
      Product(
        category: Category.clothing,
        id: 34,
        isFeatured: false,
        name: 'Sassy Denpasar',
        price: 39000,
      ),
      Product(
        category: Category.clothing,
        id: 35,
        isFeatured: false,
        name: 'Siti Singaraja',
        price: 36000,
      ),
      Product(
        category: Category.clothing,
        id: 36,
        isFeatured: false,
        name: 'Uya Kuya Ubud',
        price: 54000,
      ),
      Product(
        category: Category.clothing,
        id: 37,
        isFeatured: true,
        name: 'Yuni Tabanan',
        price: 53000,
      ),
    ];
    if (category == Category.all) {
      return allProducts;
    } else {
      return allProducts.where((Product p) {
        return p.category == category;
      }).toList();
    }
  }

  static Product? findById(int id) {
    final all = loadProducts(Category.all);
    try {
      return all.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }
}

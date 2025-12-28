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

import '../model/product.dart';
import 'product_card.dart';

class AsymmetricView extends StatefulWidget {
  final List<Product> products;

  const AsymmetricView({Key? key, required this.products}) : super(key: key);

  @override
  _AsymmetricViewState createState() => _AsymmetricViewState();
}

class _AsymmetricViewState extends State<AsymmetricView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Grid with 2 columns: two images side-by-side, stacked vertically.
    // Use GridView's built-in vertical scrolling so child taps work normally.
    return GridView.builder(
      controller: _scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16.0, 34.0, 16.0, 44.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 0.75,
      ),
      itemCount: widget.products.length,
      itemBuilder: (BuildContext context, int index) {
        final product = widget.products[index];
        return ProductCard(product: product);
      },
    );
  }
}

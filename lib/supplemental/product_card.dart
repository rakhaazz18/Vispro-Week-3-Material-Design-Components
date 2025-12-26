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
import 'package:intl/intl.dart';

import '../model/product.dart';
import '../colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {this.imageAspectRatio = 33 / 49, required this.product, Key? key})
      : assert(imageAspectRatio > 0),
        super(key: key);

  final double imageAspectRatio;
  final Product product;

  static const kTextBoxHeight = 95.0;

  @override
  Widget build(BuildContext context) {
    final NumberFormat formatter =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    final ThemeData theme = Theme.of(context);

    final imageWidget = Image.asset(
      product.assetName,
      package: product.assetPackage,
      fit: BoxFit.cover,
    );

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product', arguments: product.id);
      },
      child: Card(
      elevation: 4.0,
      shadowColor: Colors.black.withAlpha(204),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      color: kLuxuryGray,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: kLuxuryGray,
          border: Border.all(
            color: kLuxuryGrayLight,
            width: 1.0,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Image container
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
              child: Container(
                width: double.infinity,
                height: 140.0,
                color: Colors.black,
                child: AspectRatio(
                  aspectRatio: imageAspectRatio,
                  child: imageWidget,
                ),
              ),
            ),
            // Product info section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: kTextBoxHeight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      product.name,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: kLuxuryWhite,
                        letterSpacing: 0.3,
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8.0),
                    // Harga dengan styling gold
                    Text(
                      formatter.format(product.price),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: kLuxuryGold,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}

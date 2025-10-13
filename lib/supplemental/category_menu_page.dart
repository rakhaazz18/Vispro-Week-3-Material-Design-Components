import 'package:flutter/material.dart';

import '../colors.dart';
import '../model/product.dart';

class CategoryMenuPage extends StatelessWidget {
  final Category currentCategory;
  final ValueChanged<Category> onCategoryTap;
  final List<Category> _categories = Category.values;

  const CategoryMenuPage({
    Key? key,
    required this.currentCategory,
    required this.onCategoryTap,
  }) : super(key: key);

  Widget _buildCategory(Category category, BuildContext context) {
    final categoryString =
        category.toString().replaceAll('Category.', '').toUpperCase();
    final ThemeData theme = Theme.of(context);
    final bool isActive = category == currentCategory;

    return GestureDetector(
      onTap: () => onCategoryTap(category),
      child: Column(
        children: <Widget>[
          Text(
            categoryString,
            style: theme.textTheme.bodyLarge?.copyWith(
              fontSize: isActive ? 20.0 : 18.0,
              fontWeight: isActive ? FontWeight.bold : FontWeight.w400,
              letterSpacing: isActive ? 1.5 : 0.5,
              color: isActive ? kLuxuryGold : kLuxuryWhite,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10.0),
          // Garis gold di bawah kategori aktif
          if (isActive)
            Container(
              width: 40.0,
              height: 2.0,
              color: kLuxuryGold,
            ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kLuxuryBlack,
      child: Center(
        child: ListView(
          padding: const EdgeInsets.only(top: 40.0),
          children: _categories
            .map((Category c) => _buildCategory(c, context))
            .toList(),
        ),
      ),
    );
  }
}


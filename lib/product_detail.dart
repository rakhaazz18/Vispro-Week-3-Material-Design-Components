import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/products_repository.dart';
import 'model/product.dart';
import 'model/cart_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final int? productId;

  const ProductDetailScreen({Key? key, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (productId == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Product')),
        body: const Center(child: Text('Invalid product ID')),
      );
    }

    final id = productId!;
    final Product? product = ProductsRepository.findById(id);

    if (product == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Product')),
        body: const Center(child: Text('Product not found')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Image.asset(
                product.assetName,
                height: 240,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(product.name, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8.0),
            Text('Price: Rp ${product.price}', style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // add product to cart model
                Provider.of<CartModel>(context, listen: false).add(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Added to cart'),
                    action: SnackBarAction(
                      label: 'View cart',
                      onPressed: () => Navigator.pushNamed(context, '/cart'),
                    ),
                  ),
                );
              },
              child: const Text('Add to cart'),
            ),
          ],
        ),
      ),
    );
  }
}

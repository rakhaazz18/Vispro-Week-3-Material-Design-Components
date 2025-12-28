import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/cart_model.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Consumer<CartModel>(
        builder: (context, cart, _) {
          if (cart.items.isEmpty) {
            return const Center(child: Text('Cart is empty'));
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (context, i) {
                    final p = cart.items[i];
                    return ListTile(
                      leading: Image.asset(p.assetName, width: 56, height: 56, fit: BoxFit.cover),
                      title: Text(p.name),
                      subtitle: Text('Rp ${p.price}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => cart.remove(p),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total: Rp ${cart.totalPrice}', style: Theme.of(context).textTheme.titleLarge),
                    ElevatedButton(onPressed: () {}, child: const Text('Checkout')),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

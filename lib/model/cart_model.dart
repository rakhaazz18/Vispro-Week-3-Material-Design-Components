import 'package:flutter/foundation.dart';
import 'product.dart';

class CartModel extends ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => List.unmodifiable(_items);

  void add(Product p) {
    _items.add(p);
    notifyListeners();
  }

  void remove(Product p) {
    _items.remove(p);
    notifyListeners();
  }

  int get totalPrice => _items.fold(0, (s, p) => s + p.price);
}

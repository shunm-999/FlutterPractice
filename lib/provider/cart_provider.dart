import 'dart:collection';

import 'package:flutter/cupertino.dart';

class CartItem {
  final String name;

  CartItem({required this.name});
}

class CartModel extends ChangeNotifier {
  final List<CartItem> _items = [];

  UnmodifiableListView<CartItem> get items => UnmodifiableListView(_items);

  int get totalPrice => _items.length * 42;

  void add(CartItem item) {
    _items.add(item);

    notifyListeners();
  }

  void removeAll() {
    _items.clear();

    notifyListeners();
  }
}

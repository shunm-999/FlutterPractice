import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
        ),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              Consumer<CartModel>(builder: (context, cart, child) {
                return TextButton(
                    onPressed: () {
                      DateTime now = DateTime.now();
                      String formattedTime =
                          "${now.year}-${now.day}-${now.month} ${now.hour}:${now.minute}:${now.second}";
                      cart.add(CartItem(name: formattedTime));
                    },
                    child: const Text("Add Cart Item"));
              }),
              Expanded(child: _CartListView()),
            ],
          ),
        ),
      ),
    );
  }
}

class _CartListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, cart, child) {
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return _cartListItem(cart.items[index]);
          },
          itemCount: cart.items.length,
        );
      },
    );
  }

  Widget _cartListItem(CartItem item) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
      child: ListTile(
        title: Text(
          item.name,
          style: const TextStyle(color: Colors.black, fontSize: 18.0),
        ),
      ),
    );
  }
}

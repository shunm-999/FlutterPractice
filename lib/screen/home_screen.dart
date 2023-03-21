import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Home"),
            TextButton(
                onPressed: () => context.go("/detail"),
                child: const Text("Go Detail")),
            const Text("Cart"),
            TextButton(
                onPressed: () => context.go("/cart"),
                child: const Text("Go Cart")),
            const Text("QiitaArticle"),
            TextButton(
                onPressed: () => context.go("/qiita_article"),
                child: const Text("Go QiitaArticle")),
            const Text("SharedPreference"),
            TextButton(
                onPressed: () => context.go("/shared_preference"),
                child: const Text("Go SharedPreference")),
            const Text("Go Map"),
            TextButton(
                onPressed: () => context.go("/map"),
                child: const Text("Go Map"))
          ],
        ),
      ),
    );
  }
}

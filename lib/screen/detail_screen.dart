import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
      ),
      body: Container(
        padding: const EdgeInsets.all(50.0),
        child: const Center(
          child: Text("Detail"),
        ),
      ),
    );
  }
}

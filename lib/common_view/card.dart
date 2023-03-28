import 'package:flutter/material.dart';

class CardView extends StatefulWidget {
  const CardView({super.key, required this.title, required this.message});

  final String title;
  final String message;

  @override
  State<StatefulWidget> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title, style: const TextStyle(fontSize: 30)),
            Text(widget.message, style: const TextStyle(fontSize: 16))
          ],
        ),
      ),
    );
  }
}

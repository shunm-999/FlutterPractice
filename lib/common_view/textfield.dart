import 'package:flutter/material.dart';

class TextFieldView extends StatefulWidget {
  TextFieldView({super.key, this.maxLength = -1, required String value})
      : _value = value;

  final int maxLength;

  String _value = "";

  @override
  State<StatefulWidget> createState() => _TextFieldState();
}

class _TextFieldState extends State<TextFieldView> {
  void _handleText(String e) {
    setState(() {
      widget._value = e;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(50.0),
        child: TextField(
            enabled: true,
            maxLength: widget.maxLength,
            style: const TextStyle(fontSize: 14),
            obscureText: false,
            maxLines: 1,
            onChanged: _handleText));
  }
}

import 'package:flutter/material.dart';

class TextFieldView extends StatefulWidget {
  const TextFieldView({super.key, this.maxLength = -1, required this.value});

  final int maxLength;

  final String value;

  @override
  State<StatefulWidget> createState() => _TextFieldState();
}

class _TextFieldState extends State<TextFieldView> {
  final TextEditingController _textEditingController = TextEditingController();

  String _text = '';

  @override
  void initState() {
    super.initState();
    _textEditingController.text = widget.value;
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
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
          controller: _textEditingController,
          maxLines: 1,
          onChanged: _handleText,
          onSubmitted: _submission,
        ));
  }

  void _handleText(String e) {
    setState(() {
      _text = e;
    });
  }

  void _submission(String e) {
    _textEditingController.clear();
    setState(() {
      _text = "";
    });
  }
}

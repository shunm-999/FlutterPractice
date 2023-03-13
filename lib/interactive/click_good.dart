import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClickGood extends StatefulWidget {
  ClickGood({super.key, required bool active}) : _active = active;

  bool _active = false;

  @override
  State<StatefulWidget> createState() => _ClickGood();
}

class _ClickGood extends State<ClickGood> {
  void _handleTap() {
    setState(() {
      widget._active = !widget._active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Column(
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: Center(
              child: Icon(
                Icons.thumb_up,
                color: widget._active ? Colors.orange[700] : Colors.grey[500],
                size: 100.0,),
            ),
          ),
          Container(
            width: 200,
            height: 50,
            decoration: BoxDecoration(
              color: widget._active ? Colors.orange[700] : Colors.grey[600],
            ),
            child: Center(
              child: Text(
                widget._active ? 'Active' : 'Inactive',
                style: const TextStyle(fontSize: 32.0, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

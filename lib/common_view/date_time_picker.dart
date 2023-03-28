import 'package:flutter/material.dart';

class DatePickerView extends StatefulWidget {
  const DatePickerView({super.key, required this.onDatePicked});

  final void Function(DateTime) onDatePicked;

  @override
  State<StatefulWidget> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePickerView> {
  DateTime _date = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    DateTime now = DateTime.now();

    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: DateTime(2016),
        lastDate: now.add(const Duration(days: 360)));

    if (picked != null) {
      _date = picked;
      widget.onDatePicked(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        children: [
          Center(
            child: Text("$_date"),
          ),
          ElevatedButton(
              onPressed: () => _selectDate(context), child: const Text('日付選択'))
        ],
      ),
    );
  }
}

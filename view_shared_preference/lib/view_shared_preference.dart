library view_shared_preference;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

class SharedPreferenceScreen extends StatefulWidget {
  const SharedPreferenceScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SharedPreferenceState();
}

class _SharedPreferenceState extends State<SharedPreferenceScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _counter;

  @override
  void initState() {
    super.initState();
    _counter = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('counter') ?? 0;
    });
  }

  Future<void> _incrementCounter() async {
    final SharedPreferences prefs = await _prefs;
    final int counter = (prefs.getInt('counter') ?? 0) + 1;

    setState(() {
      _counter = prefs.setInt('counter', counter).then((bool success) {
        return counter;
      });
    });
  }

  _removeCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _counter = Future(() => 0);
      prefs.remove('counter');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SharedPresence"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            FutureBuilder(
              future: _counter,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                return Text(
                  '${snapshot.data}',
                  style: const TextStyle(color: Colors.black, fontSize: 18.0),
                );
              },
            ),
            ElevatedButton(
              onPressed: () => _removeCounter(),
              child: const Text("削除する"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

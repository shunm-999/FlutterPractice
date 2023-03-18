import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/screen/cart_screen.dart';
import 'package:flutter_practice/screen/detail_screen.dart';
import 'package:flutter_practice/screen/home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:view_qiita/view/article_list_view.dart';
import 'package:view_shared_preference/view_shared_preference.dart';

void main() {
  return runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) {
      return const MyApp();
    },
  ));
}

final _router = GoRouter(initialLocation: '/', routes: [
  GoRoute(path: '/', builder: (context, state) => const HomeScreen(), routes: [
    GoRoute(path: 'detail', builder: (context, state) => const DetailScreen()),
    GoRoute(
        path: 'shared_preference',
        builder: (context, state) => const SharedPreferenceScreen())
  ]),
  GoRoute(path: '/cart', builder: (context, state) => const CartScreen()),
  GoRoute(
      path: '/qiita_article', builder: (context, state) => ArticleListView()),
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        title: "Flutter Material Design",
        routerConfig: _router);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'ボタンを押すと、数が増えるよ',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

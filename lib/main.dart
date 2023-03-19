import 'package:flutter/material.dart';
import 'ranking_page.dart';
import 'first_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const NameListPage(),
      // displays the name list page when the app is opened
      routes: {
        // adds a route to the home page
        '/home': (context) => const RankingPage(selectedName: '',),
      },
    );
  }
}



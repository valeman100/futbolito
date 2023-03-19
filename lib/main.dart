import 'package:flutter/material.dart';
import 'home_page.dart';
import 'first_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NameListPage(),
      // displays the name list page when the app is opened
      routes: {
        // adds a route to the home page
        '/home': (context) => const HomePage(selectedName: '',),
      },
    );
  }
}



import 'package:flutter/material.dart';
import 'next_page.dart';
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
        '/home': (context) => HomePage(),
      },
    );
  }
}

// new stateful widget
class HomePage extends StatefulWidget {
  HomePage({Key? key, selectedName}) : super(key: key);
  @override
  _HomePage createState() => _HomePage();
  }

class _HomePage extends State<HomePage> {
  String buttonName = 'Click Me';
  int currentIndex = 0;
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Futbolito Turnament'),
        backgroundColor: Colors.indigo[800],
      ),
      body: Center(
        child: currentIndex == 0
            ? Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.redAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.amber,
                      ),
                      onPressed: () {
                        setState(() {
                          buttonName = 'Clicked';
                        });
                      },
                      child: Text(buttonName),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          buttonName = 'Click Me';
                        });
                      },
                      child: const Text('Reset'),
                    ),
                    Text(buttonName),
                  ],
                ))
            : GestureDetector(
                onTap: () {
                  setState(() {
                    _isClicked = !_isClicked;
                  });
                },
                child: _isClicked
                    ? Image.asset('images/download.png')
                    : Image.asset('images/User Cover.png')),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          /**/
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Ranking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Matches',
          ),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}

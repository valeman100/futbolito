import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String selectedName;

  const HomePage({Key? key, required this.selectedName}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  String buttonName = 'Click Me';
  int currentIndex = 0;
  bool _isClicked = false;

  String get selectedName => widget.selectedName;

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
                          buttonName = '$selectedName Clicked';
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
                child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.blueAccent,
                    child: Center(
                      child: Form(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(selectedName),
                          )
                        ),
                      ),
                    )),
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
            icon: Icon(Icons.sports_soccer_sharp),
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

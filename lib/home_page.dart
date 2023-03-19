import 'package:flutter/material.dart';

import 'database_connection.dart';

class HomePage extends StatefulWidget {
  final String selectedName;

  const HomePage({Key? key, required this.selectedName}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  String buttonName = 'Click Me';
  int currentIndex = 0;

  late List<dynamic> _names = [];
  late List<dynamic> _surnames = [];
  late List<dynamic> _score = [];
  String _selectedName = '';

  @override
  void initState() {
    super.initState();
    _fetchNames();
  }

  void _fetchNames() async {
    List<dynamic> names = await DatabaseHelper.getUsers();
    names = names.map((name) => name['name']).toList();

    List<dynamic> surnames = await DatabaseHelper.getUsers();
    surnames = surnames.map((surname) => surname['surname']).toList();

    List<dynamic> score = await DatabaseHelper.getUsers();
    score = score.map((score) => score['score']).toList();

    setState(() {
      _names = names;
      _surnames = surnames;
      _score = score;
    });
  }

  String get selectedName => widget.selectedName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ranking for $selectedName'),
        backgroundColor: Colors.indigo[800],
      ),
      body: ListView.builder(
        itemCount: _names.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('${_names[index]} ${_surnames[index]} ${_score[index]}'),
            onTap: () {
              setState(() {
                _selectedName = _names[index].toString();
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      HomePage(selectedName: _selectedName), //
                ),
              );
            },
          );
        },
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

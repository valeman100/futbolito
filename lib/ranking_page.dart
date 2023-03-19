import 'package:flutter/material.dart';
import 'database_connection.dart';

class RankingPage extends StatefulWidget {
  final String selectedName;

  const RankingPage({Key? key, required this.selectedName}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<RankingPage> {
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
    List<dynamic> results = await DatabaseHelper.getUsers();

    setState(
      () {
        _names = results.map((results) => results['name']).toList();
        _surnames = results.map((results) => results['surname']).toList();
        _score = results.map((results) => results['score']).toList();
      },
    );
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
            title:
                Text('${_names[index]} ${_surnames[index]} ${_score[index]}'),
            tileColor: Colors.green[_score[index]*10],
            onTap: () {
              setState(() {
                _selectedName = _names[index].toString();
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      RankingPage(selectedName: _selectedName), //
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

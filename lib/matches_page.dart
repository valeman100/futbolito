import 'package:flutter/material.dart';
import 'package:futbolito/ranking_page.dart';
import 'database_connection.dart';

class MatchesPage extends StatefulWidget {
  final String selectedName;

  const MatchesPage({Key? key, required this.selectedName}) : super(key: key);

  @override
  _MatchesPage createState() => _MatchesPage();
}

class _MatchesPage extends State<MatchesPage> {
  int currentIndex = 1;
  String _selectedName = '';
  String _selectedText = '';

  late List<dynamic> _names1 = [];
  late List<dynamic> _names2 = [];
  late List<dynamic> _names3 = [];
  late List<dynamic> _names4 = [];
  late List<dynamic> _score1 = [];
  late List<dynamic> _score2 = [];

  @override
  void initState() {
    super.initState();
    _fetchMatches();
  }

  String get selectedName => widget.selectedName;

  void _fetchMatches() async {
    List<dynamic> results = await DatabaseHelper.getMatches(selectedName);

    setState(
      () {
        _names1 = results.map((results) => results['user1']).toList();
        _names2 = results.map((results) => results['user2']).toList();
        _names3 = results.map((results) => results['user3']).toList();
        _names4 = results.map((results) => results['user4']).toList();
        _score1 = results.map((results) => results['score1']).toList();
        _score2 = results.map((results) => results['score2']).toList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matches for $selectedName'),
        backgroundColor: Colors.indigo[800],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: ListView.builder(
            itemCount: _names1.length,
            itemBuilder: (BuildContext context, int index) {
              if (_score1[index] == null) {
                _selectedText = '${_names1[index]} ${_names2[index]} ${'     '}'
                    '${0} ${' - '} ${0} '
                    '${'     '} ${_names3[index]} ${_names4[index]}';
              } else {
                {
                  _selectedText =
                      '${_names1[index]} ${_names2[index]} ${'     '}'
                      '${_score1[index]} ${' - '} ${_score2[index]} '
                      '${'     '} ${_names3[index]} ${_names4[index]}';
                }
              }
              return Center(
                child: ListTile(
                  leading: Icon(Icons.accessible_forward),
                  trailing: Icon(Icons.more_vert),
                  title: new Center(
                    child: new Text(
                      _selectedText,
                      style: new TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 14.0),
                    ),
                  ),
                  // tileColor: Colors.green[_score1[index]*10],
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
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
          if (currentIndex == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RankingPage(selectedName: selectedName),
              ),
            );
          }
        },
      ),
    );
  }
}

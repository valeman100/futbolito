import 'package:flutter/material.dart';
import 'database_connection.dart';
import 'ranking_page.dart';

class NameListPage extends StatefulWidget {
  const NameListPage({super.key});

  @override
  _NameListPageState createState() => _NameListPageState();
}

class _NameListPageState extends State<NameListPage> {
  late List<dynamic> _names = [];
  late List<dynamic> _surnames = [];
  String _selectedName = '';

  @override
  void initState() {
    super.initState();
    _fetchNames();
  }

  void _fetchNames() async {
    List<dynamic> names = await DatabaseHelper.getNames();
    names = names.map((name) => name['name']).toList();

    List<dynamic> surnames = await DatabaseHelper.getNames();
    surnames = surnames.map((surname) => surname['surname']).toList();

    setState(() {
      _names = names;
      _surnames = surnames;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Participants'),
        backgroundColor: Colors.indigo[800],
      ),
      body: ListView.builder(
        itemCount: _names.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('${_names[index]} ${_surnames[index]}'),
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
    );
  }
}

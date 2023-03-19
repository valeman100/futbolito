import 'package:flutter/material.dart';
import 'database_connection.dart';
import 'home_page.dart';

import 'home_page.dart';
import 'main.dart';

//import 'package:your_database_library/database.dart';
//import 'package:your_app/home_page.dart';

class NameListPage extends StatefulWidget {
  @override
  _NameListPageState createState() => _NameListPageState();
}

class _NameListPageState extends State<NameListPage> {
  List<String> _names = ['a', 'b']; // stores the list of names
  String _selectedName = ''; // stores the selected name

  @override
  void initState() {
    super.initState();
    _fetchNames(); // fetches the list of names from the database
  }

  void _fetchNames() async {
    List<String> names = await DatabaseHelper.getNames();

    setState(() {
      _names = names;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Name List'),
      ),
      body: ListView.builder(
        itemCount: _names.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_names[index]),
            onTap: () {
              setState(() {
                _selectedName = _names[index];
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
    );
  }
}

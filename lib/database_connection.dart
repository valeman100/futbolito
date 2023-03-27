import 'package:mysql1/mysql1.dart';

class DatabaseConnection {
  static Future<MySqlConnection> getConnection() async {
    final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'sql7.freemysqlhosting.net',
      port: 3306,
      user: 'sql7608762',
      password: 'QYfSvVEVZ3',
      db: 'sql7608762',
      timeout: const Duration(seconds: 5),
    ));
    return conn;
  }
}

class DatabaseHelper {
  static Future<List<dynamic>> getNames() async {
    final conn = await DatabaseConnection.getConnection();
    final results = await conn.query('SELECT name, surname'
        ' FROM users'
        ' ORDER BY name');
    await conn.close();
    return results.map((result) => result).toList();
  }

  static Future<List<Object>> getUsers() async {
    final conn = await DatabaseConnection.getConnection();
    final results = await conn.query('SELECT name, surname, score'
        ' FROM users'
        ' ORDER BY score DESC');
    await conn.close();
    return results.map((result) => result).toList();
  }

  static Future<List<Object>> getMatches(selectedName) async {
    String _selectedName = selectedName;
    final conn = await DatabaseConnection.getConnection();
    final results = await conn.query(
        'SELECT user1, user2, user3, user4, score1, score2'
        ' FROM matches'
        ' WHERE user1 = ? OR user2 = ? OR user3 = ? OR user4 = ?',
        [_selectedName, _selectedName, _selectedName, _selectedName]);
    await conn.close();
    return results.map((result) => result).toList();
  }
}

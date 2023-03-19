import 'package:mysql1/mysql1.dart';

class DatabaseConnection {
  static Future<MySqlConnection> getConnection() async {
    final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'sql7.freesqldatabase.com',
      port: 3306, // default port for MySQL databases
      user: 'sql7606993',
      password: 'xrupkWU3Mt',
      db: 'sql7606993',
      timeout: const Duration(seconds: 5),
    ));
    return conn;
  }
}


class DatabaseHelper {
  static Future<List<String>> getNames() async {
    final conn = await DatabaseConnection.getConnection();
    final results = await conn.query('SELECT name FROM user');
    await conn.close();
    return results.map((result) => result[0] as String).toList();
  }
}
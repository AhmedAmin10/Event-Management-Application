import 'package:mysql1/mysql1.dart';

class Mysql {
  static String host = '10.0.2.2',
  // static String host = '192.168.1.12',
      user = 'root',
      password = 'amiin90',
      db = 'em';
  static int port = 3306;

  MySqlConnection? _connection;

  Mysql();

  Future<void> connect() async {
    var settings = ConnectionSettings(
        host: host, port: port, user: user, password: password, db: db);
    _connection = await MySqlConnection.connect(settings);
  }

  Future<void> close() async {
    if (_connection != null) {
      await _connection!.close();
      _connection = null;
    }
  }

  MySqlConnection? get connection => _connection;

  Future<void> register(String firstName, String lastName, String email, String phoneNumber) async {
    if (_connection == null) {
      await connect();
    }

    try {
      await _connection!.query(
          'INSERT INTO attendee (first_name, last_name, email, phone) VALUES (?, ?, ?, ?)',
          [firstName, lastName, email, phoneNumber]);
    } on MySqlException catch (e) {
      print('Database error: $e');
      rethrow;
    } catch (e) {
      print('Unknown error: $e');
      rethrow;
    }
  }
}

import 'package:mysql_client/mysql_client.dart';

///
class MySQLClientConnection {
  
  ///
  factory MySQLClientConnection() {
    return _inst;
  }

  MySQLClientConnection._internal() {
    _connectDatabase();
  }

  static final MySQLClientConnection _inst = MySQLClientConnection._internal();

  MySQLConnection? _connection;

  ///
  Future<void> _connectDatabase() async {
    _connection = await MySQLConnection.createConnection(
      host: 'localhost',
      port: 3306,
      userName: 'root',
      password: '1234',
      databaseName: 'crud',
      secure: false,
    );
    await _connection?.connect();
  }

  ///
  Future<IResultSet> runQuery(
    String query, {
    Map<String, dynamic>? params,
    bool iterable = false,
  }) async {
    if (_connection == null || _connection?.connected == false) {
      await _connectDatabase();
    }

    if (_connection?.connected == false) {
      throw Exception('Could not connect to the database');
    }
    return _connection!.execute(query, params, iterable);
  }

  ///
  bool? get checkDatabaseConnection {
    return _connection?.connected;
  }

}

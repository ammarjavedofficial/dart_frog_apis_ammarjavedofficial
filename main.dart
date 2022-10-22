import 'dart:io';
import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_apis_ammarjavedofficial/database/mysql_client.dart';

final mySQLClientConnection = MySQLClientConnection();

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) {
  return serve(handler.use(databaseHandler()), ip, port, poweredByHeader: 'Dart Frog Apis - AmmarJavedOfficial',);
}

Middleware databaseHandler() {
  return (handler) {
    return handler.use(
      provider<MySQLClientConnection>(
        (context) => mySQLClientConnection,
      ),
    );
  };
}

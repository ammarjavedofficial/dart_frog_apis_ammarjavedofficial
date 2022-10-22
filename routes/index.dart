import 'package:dart_frog/dart_frog.dart';

import '../main.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method.name == 'get') {
    try {
      return Response.json(
        body: mySQLClientConnection.checkDatabaseConnection == true
            ? 'Connection Successfully'
            : 'Connection Unsuccessful',
      );
    } catch (error) {
      return Response(body: error.toString());
    }
  } else {
    return Response.json(
      body: {
        'error':
            '${context.request.method.name.toUpperCase()} Method Not Supported'
      },
    );
  }
}

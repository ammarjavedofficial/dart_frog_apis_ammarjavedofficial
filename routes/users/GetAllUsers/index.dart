import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_apis_ammarjavedofficial/controllers/users_controller.dart';

Future<Response> onRequest(RequestContext context) async {
  final usersMiddleware = context.read<UsersController>();

  if (context.request.method.name == 'get') {
    try {
      final users = await usersMiddleware.getAllUsersList();
      if (users.isEmpty) {
        return Response.json(
          body: {
            'error': 'No User Exists',
          },
        );
      } else {
        return Response.json(
          body: users,
        );
      }
    } catch (error) {
      return Response(body: error.toString());
    }
  } else {
    return Response.json(
      body: {'error': '${context.request.method.name.toUpperCase()} Method Not Supported'},
    );
  }
}

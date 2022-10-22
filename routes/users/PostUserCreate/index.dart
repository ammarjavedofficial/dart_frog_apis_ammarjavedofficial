import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_apis_ammarjavedofficial/controllers/users_controller.dart';


Future<Response> onRequest(RequestContext context,) async {
  final usersMiddleware = context.read<UsersController>();
  if (context.request.method.name == 'post') {
    final userName = context.request.uri.queryParameters['userName'];
    final userPassword = context.request.uri.queryParameters['userPassword'];

    if(userName != null && userPassword != null)
    {
    try {
      final users = await usersMiddleware.postUserCreate(
        userName: userName,
        userPassword: userPassword,
      );
      return Response.json(body: users);
    } catch (error) {
      return Response(body: error.toString());
    }
    } else {
      return Response.json(body: {'error' : 'All Parameters Are Required'});
    }
  } else {
    return Response.json(
      body: {'error': '${context.request.method.name.toUpperCase()} Method Not Supported'},
    );
  }
}

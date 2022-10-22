import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_apis_ammarjavedofficial/controllers/users_controller.dart';

import '../../../main.dart';

Handler middleware(Handler handler) {
  return handler.use(requestLogger()).use(injectionHandler());
}

Middleware injectionHandler() {
  return (handler) {
    return handler.use(
      provider<UsersController>(
        (context) => UsersController(mySQLClientConnection),
      ),
    );
  };
}

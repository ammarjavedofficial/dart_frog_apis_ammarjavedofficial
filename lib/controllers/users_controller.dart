import 'package:dart_frog_apis_ammarjavedofficial/database/mysql_client.dart';
import 'package:dart_frog_apis_ammarjavedofficial/models/users_model.dart';

///
class UsersController {
  ///
  UsersController(this._mySQLClientConnection);

  final MySQLClientConnection _mySQLClientConnection;

  ///
  Future<Map<String, String?>> postUserCreate({
    required String? userName,
    required String? userPassword,
  }) async {
    await _mySQLClientConnection.runQuery(
      "INSERT INTO `users_table`(`userName`, `userPassword`) VALUES ('$userName','$userPassword')");
    return {
      'success': 'User Created',
    };
  }


  ///
  Future<List<UsersModel>> getAllUsersList() async {
    final items = <UsersModel>[];
    final result = await _mySQLClientConnection.runQuery(
        'SELECT * from users_table',);
    for (final row in result.rows) {
      items.add(UsersModel.databseRow(row.assoc()));
    }
    return items;
  }


  ///
  Future<Map<String, String?>> getUserDetailsById(
        {
      String? userId
    }
  ) async {
    final result = await _mySQLClientConnection
        .runQuery("SELECT * FROM `users_table` WHERE userId = $userId");
    if (result.numOfRows != 0) {
      return result.rows.first.assoc();
    } else {
      return {'error': "User Don't Exists"};
    }
  }  

  ///
  Future<Map<String, String?>> patchUserUpdate({
    String? userId,
    required String? userName,
    required String? userPassword,
  }) async {
    final result = await _mySQLClientConnection.runQuery(
      "UPDATE `users_table` SET `userName`='$userName',`userPassword`='$userPassword' WHERE userId = $userId");
    if (result.affectedRows != BigInt.from(0)) {
        return {'success': 'User Updated'};
    } else {
      return {'error': "User Don't Exists"};
    }    
  }  

  ///
  Future<Map<String, String?>> deleteUserDelete(
    {
      String? userId
    }
  ) async {
    final result = await _mySQLClientConnection
        .runQuery('DELETE FROM `users_table` WHERE userId = $userId;');
    if (result.affectedRows != BigInt.from(0)) {
      return {
        'success': 'User Deleted',
      };
    } else {
      return {'error': "User Don't Exists"};
    }
  }

  ///
  Future<Map<String, String?>> deleteAllUsers(
  ) async {
    final result = await _mySQLClientConnection
        .runQuery("DELETE FROM `users_table`");
    if (result.affectedRows != BigInt.from(0)) {
      return {
        'success': 'Users Deleted',
      };
    } else {
      return {'error': "Users Don't Exists"};
    }
  }










}

///
class UsersModel {

  ///
  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      userPassword: json['userPassword'] as String,
    );
  }  

  ///
  factory UsersModel.databseRow(Map<String, String?> json) {
    return UsersModel(
      userId: json['userId'],
      userName: json['userName'],
      userPassword: json['userPassword'],
    );
  }

  ///
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userName': userName,
      'userPassword': userPassword,
    };
  }

  ///
  UsersModel({
    this.userId,
    this.userName,
    this.userPassword,
  });

  ///id
  final String? userId;

  ///userName
  final String? userName;

  ///password
  final String? userPassword;

}

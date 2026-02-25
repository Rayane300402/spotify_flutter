import '../../../domain/entities/auth/user.dart';

class UserData {
  String? fullName;
  String? email;
  String ? profileImg;


  UserData({this.fullName, this.email, this.profileImg});

  UserData.fromJson(Map<String, dynamic> data) {
    fullName = data["name"];
    email = data["email"];
  }
}

extension UserDataX on UserData {
  User toEntity() {
    return User(fullName: fullName!, email: email!, profileImg: profileImg );
  }
}
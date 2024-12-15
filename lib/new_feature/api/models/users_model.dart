import 'dart:convert';

class UserModel {
  String? email;
  String? password;
  String? firstname;
  String? lastname;
  String? phoneNumber;

  UserModel({
    this.email,
    this.password,
    this.firstname,
    this.lastname,
    this.phoneNumber,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json["email"],
        password: json["password"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "firstname": firstname,
        "lastname": lastname,
        "phoneNumber": phoneNumber,
      };
  UserModel copyWith({
    String? email,
    String? password,
    String? firstname,
    String? lastname,
    String? phoneNumber,
  }) {
    return UserModel(
      email: email ?? this.email,
      password: password ?? this.password,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}

UserModel welcomeFromJson(String str) => UserModel.fromJson(json.decode(str));

String welcomeToJson(UserModel data) => json.encode(data.toJson());

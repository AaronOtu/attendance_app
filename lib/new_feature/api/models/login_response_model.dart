
class LoginResponseModel {
  String? message;
  String? token;
  User? user;

  LoginResponseModel({
    this.message,
    this.token,
    this.user,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
        message: json["message"],
        token: json["token"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "token": token,
        "user": user?.toJson(),
      };
}

class User {
  String? referralCode;
  String? firstname;
  String? lastname;
  String? email;
  String? phoneNumber;
  dynamic referrar;
  dynamic password;
  String? role;
  String? addressCode;
  dynamic profileImage;
  dynamic token;
  dynamic googleId;
  String? id;
  int? emailAlert;
  int? smsAlert;
  String? package;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? credits;

  User({
    this.referralCode,
    this.firstname,
    this.lastname,
    this.email,
    this.phoneNumber,
    this.referrar,
    this.password,
    this.role,
    this.addressCode,
    this.profileImage,
    this.token,
    this.googleId,
    this.id,
    this.emailAlert,
    this.smsAlert,
    this.package,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.credits,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        referralCode: json["referralCode"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        referrar: json["referrar"],
        password: json["password"],
        role: json["role"],
        addressCode: json["addressCode"],
        profileImage: json["profileImage"],
        token: json["token"],
        googleId: json["googleId"],
        id: json["id"],
        emailAlert: json["emailAlert"],
        smsAlert: json["smsAlert"],
        package: json["package"],
        status: json["status"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        credits: json["credits"],
      );

  Map<String, dynamic> toJson() => {
        "referralCode": referralCode,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "phoneNumber": phoneNumber,
        "referrar": referrar,
        "password": password,
        "role": role,
        "addressCode": addressCode,
        "profileImage": profileImage,
        "token": token,
        "googleId": googleId,
        "id": id,
        "emailAlert": emailAlert,
        "smsAlert": smsAlert,
        "package": package,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "credits": credits,
      };
}

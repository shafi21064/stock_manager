import 'dart:convert';

class AppLoginResponse {
  bool? result;
  String? message;
  Data? data;

  AppLoginResponse({
    this.result,
    this.message,
    this.data,
  });

  factory AppLoginResponse.fromJson(String str) =>
      AppLoginResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AppLoginResponse.fromMap(Map<String, dynamic> json) =>
      AppLoginResponse(
        result: json["result"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "result": result,
        "message": message,
        "data": data?.toMap(),
      };
}

class Data {
  String? accessToken;
  String? tokenType;
  User? user;
  int? userId;

  Data({
    this.accessToken,
    this.tokenType,
    this.user,
    this.userId,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        user: json["user"] == null ? null : User.fromMap(json["user"]),
        userId: json["user_id"],
      );

  Map<String, dynamic> toMap() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "user": user?.toMap(),
        "user_id": userId,
      };
}

class User {
  int? id;
  String? name;
  String? email;
  dynamic phone;
  dynamic avatar;
  dynamic providerId;
  dynamic provider;
  dynamic emailVerifiedAt;
  dynamic verificationCode;
  dynamic facebookId;
  dynamic googleId;
  int? isActive;
  dynamic currentTeamId;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.avatar,
    this.providerId,
    this.provider,
    this.emailVerifiedAt,
    this.verificationCode,
    this.facebookId,
    this.googleId,
    this.isActive,
    this.currentTeamId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        avatar: json["avatar"],
        providerId: json["provider_id"],
        provider: json["provider"],
        emailVerifiedAt: json["email_verified_at"],
        verificationCode: json["verification_code"],
        facebookId: json["facebook_id"],
        googleId: json["google_id"],
        isActive: json["is_active"],
        currentTeamId: json["current_team_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "avatar": avatar,
        "provider_id": providerId,
        "provider": provider,
        "email_verified_at": emailVerifiedAt,
        "verification_code": verificationCode,
        "facebook_id": facebookId,
        "google_id": googleId,
        "is_active": isActive,
        "current_team_id": currentTeamId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
      };
}

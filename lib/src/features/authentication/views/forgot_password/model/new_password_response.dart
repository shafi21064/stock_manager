class NewPasswordResponse {
  bool? result;
  Data? data;

  NewPasswordResponse({this.result, this.data});

  NewPasswordResponse.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? accessToken;
  String? tokenType;
  User? user;
  String? message;
  int? userId;

  Data(
      {this.accessToken, this.tokenType, this.user, this.message, this.userId});

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    message = json['message'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['message'] = message;
    data['user_id'] =userId;
    return data;
  }
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
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
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
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    avatar = json['avatar'];
    providerId = json['provider_id'];
    provider = json['provider'];
    emailVerifiedAt = json['email_verified_at'];
    verificationCode = json['verification_code'];
    facebookId = json['facebook_id'];
    googleId = json['google_id'];
    isActive = json['is_active'];
    currentTeamId = json['current_team_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['avatar'] = avatar;
    data['provider_id'] = providerId;
    data['provider'] = provider;
    data['email_verified_at'] = emailVerifiedAt;
    data['verification_code'] = verificationCode;
    data['facebook_id'] = facebookId;
    data['google_id'] = googleId;
    data['is_active'] = isActive;
    data['current_team_id'] = currentTeamId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
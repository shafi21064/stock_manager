import 'dart:convert';

class OtpResponse {
  bool? result;
  String? message;
  Data? data;

  OtpResponse({
    this.result,
    this.message,
    this.data,
  });

  factory OtpResponse.fromJson(String str) => OtpResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OtpResponse.fromMap(Map<String, dynamic> json) => OtpResponse(
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
  String? token;

  Data({
    this.token,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    token: json["token"],
  );

  Map<String, dynamic> toMap() => {
    "token": token,
  };
}

class ForgetPasswordResponse {
  bool? result;
  String? message;
  dynamic data;

  ForgetPasswordResponse({this.result, this.message, this.data});

  ForgetPasswordResponse.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['message'] = message;
    data['data'] = this.data;
    return data;
  }
}
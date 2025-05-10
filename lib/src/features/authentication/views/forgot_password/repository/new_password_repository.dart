import 'dart:convert';
import '../../../../../utils/constants/app_api_end_points.dart';
import 'package:http/http.dart' as http;

import '../model/new_password_response.dart';


class NewPasswordRepository{

  Future<NewPasswordResponse> getNewPasswordResponse(
      String password, String token, String emailOrPhone) async {

    var postBody = jsonEncode({
      "email" : emailOrPhone,
      "token" : token,
      "password" : password
    });

    Uri url = Uri.parse(
        AppApiEndPoints.resetPasswordWithEmail
    );
    final response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
        },
        body: postBody);

    print(response.body.toString());

    return NewPasswordResponse.fromJson(jsonDecode(response.body));
  }




}
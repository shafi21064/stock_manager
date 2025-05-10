import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../../utils/constants/app_api_end_points.dart';
import '../model/login_response.dart';

class LoginRepository {
  //final loginController = LogInPageController.instance;

  // Future<SendOtpCodeResponse> getLoginOTPResponse( String phone, ) async {
  //   var postBody = jsonEncode({"email": phone});
  //
  //   Uri url = Uri.parse(AppApiEndPoints.loginOtp);
  //   final response = await http.post(url,
  //       headers: {
  //         "Accept": "*/*",
  //         "Content-Type": "application/json",
  //       },
  //       body: postBody);
  //   return SendOtpCodeResponse.fromJson(jsonDecode(response.body));
  // }

  // Future<AppLoginResponse> getLogInOtpConfirmCodeResponse(
  //     String phone, String verificationCode) async {
  //   var postBody =
  //   jsonEncode({"email": phone, "otp_code": verificationCode});
  //
  //   Uri url = Uri.parse(AppApiEndPoints.verifyLoginOtp);
  //   final response = await http.post(url,
  //       headers: {
  //         "Content-Type": "application/json",
  //       },
  //       body: postBody);
  //   print(response.body);
  //   return AppLoginResponse.fromJson(jsonDecode(response.body));
  // }

  Future<AppLoginResponse> getLoginResponse(
    String email,
    String password,
    bool rememberMe,
  ) async {
    var postBody = jsonEncode({
      "email": email,
      "password": password,
      "remember_me": rememberMe,
    });

    Uri url = Uri.parse(AppApiEndPoints.loginWithEmail);
    final response = await http.post(url,
        headers: {
          "Accept": "*/*",
          "Content-Type": "application/json",
        },
        body: postBody);
    print(response.body.toString());

    return AppLoginResponse.fromJson(response.body.toString());
  }

  // Future<UserByTokenResponse> getUserByTokenResponse() async {
  //   final accessToken = AppLocalStorage().readData(LocalStorageKeys.accessToken);
  //   var postBody = jsonEncode({"access_token": accessToken});
  //   Uri url = Uri.parse(AppApiEndPoints.getUserAccessToken);
  //   final response = await http.post(url,
  //       headers: {
  //         "Content-Type": "application/json",
  //       },
  //       body: postBody);
  //
  //
  //   return UserByTokenResponse.fromJson(jsonDecode(response.body));
  // }
  //
  //
  // Future<SendOtpCodeResponse> getLoginResendOTPResponse(String phone) async {
  //   var postBody = jsonEncode({"email": phone});
  //
  //   Uri url = Uri.parse(AppApiEndPoints.loginOtp);
  //   final response = await http.post(url,
  //       headers: {
  //         "Accept": "*/*",
  //         "Content-Type": "application/json",
  //       },
  //       body: postBody);
  //   print(response.body);
  //   return SendOtpCodeResponse.fromJson(jsonDecode(response.body));
  // }
  //
  //
  // Future<SocialOptionsResponse> fetchLoginOptions() async {
  //   final response = await http.get(Uri.parse(AppApiEndPoints.socialOption));
  //
  //   if (response.statusCode == 200) {
  //     List<dynamic> jsonResponse = json.decode(response.body);
  //     return SocialOptionsResponse.fromJson(jsonResponse);
  //   } else {
  //     throw Exception('Failed to load login options');
  //   }
  // }
}

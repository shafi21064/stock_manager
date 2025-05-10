import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../../utils/constants/app_api_end_points.dart';
import '../../log_in/model/login_response.dart';

class SignupRepository {
  //final signupController = SignUpPageController.instance;

  Future<AppLoginResponse> getSignupResponse(
    String emailOrPhone,
    String password,
  ) async {
    var postBody = jsonEncode({
      "email": emailOrPhone,
      "password": password,
    });

    Uri url = Uri.parse(AppApiEndPoints.signupWithEmail);
    final response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
        },
        body: postBody);

    print(response.body);
    return AppLoginResponse.fromJson(response.body.toString());
  }

  // Future<SignupResponse> getSignupOtpResponse(
  //     String phone
  //     ) async {
  //   var postBody = jsonEncode({
  //     "email": phone,
  //     //"version": "${Provider.of<VersionChange>(context, listen: false).latestVersion}",
  //   });
  //   print(postBody);
  //   Uri url = Uri.parse(AppApiEndPoints.signupOtp);
  //   print(url);
  //   final response = await http.post(url,
  //       headers: {
  //         "Content-Type": "application/json",
  //       },
  //       body: postBody);
  //   print("SignUpResponse:"+response.body.toString());
  //   return signupResponseFromJson(response.body);
  // }
  //
  // Future<AppLoginResponse> getSignUpOtpConfirmCodeResponse(
  //     String phone,  String verificationCode) async {
  //   var postBody =
  //   jsonEncode({"email": phone, "otp_code": verificationCode});
  //
  //   Uri url = Uri.parse(AppApiEndPoints.verifySignUpOtp);
  //   final response = await http.post(url,
  //       headers: {
  //         "Content-Type": "application/json",
  //       },
  //       body: postBody);
  //   print(response.body);
  //   return AppLoginResponse.fromJson(jsonDecode(response.body));
  // }
  //
  //
  // Future<SendOtpCodeResponse> getResendSignupOtpResponse(
  //     String phone
  //     ) async {
  //   var postBody = jsonEncode({
  //     "email": phone,
  //     //"version": "${Provider.of<VersionChange>(context, listen: false).latestVersion}",
  //   });
  //   Uri url = Uri.parse(AppApiEndPoints.signupOtp);
  //   final response = await http.post(url,
  //       headers: {
  //         "Content-Type": "application/json",
  //       },
  //       body: postBody);
  //   print(response.body);
  //   return resendCodeResponseFromJson(response.body);
  // }
}

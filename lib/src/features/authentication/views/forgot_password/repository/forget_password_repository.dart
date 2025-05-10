import 'dart:convert';
import '../../../../../utils/constants/app_api_end_points.dart';
import 'package:http/http.dart' as http;
import '../model/forget_password_response.dart';

class ForgotPasswordRepository{

  //final forgetPassController = ForgotPasswordController.instance;

  Future<ForgetPasswordResponse> getForgetPasswordResponse(
      String emailOrPhone) async {
    var postBody = jsonEncode({"email": emailOrPhone});

    Uri url = Uri.parse(
        AppApiEndPoints.forgetPasswordWithEmail
    );
    final response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
        },
        body: postBody);

    print(response.body.toString());

    return ForgetPasswordResponse.fromJson(jsonDecode(response.body));
  }

  // Future<ForgetPasswordConfirmResponse> getPasswordConfirmResponse(
  //     String verificationCode,  String phone) async {
  //   var postBody =
  //   jsonEncode({"otp_code": verificationCode, "email": phone});
  //
  //   Uri url = Uri.parse(AppApiEndPoints.forgetConfirmPassword
  //   );
  //   final response = await http.post(url,
  //       headers: {
  //         "Content-Type": "application/json",
  //       },
  //       body: postBody);
  //
  //   print(response.body.toString());
  //
  //   return forgetPasswordConfirmResponseFromJson(response.body);
  // }
  //
  //
  // Future<SendOtpCodeResponse> getResendForgetPasswordResponse(
  //     String emailOrPhone) async {
  //   var postBody = jsonEncode({"email": emailOrPhone});
  //
  //   Uri url = Uri.parse(
  //       AppApiEndPoints.forgetPasswordOtpSend
  //   );
  //   final response = await http.post(url,
  //       headers: {
  //         "Content-Type": "application/json",
  //       },
  //       body: postBody);
  //
  //   print(response.body);
  //
  //   return resendCodeResponseFromJson(response.body);
  // }


}
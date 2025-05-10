import 'dart:convert';
import '../../../../../utils/constants/app_api_end_points.dart';
import 'package:http/http.dart' as http;

import '../model/otp_response.dart';

class OTPRepository {
  Future<OtpResponse> getVerifyOTPResponse(String emailOrPhone, String code1,
      String code2, String code3, String code4) async {
    var postBody = jsonEncode({
      "email": emailOrPhone,
      "otp": code1 + code2 + code3 + code4,
    });

    Uri url = Uri.parse(AppApiEndPoints.verifyOTPWithEmail);
    final response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
        },
        body: postBody);

    print(response.body.toString());

    return OtpResponse.fromJson(response.body);
  }
}

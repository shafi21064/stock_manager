import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppApiEndPoints {
  AppApiEndPoints._();

  static final String? baseUrl = dotenv.env["BASE_URL"];

  /// Authentication
  static String loginWithEmail = "$baseUrl/api/v1/auth/signin";
  static String signupWithEmail = "$baseUrl/api/v1/auth/signup";
  static String forgetPasswordWithEmail = "$baseUrl/api/v1/auth/send-reset-otp";
  static String verifyOTPWithEmail = "$baseUrl/api/v1/auth/verify-reset-otp";
  static String resetPasswordWithEmail = "$baseUrl/api/v1/auth/reset-password";
  static String socialLogin =
      "$baseUrl/api/v1/auth/social-signin-via-access-token";
  static String logout = "$baseUrl/api/v1/auth/signout";
}

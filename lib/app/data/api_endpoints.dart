class ApiEndPoints {
  static const String baseUrl = "http://192.168.145.154:8080";

  // Server image endpoint
  static String baseImageUrl =
      "https://tnbusinesscard.s3.ap-southeast-1.amazonaws.com/";

  static _AuthEndPoints authEndPoints = _AuthEndPoints();
}

class _AuthEndPoints {
  // For Sign-In User
  final String login = "/api/auth/login_with_email";
  final String vailidatedUser = "/api/auth/check-token";

  // For Reset Password
  final String resetEmail = "/api/auth/forgot_password";
  final String resetPass = "/api/auth/reset_password";

  // For Create Account
  final String createWithEmail = "/api/auth/signup_with_email";
  final String createForOtp = "/api/auth/signup_with_email_verification";

  //account related api endpoint
  final String sendFeedback = "/api/feedback/send_user_feedback";
  final String cardTransfer =
      "/api/card-transfer/get_user_transfer_card_list_to_accept";

  //Card Send Section
  final String sendEmail = "/api/card/send_card_by_email";
  final String transferCard = "/api/card-transfer/user_transfer_card";

  //delete
  final String deleteAccount = "/api/user/delete_user_account";
  final String deleteCard = "/api/card/delete_card/";

  //logout
  final String logout = "/api/user/user_logout";

  //change mail-password
  final String changeMail = "/api/user/change_user_email";
  final String changeMailWithOtp = "/api/user/change_user_email_verification";

  final String changePassword = "/api/user/change_user_password";

  //get and update user data
  final String profile = "/api/card/get_user_profile_data";
  final String updateProfile = "/api/user/update_user_profile";

  //Card information
  final String getCardData = "/api/card/get_card_initial_data";
  final String getAllCard = "/api/card/list_user";
  final String cardCreate = "/api/card/save_new_card";
  final String editCard = "/api/card/update_card/";
  final String duplicateCard = "/api/card/duplicate_card/";

  // Scan Card QR code
  final String qrSaveContact = "/api/card/save_scanned_card_as_contact";
  final String getCardModelFromUrl = "/api/card/get_card_from_link/";
}

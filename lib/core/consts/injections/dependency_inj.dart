import 'package:firebase_google_auth/src/controllers/blogs_controller/blogs_controller.dart';
import 'package:firebase_google_auth/src/controllers/email_pas_controller/Auth_cotroller.dart';
import 'package:firebase_google_auth/src/controllers/oauth_controller/google_oauth_controller.dart';
import 'package:get/get.dart';

class DependencyInjections {
  GoogleOauthController oauthController = Get.put(GoogleOauthController());
  EmailAuthController emailAuthController = Get.put(EmailAuthController());
}

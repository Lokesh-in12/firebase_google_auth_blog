import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleOauthController extends GetxController {
  final googleSignIn = GoogleSignIn();
  final googleAccount = Rx<GoogleSignInAccount?>(null);

  void login() async {
    googleAccount.value = await googleSignIn.signIn();
  }

  void logOut() async {
    googleAccount.value = await googleSignIn.signOut();
  }
}

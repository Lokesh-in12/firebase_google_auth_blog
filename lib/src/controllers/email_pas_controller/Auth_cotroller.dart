import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:email_validator/email_validator.dart';

class EmailAuthController extends GetxController {
  final auth = FirebaseAuth.instance;
  RxBool validEmail = false.obs;
  RxBool validPass = false.obs;

  void checkEmail(String email) {
    bool isValid = EmailValidator.validate(email);
    isValid ? validEmail.value = true : validEmail.value = false;
  }

  void checkPass(String password) {
    print(password.length);
    password.length > 6 ? validPass.value = true : validPass.value = false;
  }

  void signUp(String email, String password) async {
    try {
      UserCredential userCredentials = await auth
          .createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw ("error in emailController SignUp =>>> $e");
    }
  }

  void signIn(String email, String password) async {
    try {
      UserCredential userCredentials = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      print("userCred  ==> ${userCredentials}");
    } catch (e) {
      throw ("error in emailController Signin =>>> $e");
    }
  }
}

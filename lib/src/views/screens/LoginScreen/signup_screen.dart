import 'package:firebase_google_auth/core/routes/app_route_constants.dart';
import 'package:firebase_google_auth/src/controllers/email_pas_controller/Auth_cotroller.dart';
import 'package:firebase_google_auth/src/controllers/oauth_controller/google_oauth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final oauthController = Get.find<GoogleOauthController>();
  final emailAuthController = Get.find<EmailAuthController>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (oauthController.googleAccount.value == null) {
        return Scaffold(
          appBar: AppBar(title: const Text("Fireliyy")),
          body: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                Center(
                    child: Column(
                  children: [
                    const Text(
                      "Signin to Proceed",
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        controller: _emailController,
                        onChanged: (value) => emailAuthController
                            .checkEmail(_emailController.text.trim()),
                        decoration: InputDecoration(
                            labelText: "Email",
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    emailAuthController.validEmail.value == true
                                        ? const BorderSide(color: Colors.white)
                                        : const BorderSide(color: Colors.red)),
                            hintText: "Email...",
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    emailAuthController.validEmail.value == true
                                        ? const BorderSide(color: Colors.white)
                                        : const BorderSide(color: Colors.red)),
                            filled: true,
                            fillColor:
                                const Color.fromARGB(255, 233, 233, 233)),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        onChanged: (value) => emailAuthController
                            .checkPass(_passwordController.text.trim()),
                        controller: _passwordController,
                        decoration: InputDecoration(
                            labelText: "Password",
                            hintText: "Password...",
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    emailAuthController.validPass.value == true
                                        ? const BorderSide(color: Colors.white)
                                        : const BorderSide(color: Colors.red)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    emailAuthController.validPass.value == true
                                        ? const BorderSide(color: Colors.white)
                                        : const BorderSide(color: Colors.red)),
                            filled: true,
                            fillColor:
                                const Color.fromARGB(255, 233, 233, 233)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                            minimumSize: const Size(100, 35),
                            backgroundColor:
                                emailAuthController.validEmail.value &&
                                        emailAuthController.validPass.value
                                    ? Colors.lightBlue
                                    : Colors.grey),
                        onPressed: () {
                          if (emailAuthController.validEmail.value &&
                              emailAuthController.validPass.value) {
                            emailAuthController.signUp(
                                _emailController.text.trim(),
                                _passwordController.text.trim());
                            context.goNamed(AppRouteConsts.login);
                          }

                          print("null is button");
                        },
                        child: const Text(
                          "SignUp",
                          style: TextStyle(color: Colors.white),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                            minimumSize: const Size(100, 35),
                            backgroundColor: Colors.lightBlue),
                        onPressed: () {
                          context.pushNamed(AppRouteConsts.login);
                        },
                        child: const Text(
                          "Alreay Have an account?",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                )),
              ],
            ),
          ),
        );
      } else {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Fireliyy"),
          ),
          body: Center(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: Image.network(oauthController
                          .googleAccount.value!.photoUrl
                          .toString())
                      .image,
                  maxRadius: 50,
                  backgroundColor: const Color.fromARGB(255, 204, 203, 203),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(oauthController.googleAccount.value!.displayName
                    .toString()),
                const SizedBox(
                  height: 20,
                ),
                Text(oauthController.googleAccount.value!.email.toString()),
                TextButton(
                    onPressed: () => oauthController.logOut(),
                    child: const Text("Logout"))
              ],
            ),
          ),
        );
      }
    });
  }
}

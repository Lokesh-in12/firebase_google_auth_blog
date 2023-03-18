import 'package:firebase_google_auth/core/routes/app_route_constants.dart';
import 'package:firebase_google_auth/src/controllers/email_pas_controller/Auth_cotroller.dart';
import 'package:firebase_google_auth/src/controllers/oauth_controller/google_oauth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final oauthController = Get.find<GoogleOauthController>();
  final emailAuthController = Get.find<EmailAuthController>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(title: Text("Login")),
          body: Center(
            child: Column(children: [
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Login",
                style: TextStyle(fontSize: 22),
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
                      fillColor: const Color.fromARGB(255, 233, 233, 233)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _passwordController,
                  onChanged: (value) => emailAuthController
                      .checkPass(_passwordController.text.trim()),
                  decoration: InputDecoration(
                      labelText: "Password",
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              emailAuthController.validPass.value == true
                                  ? const BorderSide(color: Colors.white)
                                  : const BorderSide(color: Colors.red)),
                      hintText: "Password...",
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              emailAuthController.validPass.value == true
                                  ? const BorderSide(color: Colors.white)
                                  : const BorderSide(color: Colors.red)),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 233, 233, 233)),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Obx(() => TextButton(
                  style: TextButton.styleFrom(
                      minimumSize: const Size(100, 35),
                      backgroundColor: emailAuthController.validEmail.value &&
                              emailAuthController.validPass.value
                          ? Colors.lightBlue
                          : Colors.grey),
                  onPressed: () {
                    if (emailAuthController.validEmail.value &&
                        emailAuthController.validEmail.value) {
                      emailAuthController.signIn(_emailController.text.trim(),
                          _passwordController.text.trim());
                      context.goNamed(AppRouteConsts.home);
                    }
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ))),
            ]),
          ),
        ));
  }
}

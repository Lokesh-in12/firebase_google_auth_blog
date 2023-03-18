import 'package:firebase_google_auth/src/controllers/oauth_controller/google_oauth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OauthButton extends StatelessWidget {
  OauthButton({super.key});
  final oauthController = Get.find<GoogleOauthController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FloatingActionButton.extended(
          onPressed: () => oauthController.login(),
          label: const Text("Sign in With Google")),
    );
  }
}

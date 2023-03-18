import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_google_auth/core/consts/injections/dependency_inj.dart';
import 'package:firebase_google_auth/core/routes/app_route_config.dart';
import 'package:firebase_google_auth/firebase_options.dart';
import 'package:firebase_google_auth/src/controllers/blogs_controller/blogs_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  DependencyInjections();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig:
          MyAppRouterConfig.returnRouter(false),
    );
  }
}

import 'package:firebase_google_auth/core/routes/app_route_constants.dart';
import 'package:firebase_google_auth/src/views/screens/HomeScreen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../src/views/screens/LoginScreen/login_page.dart';
import '../../src/views/screens/LoginScreen/signup_screen.dart';

class MyAppRouterConfig {
  static GoRouter returnRouter(bool isLoggedIn) {
    GoRouter router = GoRouter(
        initialLocation: '/signup',
        // redirect: (context, state) async {
        //   if (isLoggedIn && state.location.startsWith('/signup')) {
        //     return '/';
        //   } else {
        //     return null;
        //   }
        // },
        routes: [
          GoRoute(
            path: '/',
            name: AppRouteConsts.home,
            builder: (context, state) => HomeScreen(),
          ),
          GoRoute(
            path: '/signup',
            name: AppRouteConsts.signup,
            builder: (context, state) => SignUpScreen(),
          ),
          GoRoute(
            name: AppRouteConsts.login,
            path: '/login',
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                transitionDuration: Duration.zero,
                fullscreenDialog: true,
                key: state.pageKey,
                child: LoginScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: CurveTween(curve: Curves.easeInOutCirc)
                        .animate(animation),
                    child: child,
                  );
                },
              );
            },
          )
        ]);
    return router;
  }
}

import 'package:flutter_tiktok/features/authentication/email_screen.dart';
import 'package:flutter_tiktok/features/authentication/login_screen.dart';
import 'package:flutter_tiktok/features/authentication/sign_up_screen.dart';
import 'package:flutter_tiktok/features/authentication/username_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: SignUpScreen.routeName,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: LoginScreen.routeName,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: UsernameScreen.routeName,
      builder: (context, state) => const UsernameScreen(),
    ),
    GoRoute(
      path: EmailScreen.routeName,
      builder: (context, state) => const EmailScreen(),
    )
  ],
);
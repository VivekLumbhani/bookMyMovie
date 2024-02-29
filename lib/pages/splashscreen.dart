import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bookmymovie/pages/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 5000,
      splash: Container(
        color: Colors.red,
        child: Center(
          child: Text(
            'images/splash.json',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
      nextScreen: const AuthPage(),
      splashIconSize: 400,
      backgroundColor: Colors.red,
    );
  }
}

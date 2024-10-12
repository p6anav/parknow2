import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:splash_screen/home_page.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Lottie.asset('assets/animation/logo.json'),
      ),
      nextScreen: const MyHomePage(title: ''),
      duration: 3500,
      backgroundColor: Colors.orange,
      splashIconSize: 300,
    );
  }
}


import 'package:ai_image/core/core.dart';
import 'package:ai_image/feature/prompt/ui/create_prompt_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: SingleChildScrollView( // Added SingleChildScrollView
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: LottieBuilder.asset(
                "assets/Animation - 1731393957843.json",
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "PixieAI",
              style: font_1_6W(),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      nextScreen: const CreatePromptScreen(),
      duration: 3500,
      splashIconSize: 300,
      backgroundColor: const Color.fromARGB(255, 12, 29, 44),
      centered: true,
    );
  }
}

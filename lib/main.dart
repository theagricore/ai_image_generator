import 'package:ai_image/feature/prompt/ui/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});  


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'PixieAI',
      theme: ThemeData(
       brightness: Brightness.dark,
       scaffoldBackgroundColor: Colors.black,
      ),
      home: SplashScreen(),
    );
  }
}


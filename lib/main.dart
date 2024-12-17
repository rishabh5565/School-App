import 'package:flutter/material.dart';
import './splashscreen/splash_screen.dart';

const Color themeColor = Color(0xFFE2D8ED);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ISB EDU',
      debugShowCheckedModeBanner: false, // Disable the debug banner
      theme: ThemeData(
        primaryColor: themeColor,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: themeColor),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

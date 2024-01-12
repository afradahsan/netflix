import 'package:flutter/material.dart';
import 'package:netflix/view/auth/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.transparent),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          titleMedium: TextStyle(color: Colors.white)
        ),
        scaffoldBackgroundColor: Colors.black,  
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
        iconTheme: const IconThemeData(color: Colors.white)
      ),
      home: const LoginPage()
    );
  }
}
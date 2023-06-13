import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'vi'),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

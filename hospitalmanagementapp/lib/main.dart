import 'package:flutter/material.dart';
import 'package:hospitalmanagementapp/screen/welcome_screen.dart';

void main() => runApp(Hospital());

class Hospital extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black54),
        ),
      ),
      home: WelcomeScreen(),
    );
  }
}

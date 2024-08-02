import 'package:flutter/material.dart';
import 'login_screen.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });

    return const Scaffold(
      backgroundColor: Colors.white, // Set the background color of the Scaffold
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('resources/image/BTRgov-logo.png'),
              width: 100,
              height: 100,
            ),
            SizedBox(height: 20),
            Text('Welcome to BTR GOV', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
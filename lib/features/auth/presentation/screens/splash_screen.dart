import 'package:agroxpert/features/common/presentation/screens/bottom_nav_screen.dart';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void moveNextScreen() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomNavControllerScreen()),
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    moveNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/logo.png", height: 150, width: 150),
      ),
    );
  }
}

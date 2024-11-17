import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hostel_management_app/screens/Dashboards/hostler_dashboard.dart';
import 'package:hostel_management_app/screens/onboarding_screen.dart';
import 'package:hostel_management_app/screens/sign_up_hostler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hostel Management App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(
        splash: SafeArea(
          child: Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/1.png',
                  ),
                  const SizedBox(height: 10),
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(text: 'Hostel'),
                        TextSpan(
                          text: 'Ease',
                          style: TextStyle(color: Colors.green.shade900),
                        ),
                      ],
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        nextScreen: DashboardScreen(),
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}

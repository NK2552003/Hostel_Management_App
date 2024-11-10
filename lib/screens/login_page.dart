import 'package:flutter/material.dart';
import 'package:hostel_management_app/components/custom_text.dart';
import 'package:hostel_management_app/components/google_signin.dart';
import 'package:hostel_management_app/screens/admin_login.dart';
import 'package:hostel_management_app/screens/hostler_login.dart';
import 'package:hostel_management_app/screens/warden_login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(),
                    const SizedBox(height: 60),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "SignIn As",
                        style: TextStyle(
                          color: Colors.green.shade900,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildElevatedButton("Hostler", Colors.green.shade900,
                        "assets/graduated.png", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HostlerLoginPage()),
                      );
                    }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Not Registered?",
                            style: TextStyle(color: Colors.green.shade900),
                          ),
                        ),
                      ],
                    ),
                    _buildElevatedButton(
                        "Warden",
                        const Color.fromARGB(255, 11, 64, 143),
                        "assets/warden.png", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WardenLoginPage()),
                      );
                    }),
                    const SizedBox(height: 20),
                    _buildElevatedButton(
                        "Administrator",
                        const Color.fromARGB(255, 129, 18, 18),
                        "assets/admin.png", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AdminLoginPage()),
                      );
                    }),
                    const SizedBox(height: 40),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: 170, height: 1, color: Colors.grey),
                            const SizedBox(width: 10),
                            const Text("or"),
                            const SizedBox(width: 10),
                            Container(
                                width: 170, height: 1, color: Colors.grey),
                          ],
                        ),
                        const SizedBox(height: 30),
                        // Use the custom GoogleSignInButton widget
                        GoogleSignInButton(
                          onPressed: () {
                            // Handle Google Sign-In logic here
                            print("Google Sign-In clicked");
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildElevatedButton(
      String label, Color color, String iconPath, VoidCallback function) {
    return MouseRegion(
      onEnter: (_) {},
      onExit: (_) {},
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.0),
          gradient: const LinearGradient(
            colors: [
              Colors.black,
              Colors.transparent,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 1.0],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10.0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: function,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: color,
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 0, // Align icon to the left
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 12.0), // Padding for icon
                    child: Image.asset(
                      iconPath,
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
                Center(
                  child: Text(label, style: const TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIconButton(
      IconData icon, Color color, VoidCallback onPressed) {
    return SizedBox(
      width: 70,
      height: 70,
      child: IconButton(
        icon: Icon(icon, color: color, size: 50),
        onPressed: onPressed,
      ),
    );
  }
}

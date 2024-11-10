import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hostel_management_app/components/google_signin.dart';
import 'package:hostel_management_app/components/title_text.dart';

class HostlerLoginPage extends StatefulWidget {
  const HostlerLoginPage({super.key});

  @override
  _HostlerLoginPageState createState() => _HostlerLoginPageState();
}

class _HostlerLoginPageState extends State<HostlerLoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final TextEditingController _emailController = TextEditingController();
  String? _emailError;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _validateEmail() {
    setState(() {
      if (!_emailController.text.endsWith("tulas.edu.in")) {
        _emailError = 'Invalid email. Must end with "tulas.edu.in"';
      } else {
        _emailError = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const TitleText(),
      ),
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // Dismiss the keyboard
        },
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FadeTransition(
                    opacity: _animation,
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/8.svg',
                          height: 280,
                        ),
                        const SizedBox(height: 30),
                        Text("Hostler Sign-In",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.green.shade900))
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  FadeTransition(
                    opacity: _animation,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (_emailError != null)
                          Container(
                            alignment: Alignment.bottomRight,
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 8),
                            width: double.infinity,
                            child: Text(
                              _emailError!,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'College Email',
                            labelStyle: TextStyle(color: Colors.green.shade900),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          onChanged: (value) {
                            _validateEmail();
                          },
                        ),
                        const SizedBox(height: 15),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.green.shade900),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              print("Forgot Password");
                            },
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(color: Colors.green.shade900),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade900,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          onPressed: () {
                            _validateEmail();
                            if (_emailError == null) {
                              print("Log In");
                            }
                          },
                          child: const Text(
                            'Sign In',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 20),
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
                            const SizedBox(height: 20),
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
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {},
                    child: Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                              text: "Not Registered?",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal)),
                          TextSpan(
                              text: " Register Here!",
                              style: TextStyle(color: Colors.green.shade900)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

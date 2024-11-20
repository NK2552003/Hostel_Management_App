import 'package:flutter/material.dart';
import 'package:hostel_management_app/components/custom_dropdown.dart';
import 'package:hostel_management_app/components/custom_text.dart';
import 'package:hostel_management_app/components/custom_textfield.dart';
import 'package:hostel_management_app/components/image_picker.dart';
import 'package:hostel_management_app/screens/login_page.dart';

void main() {
  runApp(const SignupPage());
}

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _termsAccepted = false;
  String? _roomPreference;
  String? building, _gender;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Dismiss the keyboard when tapping outside
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            "Student Registration",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.green.shade900,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: ProfilePictureUploader(),
                ),
                const CustomText(),
                const SizedBox(height: 20),
                const CustomTextField(
                  labled: "Full Name",
                  text: "Enter your full name",
                ),
                const SizedBox(height: 16),
                const CustomTextField(
                    labled: "Date of Birth", text: "YYYY-MM-DD"),
                const SizedBox(height: 16),
                CustomDropdown(
                  labelText: "Gender",
                  items: const [
                    DropdownMenuItem(value: "M", child: Text('Male')),
                    DropdownMenuItem(value: "F", child: Text('Female')),
                    DropdownMenuItem(value: "Other", child: Text('Other')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return "Please select your gender!";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const CustomTextField(labled: "Contact Number", text: ""),
                const SizedBox(height: 16),
                const CustomTextField(labled: "Email Address", text: ""),
                const SizedBox(height: 16),
                const CustomTextField(
                    labled: "Student ID Number (Verify)", text: "College ID"),
                const SizedBox(height: 16),
                const CustomTextField(
                    labled: "Create Password", text: "Enter the password here"),
                const SizedBox(height: 16),
                const CustomTextField(
                    labled: "Confirm Password",
                    text: "Re-enter the password here"),
                const SizedBox(height: 16),
                CustomDropdown(
                  labelText: "Room Preferences",
                  items: const [
                    DropdownMenuItem(value: "Single", child: Text('Single')),
                    DropdownMenuItem(value: "Shared", child: Text('Shared')),
                    DropdownMenuItem(
                        value: "Single AC", child: Text('Single AC')),
                    DropdownMenuItem(
                        value: "Shared AC", child: Text('Shared AC')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _roomPreference = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return "Please select the room preference";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomDropdown(
                  labelText: "Choose Building",
                  items: const [
                    DropdownMenuItem(value: "BH1", child: Text('BH1')),
                    DropdownMenuItem(value: "BH2", child: Text('BH2')),
                    DropdownMenuItem(value: "BH3", child: Text('BH3')),
                    DropdownMenuItem(value: "BH4", child: Text('BH4')),
                    DropdownMenuItem(value: "GH", child: Text('Girls Hostel')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      building = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return "Please select the hostel building";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const CustomTextField(
                    labled: "Enter the Room Number", text: "Example: 101-118"),
                const SizedBox(height: 16),
                const CustomTextField(
                    labled: "Emergency Contact Details",
                    text: "Enter parent's number here"),
                const SizedBox(height: 16),
                const CustomTextField(
                    labled: "Interest & Activities (Optional)", text: ""),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Checkbox(
                      value: _termsAccepted,
                      onChanged: (value) {
                        setState(() {
                          _termsAccepted = value!;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        "I accept the Terms and Conditions",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Submit form
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade900,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 15,
                        ),
                      ),
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade300,
                        foregroundColor: Colors.green.shade900,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 15,
                        ),
                      ),
                      child: const Text(
                        "Already Registered? Sign In",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Privacy Policy | Terms of Service | Support",
                      style: TextStyle(color: Colors.green.shade900),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

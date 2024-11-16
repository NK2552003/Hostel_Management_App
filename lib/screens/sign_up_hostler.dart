import 'package:flutter/material.dart';
import 'package:hostel_management_app/components/custom_dropdown.dart';
import 'package:hostel_management_app/components/custom_text.dart';
import 'package:hostel_management_app/components/custom_textfield.dart';
import 'package:hostel_management_app/components/image_picker.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Center(
            child: Column(
          children: [
            Text(
              "Student Registration",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        )),
        backgroundColor: Colors.green.shade900,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: ProfilePictureUploader(),
              ),
              CustomText(),
              const SizedBox(height: 30),
              CustomTextField(
                labled: "Full Name",
                text: "Enter the Name Here",
              ),
              const SizedBox(height: 12),
              CustomTextField(labled: "Date of Birth", text: "YYYY-MM-DD"),
              const SizedBox(height: 12),
              CustomDropdown(
                labelText: "Gender",
                items: const [
                  DropdownMenuItem(child: Text('Male'), value: "M"),
                  DropdownMenuItem(child: Text('Female'), value: "F"),
                  DropdownMenuItem(child: Text('Other'), value: "Other"),
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
              const SizedBox(height: 12),
              CustomTextField(labled: "Contact Number", text: ""),
              const SizedBox(height: 12),
              CustomTextField(labled: "Email Address", text: ""),
              const SizedBox(height: 12),
              CustomTextField(
                  labled: "Student ID Number (Verify)", text: "College ID"),
              const SizedBox(height: 12),
              CustomTextField(
                  labled: "Create Password", text: "Enter the Password Here"),
              const SizedBox(height: 12),
              CustomTextField(
                  labled: "Confirm Password",
                  text: "Re-enter the password here"),
              const SizedBox(height: 12),
              CustomDropdown(
                labelText: "Room Preferences",
                items: const [
                  DropdownMenuItem(child: Text('Single'), value: "Single"),
                  DropdownMenuItem(child: Text('Shared'), value: "Shared"),
                  DropdownMenuItem(
                      child: Text('Single AC'), value: "Single AC"),
                  DropdownMenuItem(
                      child: Text('Shared AC'), value: "Shared AC"),
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
              const SizedBox(height: 12),
              CustomDropdown(
                labelText: "Choose Building",
                items: const [
                  DropdownMenuItem(child: Text('BH1'), value: "BH1"),
                  DropdownMenuItem(child: Text('BH2'), value: "BH2"),
                  DropdownMenuItem(child: Text('BH3'), value: "BH3"),
                  DropdownMenuItem(child: Text('BH4'), value: "BH4"),
                  DropdownMenuItem(child: Text('Girls Hostel'), value: "GH"),
                ],
                onChanged: (value) {
                  setState(() {
                    building = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return "Please select the boys hostel building";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              CustomTextField(
                  labled: "Enter the Room Number",
                  text: "101-118,201-218,301-318,401-418"),
              const SizedBox(height: 12),
              CustomTextField(
                  labled: "Emergency Contact Details",
                  text: "Enter you parents number here"),
              const SizedBox(height: 12),
              CustomTextField(
                  labled: "Interest & Activities (Optional)", text: ""),
              const SizedBox(height: 12),
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
                  const Text("I accept the Terms and Conditions"),
                ],
              ),
              const SizedBox(height: 12),
              Center(
                child: SizedBox(
                  width: double
                      .infinity, // Ensures the button takes the full width
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Submit form
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade900,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 15,
                      ),
                    ),
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold, // Makes the text bolder
                        letterSpacing:
                            1.2, // Adds slight spacing between letters
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
    );
  }
}
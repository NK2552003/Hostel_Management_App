import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labled;
  final String text;
  const CustomTextField({super.key, required this.labled, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labled,
        hintText: text,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0), // Adjust the radius here
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.green.shade900), // Border color
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
              color: Colors.green.shade900, width: 2.0), // Focused border
        ),
      ),
    );
  }
}

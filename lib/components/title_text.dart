import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Center(
          child: Text.rich(
            TextSpan(
                children: [
                  const TextSpan(text: "Hostel"),
                  TextSpan(
                      text: "Ease",
                      style: TextStyle(color: Colors.green.shade900)),
                ],
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }
}

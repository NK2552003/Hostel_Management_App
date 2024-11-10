import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/1.png",
          width: 60,
        ),
        const SizedBox(
          width: 10,
        ),
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(
                text: "Hostel",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              TextSpan(
                  text: "Ease", style: TextStyle(color: Colors.green.shade900)),
            ],
            style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

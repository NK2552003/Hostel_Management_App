import 'package:flutter/material.dart';

class QuickAccess extends StatefulWidget {
  QuickAccess({super.key});

  @override
  State<QuickAccess> createState() => _QuickAccessState();
}

class _QuickAccessState extends State<QuickAccess> {
  final List<Map<String, dynamic>> buttonData = [
    {
      "image": "assets/room.png",
      "label": "Room Management",
      "color": Colors.green.shade800,
      "onTap": () {},
    },
    {
      "image": "assets/pay.png",
      "label": "Fee Payments",
      "color": Colors.green.shade600,
      "onTap": () {},
    },
    {
      "image": "assets/doc.png",
      "label": "Documentation",
      "color": Colors.teal.shade400,
      "onTap": () {},
    },
    {
      "image": "assets/comm.png",
      "label": "Student Groups",
      "color": Colors.teal.shade600,
      "onTap": () {},
    },
    {
      "image": "assets/security.png",
      "label": "Anti-Ragging",
      "color": Colors.green.shade700,
      "onTap": () {},
    },
    {
      "image": "assets/outing.png",
      "label": "Outings",
      "color": Colors.lightGreen.shade600,
      "onTap": () {},
    },
    {
      "image": "assets/contact.png",
      "label": "Contact Info",
      "color": Colors.amber.shade700, // Soft yellow
      "onTap": () {},
    },
    {
      "image": "assets/help.png",
      "label": "Help Center",
      "color": Colors.blue.shade400,
      "onTap": () {},
    },
    {
      "image": "assets/issue.png",
      "label": "Report an Issue",
      "color": Colors.red.shade400, // Muted red for warnings
      "onTap": () {},
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        children: [
          const Text(
            'Quick Access',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            alignment: WrapAlignment.center,
            children: buttonData.map((item) {
              final String? imagePath = item['image'] as String?;
              final Color color = item['color'] ?? Colors.grey;
              return SizedBox(
                width: 130,
                height: 110,
                child: InkWell(
                  onTap: item['onTap'],
                  borderRadius: BorderRadius.circular(12),
                  child: Card(
                    color: color.withOpacity(0.1),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: color,
                        width: 1.1,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          imagePath ?? 'assets/default.png', // Fallback image
                          width: 40,
                          height: 40,
                          errorBuilder: (context, error, stackTrace) => Icon(
                            Icons.broken_image,
                            size: 40,
                            color: color,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          item['label'] ?? '',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: color.darken(0.3),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

extension ColorUtils on Color {
  /// Darkens the color by [amount] (value between 0 and 1).
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final darkened =
        hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return darkened.toColor();
  }
}

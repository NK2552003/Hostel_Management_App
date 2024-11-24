import 'package:flutter/material.dart';
import 'package:hostel_management_app/components/fee_payments/fee_details.dart';
import 'package:hostel_management_app/screens/Hostler/room_management.dart';

class QuickAccess extends StatefulWidget {
  const QuickAccess({super.key});

  @override
  State<QuickAccess> createState() => _QuickAccessState();
}

class _QuickAccessState extends State<QuickAccess> {
  final List<Map<String, dynamic>> buttonData = [
    {
      "image": "assets/room.png",
      "label": "Room Management",
      "color": const Color.fromARGB(255, 247, 250, 247),
      "onTap": (BuildContext context) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => RoomManagementPage()),
        );
      },
    },
    {
      "image": "assets/pay.png",
      "label": "Fee Payments",
      "color": Colors.green.shade50,
      "onTap": (BuildContext context) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HostelFeeOverview()),
        );
      },
    },
    {
      "image": "assets/doc.png",
      "label": "Documentation",
      "color": Colors.teal.shade50,
      "onTap": (BuildContext context) {
        // Add navigation logic for Documentation here
      },
    },
    {
      "image": "assets/comm.png",
      "label": "Student Groups",
      "color": const Color.fromARGB(255, 217, 229, 228),
      "onTap": (BuildContext context) {
        // Add navigation logic for Student Groups here
      },
    },
    {
      "image": "assets/security.png",
      "label": "Anti-Ragging",
      "color": const Color.fromARGB(255, 207, 232, 208),
      "onTap": (BuildContext context) {
        // Add navigation logic for Anti-Ragging here
      },
    },
    {
      "image": "assets/outing.png",
      "label": "Outings",
      "color": Colors.lightGreen.shade50,
      "onTap": (BuildContext context) {
        // Add navigation logic for Outings here
      },
    },
    {
      "image": "assets/contact.png",
      "label": "Contact Info",
      "color": Colors.amber.shade50,
      "onTap": (BuildContext context) {
        // Add navigation logic for Contact Info here
      },
    },
    {
      "image": "assets/help.png",
      "label": "Help Center",
      "color": Colors.blue.shade50,
      "onTap": (BuildContext context) {
        // Add navigation logic for Help Center here
      },
    },
    {
      "image": "assets/issue.png",
      "label": "Report an Issue",
      "color": Colors.red.shade50,
      "onTap": (BuildContext context) {
        // Add navigation logic for Report an Issue here
      },
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
              final Function(BuildContext)? onTap =
                  item['onTap'] as Function(BuildContext)?;

              return SizedBox(
                width: 130,
                height: 110,
                child: InkWell(
                  onTap: onTap != null
                      ? () => onTap(context)
                      : null, // Safely invoke the onTap
                  borderRadius: BorderRadius.circular(12),
                  child: Card(
                    color: color,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: Colors.green.shade900,
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
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
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

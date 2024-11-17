import 'package:flutter/material.dart';

class QuickAccess extends StatefulWidget {
  QuickAccess({super.key});

  @override
  State<QuickAccess> createState() => _QuickAccessState();
}

class _QuickAccessState extends State<QuickAccess> {
  final List<Map<String, dynamic>> buttonData = [
    {
      "icon": Icons.meeting_room,
      "label": "Room Management",
      "onTap": () {
        // Add navigation or action
      },
    },
    {
      "icon": Icons.payment,
      "label": "Fee Payments",
      "onTap": () {
        // Add navigation or action
      },
    },
    {
      "icon": Icons.book,
      "label": "Documentation",
      "onTap": () {
        // Add navigation or action
      },
    },
    {
      "icon": Icons.report_problem,
      "label": "Report an Issue",
      "onTap": () {
        // Add navigation or action
      },
    },
    {
      "icon": Icons.groups,
      "label": "Student Groups",
      "onTap": () {
        // Add navigation or action
      },
    },
    {
      "icon": Icons.shield,
      "label": "Anti-Ragging",
      "onTap": () {
        // Add navigation or action
      },
    },
    {
      "icon": Icons.holiday_village_rounded,
      "label": "Outings",
      "onTap": () {
        // Add navigation or action
      },
    },
    {
      "icon": Icons.contact_phone,
      "label": "Contact Info",
      "onTap": () {
        // Add navigation or action
      },
    },
    {
      "icon": Icons.help_center,
      "label": "Help Center",
      "onTap": () {
        // Add navigation or action
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
            spacing: 10, // Horizontal space between items
            runSpacing: 10, // Vertical space between items
            alignment: WrapAlignment.center,
            children: buttonData.map((item) {
              return SizedBox(
                width: 130,
                height: 110, // Fixed width and height for each item
                child: InkWell(
                  onTap: item['onTap'], // Trigger assigned action
                  borderRadius: BorderRadius.circular(12), // Ripple shape
                  splashColor: Colors.green.withOpacity(0.2), // Ripple color
                  highlightColor: Colors.green.withOpacity(0.1), // Tap color
                  child: Card(
                    color: Colors.green.shade50,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: Colors.green.shade700, // Border color
                        width: 1, // Border width
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          item['icon'],
                          size: 40,
                          color: Colors.green.shade900,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          item['label'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
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

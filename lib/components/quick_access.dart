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
      child: Column(children: [
        const Text(
          'Quick Access',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Two buttons per row
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.2, // Adjust aspect ratio for layout balance
            ),
            itemCount: buttonData.length,
            itemBuilder: (context, index) {
              final item = buttonData[index];
              return GestureDetector(
                onTap: item['onTap'], // Trigger assigned action
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.green.shade900, // Border color
                      width: 1, // Border width
                    ),
                    borderRadius:
                        BorderRadius.circular(15), // Match Card's borderRadius
                  ),
                  child: Card(
                    color: Colors.green.shade50,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
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
            },
          ),
        )
      ]),
    );
  }
}

import 'package:flutter/material.dart';

class CommunityEvents extends StatelessWidget {
  final List<String> communityEvents = [
    "Blood Donation Camp - 20th Nov",
    "Cleanliness Drive - 25th Nov",
    "Tech Meetup - 28th Nov",
    "Annual Fest - 5th Dec",
  ];

  final List<String> announcements = [
    "Hostel Fees Due - 30th Nov",
    "Maintenance Schedule - 22nd Nov",
    "New Rules for Outings Effective - 1st Dec",
    "Contact Update Reminder",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Center(
            child: Text(
              "Community Events & Announcements",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Match the primary color
              ),
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green.shade50, Colors.green.shade100],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.green.shade700, // Match primary color
                  width: 1.5,
                ),
              ),
              child: ListView(
                children: [
                  // Community Events Section
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.green.shade900, // Light accent for header
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "Community Events",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Darker accent color
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ...communityEvents.map((event) {
                    return Card(
                      color: Colors.white,
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              Colors.green.shade100, // Accent shade
                          child: Icon(
                            Icons.event,
                            color: Colors.green.shade900, // Match darker theme
                          ),
                        ),
                        title: Text(
                          event,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                          color: Colors.green.shade700, // Primary theme color
                        ),
                      ),
                    );
                  }).toList(),
                  const SizedBox(height: 20),
                  const Divider(thickness: 1.5),

                  // Announcements Section
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.green.shade900, // Light accent for header
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "Announcements",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Darker accent color
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ...announcements.map((announcement) {
                    return Card(
                      color: Colors.white,
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              Colors.green.shade100, // Accent shade
                          child: Icon(
                            Icons.announcement,
                            color: Colors.green.shade900, // Match darker theme
                          ),
                        ),
                        title: Text(
                          announcement,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                          color: Colors.green.shade700, // Primary theme color
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

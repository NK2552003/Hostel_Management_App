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
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.green.shade900, // Border color
                  width: 1, // Border width
                ),
              ),
              child: ListView(
                children: [
                  // Community Events Section
                  Text(
                    "Community Events",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade900,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ...communityEvents.map((event) {
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12), // Circular border
                          side: BorderSide(
                            color: Colors.green.shade900, // Border color
                            width: 1, // Border width
                          ),
                        ),
                        tileColor:
                            Colors.green.shade100, // Tile background color
                        leading: Icon(
                          Icons.event,
                          color: Colors.blue.shade900,
                        ),
                        title: Text(
                          event,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(thickness: 2),

                  // Announcements Section
                  Text(
                    "Announcements",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade900,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ...announcements.map((announcement) {
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12), // Circular border
                          side: BorderSide(
                            color: Colors.green.shade900, // Border color
                            width: 1, // Border width
                          ),
                        ),
                        tileColor:
                            Colors.green.shade100, // Tile background color
                        leading: Icon(
                          Icons.announcement,
                          color: Colors.green.shade900,
                        ),
                        title: Text(
                          announcement,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
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

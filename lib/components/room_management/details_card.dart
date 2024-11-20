import 'package:flutter/material.dart';

class RoomDetails extends StatelessWidget {
  const RoomDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      // margin: const EdgeInsets.all(16),
      elevation: 6,
      color: Colors.teal[50],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.teal, width: 1.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Room Details',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade800,
                ),
              ),
              const SizedBox(height: 20),
              // First Row (2 cards)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  RoomCard(title: 'Block', content: 'BH3'),
                  RoomCard(title: 'Room No.', content: '407'),
                ],
              ),
              const SizedBox(height: 10),
              // Second Row (1 card)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  RoomCard(title: 'Occupant Name', content: 'Nitish Kumar'),
                ],
              ),
              const SizedBox(height: 10),
              // Third Row (1 card)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  RoomCard(title: 'Sharing With', content: 'Aditya Sharma'),
                ],
              ),
              const SizedBox(height: 10),
              // Fourth Row (2 cards)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  RoomCard(title: 'Room Preference', content: 'Shared'),
                  RoomCard(title: 'Status', content: 'Occupied'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoomCard extends StatelessWidget {
  final String title;
  final String content;

  const RoomCard({required this.title, required this.content, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: Colors.white,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.green.shade900, width: 1.2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.green.shade900,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  content,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

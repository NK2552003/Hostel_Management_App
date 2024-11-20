import 'package:flutter/material.dart';

void main() {
  runApp(const RoomDetailsApp());
}

class RoomDetailsApp extends StatelessWidget {
  const RoomDetailsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Room Details'),
          backgroundColor: Colors.green,
        ),
        body: const RoomDetails(),
      ),
    );
  }
}

class RoomDetails extends StatelessWidget {
  const RoomDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green.shade50,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.green.shade900)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Room Details',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade900,
                ),
              ),
              const SizedBox(height: 16),
              // First Row (2 cards)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  RoomCard(title: 'Block', content: 'A'),
                  RoomCard(title: 'Room No.', content: '101'),
                ],
              ),
              const SizedBox(height: 6),
              // Second Row (1 card)
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Flexible(
                    child:
                        RoomCard(title: 'Occupant Name', content: 'John Doe'),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              // Third Row (2 cards)
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
        color: Colors.green[50],
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.green.shade900, width: 1.3),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  content,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
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

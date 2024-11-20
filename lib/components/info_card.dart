import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String avatarUrl;
  final String name;
  final String course;
  final String duration;
  final String block;
  final String roomNumber;
  final String stayDuration;
  final Color backgroundColor;

  const InfoCard({
    super.key,
    required this.avatarUrl,
    required this.name,
    required this.course,
    required this.duration,
    required this.block,
    required this.roomNumber,
    required this.stayDuration,
    this.backgroundColor = Colors.white60,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180, // Fixed height for the card
      child: Card(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 1,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.green.shade900, // Border color
              width: 1, // Border width
            ),
            borderRadius:
                BorderRadius.circular(15), // Match Card's borderRadius
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Circle Avatar
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.green.shade900, // Border color
                      width: 1, // Border width
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(avatarUrl),
                    backgroundColor:
                        Colors.grey.shade200, // Fallback background
                  ),
                ),
                const SizedBox(width: 16),
                // Text Content
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      // Course and Duration
                      Row(
                        children: [
                          Text(
                            'Course: ',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              course,
                              style: const TextStyle(fontSize: 14),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Duration: $duration',
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey.shade700),
                      ),
                      const SizedBox(height: 8),
                      // Block and Room
                      Row(
                        children: [
                          Text(
                            'Block: $block',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            'Room: $roomNumber',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // Stay Duration
                      Text(
                        'Stay: $stayDuration',
                        style: const TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

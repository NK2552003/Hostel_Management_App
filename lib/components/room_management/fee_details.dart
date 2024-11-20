import 'package:flutter/material.dart';

class FeeDetailsCard extends StatelessWidget {
  const FeeDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data
    double totalFees = 100000;
    double submittedFees = 52250;
    double outstandingFees = totalFees - submittedFees;
    String lastDate = "30th November 2024";

    // Calculate percentage
    double percentageSubmitted = (submittedFees / totalFees) * 100;

    return Card(
      elevation: 12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              Colors.teal.shade100,
              Colors.green.shade100,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(color: Colors.green.shade900, width: 1.3),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card Title
            Text(
              'Fee Submission Details',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade900,
              ),
            ),
            const SizedBox(height: 20),
            // Circular Progress Indicator for Percentage
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: CircularProgressIndicator(
                      value: percentageSubmitted / 100,
                      strokeWidth: 12,
                      backgroundColor: Colors.blue.shade50,
                      valueColor: AlwaysStoppedAnimation(
                        Colors.green.shade400,
                      ),
                    ),
                  ),
                  Text(
                    '${percentageSubmitted.toStringAsFixed(1)}%',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Fees Submitted
            Row(
              children: [
                const Icon(Icons.attach_money, color: Colors.blue, size: 22),
                const SizedBox(width: 8),
                RichText(
                  text: TextSpan(
                    text: 'Fees Submitted: ',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                    children: [
                      TextSpan(
                        text: '$submittedFees',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const TextSpan(text: ' out of '),
                      TextSpan(
                        text: '$totalFees',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Outstanding Fees
            Row(
              children: [
                const Icon(Icons.warning, color: Colors.redAccent, size: 22),
                const SizedBox(width: 8),
                Text(
                  'Outstanding Fees: $outstandingFees',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Last Date of Submission
            Row(
              children: [
                const Icon(Icons.calendar_today,
                    color: Colors.purple, size: 22),
                const SizedBox(width: 8),
                Text(
                  'Last Date: $lastDate',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

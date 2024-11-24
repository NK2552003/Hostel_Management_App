import 'package:flutter/material.dart';

class PaymentSuccessPage extends StatelessWidget {
  final double amount;
  final String? paymentMethod;
  final String studentName;
  final String hostelName;
  final String roomNumber;

  const PaymentSuccessPage({
    required this.amount,
    this.paymentMethod,
    required this.studentName,
    required this.hostelName,
    required this.roomNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  Center(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.green[50],
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.check,
                              size: 64, color: Colors.green.shade900),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Payment Successful!",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Your payment has been processed successfully.",
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[600]),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Card(
                    color: const Color.fromARGB(255, 234, 244, 236),
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: Colors.green.shade900)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Transaction Details",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                            ),
                          ),
                          const Divider(
                            color: Colors.black87,
                          ),
                          const SizedBox(height: 8),
                          _buildDetailRow("Student Name", studentName),
                          _buildDetailRow("Hostel Name", hostelName),
                          _buildDetailRow("Room Number", roomNumber),
                          _buildDetailRow("Amount Paid",
                              "Rs. ${amount.toStringAsFixed(2)}"),
                          _buildDetailRow(
                              "Payment Method", paymentMethod ?? "Visa"),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade100,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 24,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: Colors.green.shade900)),
                    ),
                    onPressed: () {
                      Navigator.pop(
                          context); // Go back to dashboard or previous page
                    },
                    child: const Text("Back to Dashboard"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade800,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

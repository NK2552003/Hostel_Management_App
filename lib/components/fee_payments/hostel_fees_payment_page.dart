import 'package:flutter/material.dart';
import 'package:hostel_management_app/components/fee_payments/fee_details.dart';
import 'package:hostel_management_app/components/fee_payments/success_page.dart';

class HostelFeePaymentPage extends StatelessWidget {
  final Map<String, dynamic> selectedCard;

  HostelFeePaymentPage({required this.selectedCard});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hostel Fee Payment"),
        backgroundColor: Colors.green.shade100,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Summary Section
            Card(
              color: const Color.fromARGB(255, 239, 246, 239),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.green.shade900),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Hostel Fee Summary",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {
                            // Handle change logic (if applicable)
                          },
                          child: Text(
                            "Change",
                            style: TextStyle(color: Colors.green.shade900),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    _buildDetailRow("Student Name", "Nitish"),
                    const SizedBox(height: 8),
                    _buildDetailRow("Hostel Name", "Himalyan Foundation"),
                    const SizedBox(height: 8),
                    _buildDetailRow("Room Number", "BH3-407"),
                    const SizedBox(height: 8),
                    _buildDetailRow("Duration", "6 Months"),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Payment Summary Section
            Card(
              color: const Color.fromARGB(255, 239, 246, 239),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.green.shade900),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Payment Summary",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const Divider(),
                    _buildDetailRow("Room Fee", "₹24,000"),
                    const SizedBox(height: 8),
                    _buildDetailRow("Mess Fee", "₹15,250"),
                    const SizedBox(height: 8),
                    _buildDetailRow("Security Deposit", "₹5,500"),
                    const SizedBox(height: 8),
                    _buildDetailRow("Discount", "- ₹2000"),
                    const Divider(),
                    _buildDetailRow(
                      "Total Payment",
                      "₹42,750",
                      isBold: true,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Voucher Section
            ListTile(
              leading: const Icon(Icons.card_giftcard, color: Colors.orange),
              title: const Text(
                "You have 1 voucher",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              subtitle: const Text("Save Rs.1000 on your payment."),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  // Handle voucher selection
                },
              ),
              onTap: () {
                // Handle voucher application
              },
            ),
            const SizedBox(height: 16),

            // Payment Method Section
            ListTile(
              leading: const Icon(Icons.payment, color: Colors.blue),
              title: Text(
                "Payment Method: ${selectedCard['cardType'] ?? "Not Selected"}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "Card ending in ${selectedCard['number']?.substring(selectedCard['number']?.length - 4) ?? "XXXX"}",
              ),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  // Navigate to payment method selection (if required)
                },
              ),
            ),
            const SizedBox(height: 16),

            // Payment Button
            ElevatedButton(
              onPressed: () {
                // Navigate to success page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentSuccessPage(
                      amount: 42750,
                      paymentMethod: selectedCard['cardType'],
                      studentName: "Nitish",
                      hostelName: "BH3",
                      roomNumber: "407",
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade100,
                foregroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.green.shade900)),
              ),
              child: const Text(
                "Pay Now",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper Method to Build Detail Rows
  Widget _buildDetailRow(String label, String value, {bool isBold = false}) {
    return Row(
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
          style: TextStyle(
            fontSize: 14,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

// Payment Success Page

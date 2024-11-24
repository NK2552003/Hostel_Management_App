import 'package:flutter/material.dart';

class PaymentDetails extends StatelessWidget {
  final Map<String, dynamic> transaction;

  const PaymentDetails({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    // Determine the status color and icon
    Color statusColor;
    IconData statusIcon;

    switch (transaction["status"]) {
      case "Completed":
        statusColor = Colors.green;
        statusIcon = Icons.check_circle;
        break;
      case "Failed":
        statusColor = Colors.red;
        statusIcon = Icons.cancel;
        break;
      case "Pending":
        statusColor = Colors.orange;
        statusIcon = Icons.hourglass_top;
        break;
      default:
        statusColor = Colors.grey;
        statusIcon = Icons.info;
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 250, 240),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 239, 250, 240),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Recipient Circle Avatar
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.green.shade900,
                child: Text(
                  transaction["to"]?[0] ?? "?",
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Recipient Details
              Text(
                "To ${transaction["to"]}",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),

              // Amount
              Text(
                "₹${transaction["amount"]}",
                style: TextStyle(
                  color: Colors.green.shade900,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              // Status and Date-Time
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(statusIcon, color: statusColor, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    transaction["status"],
                    style: TextStyle(color: statusColor),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                "${transaction["date"]}, ${transaction["time"]}",
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),

              // Conditional "Pay Now" Button for Pending Status
              if (transaction["status"] == "Pending")
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade900,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    // Handle Pay Now action
                    print("Redirecting to payment gateway...");
                  },
                  child: const Text(
                    "Pay Now",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              const SizedBox(height: 20),

              // Transaction Details Card
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.green.shade900),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Bank Name
                      ListTile(
                        leading: Icon(Icons.account_balance,
                            color: Colors.orange[300]),
                        title: Text(
                          transaction["bankName"] ?? "Bank Name",
                          style: const TextStyle(color: Colors.black),
                        ),
                        subtitle: Text(
                          "UPI transaction ID: ${transaction["transactionId"]}",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 129, 129, 129)),
                        ),
                      ),
                      const Divider(color: Color.fromARGB(255, 129, 129, 129)),

                      // To and From
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Text("To: "),
                            const SizedBox(width: 28),
                            Expanded(
                              child: Text(
                                "${transaction["upiId"]}",
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 129, 129, 129)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Text("From: "),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                "${transaction["from"]}",
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 129, 129, 129)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Text("UpiId: "),
                            const SizedBox(width: 10),
                            Text(
                              transaction["fromUpiId"] ?? "",
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 129, 129, 129)),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Text("UTR Id: "),
                            const SizedBox(width: 1),
                            Expanded(
                              child: Text(
                                "${transaction["UTR"]}",
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 129, 129, 129)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 80),

              // Footer Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _footerButton(Icons.help_outline, "Having issues?"),
                  _footerButton(Icons.share, "Share"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _footerButton(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.black),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(color: Colors.black, fontSize: 12),
        ),
      ],
    );
  }
}

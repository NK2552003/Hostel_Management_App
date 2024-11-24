import 'package:flutter/material.dart';

class TransactionHistory extends StatefulWidget {
  @override
  _TransactionHistoryState createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  String selectedStatus = "All";
  String selectedPaymentMethod = "All Methods";
  String selectedTime = "This Month";

  final List<Map<String, dynamic>> transactions = [
    {
      "to": "Himalyan Foundation",
      "date": "23 Nov 2023",
      "amount": "48,750",
      "status": "Completed",
    },
    {
      "to": "Himalyan Foundation",
      "date": "12 Jan 2024",
      "amount": "5,000",
      "status": "Failed",
    },
    {
      "to": "Himalyan Foundation",
      "date": "15 Jan 2024",
      "amount": "5,000",
      "status": "Completed",
    },
    {
      "to": "Himalyan Foundation",
      "date": "22 Nov 2024",
      "amount": "48,750",
      "status": "Pending",
    },
  ];

  void _showAccountDetails() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Container(
        height: 200,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Account Details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Divider(),
            ListTile(
              title: Text("Punjab National Bank"),
              onTap: () {
                setState(() {
                  selectedPaymentMethod = "PNB";
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("UPI"),
              onTap: () {
                setState(() {
                  selectedPaymentMethod = "UPI";
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.green.shade900)),
            color: const Color.fromARGB(255, 238, 245, 239),
            elevation: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // First Row: Heading and "See All" button
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Transaction History",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade900,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Action for "See All" button
                        },
                        child: Text(
                          "See All",
                          style: TextStyle(color: Colors.green.shade900),
                        ),
                      ),
                    ],
                  ),
                ),

                // Second Row: Filter buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        // Status Filter
                        FilterButton(
                          label: selectedStatus,
                          options: ["All", "Completed", "Failed", "Pending"],
                          onChanged: (value) {
                            setState(() {
                              selectedStatus = value ?? "All";
                            });
                          },
                        ),
                        SizedBox(width: 16),

                        // Payment Method Filter
                        ElevatedButton(
                          onPressed: _showAccountDetails,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade900,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            selectedPaymentMethod,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 16),

                        // Time Filter
                        FilterButton(
                          label: selectedTime,
                          options: ["This Month", "This Year", "Previous Year"],
                          onChanged: (value) {
                            setState(() {
                              selectedTime = value ?? "This Month";
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),

                // Third Row: Transaction List
                Flexible(
                  child: ListView.builder(
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      final transaction = transactions[index];

                      // Extract the year from the transaction's date
                      final transactionYear =
                          int.parse(transaction["date"].split(" ").last);

                      // Time-based filtering logic
                      if (selectedTime == "This Year" &&
                          transactionYear != DateTime.now().year) {
                        return SizedBox
                            .shrink(); // Exclude transactions not in the current year
                      } else if (selectedTime == "Previous Year" &&
                          transactionYear != DateTime.now().year - 1) {
                        return SizedBox
                            .shrink(); // Exclude transactions not in the previous year
                      }

                      // Status-based filtering logic
                      if (selectedStatus != "All" &&
                          transaction["status"] != selectedStatus) {
                        return SizedBox
                            .shrink(); // Exclude transactions with a different status
                      }

                      // Payment method-based filtering logic
                      if (selectedPaymentMethod != "All Methods" &&
                          !selectedPaymentMethod.contains(transaction["to"])) {
                        return SizedBox
                            .shrink(); // Exclude transactions not matching the payment method
                      }

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

                      return Card(
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          tileColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(color: Colors.green.shade900),
                          ),
                          leading: CircleAvatar(
                            backgroundColor: statusColor.withOpacity(0.2),
                            child: Icon(
                              statusIcon,
                              color: statusColor,
                              size: 18,
                            ),
                          ),
                          title: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  transaction["to"],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          subtitle: Text(transaction["date"]),
                          trailing: Text(
                            transaction["amount"],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.green.shade900,
                            ),
                          ),
                        ),
                      );
                    },
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

class FilterButton extends StatelessWidget {
  final String label;
  final List<String> options;
  final ValueChanged<String?> onChanged; // Allow nullable String

  const FilterButton({
    required this.label,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: label,
      items: options
          .map((option) => DropdownMenuItem<String>(
                value: option,
                child: Text(option),
              ))
          .toList(),
      onChanged: onChanged, // Works with nullable String
      style: TextStyle(color: Colors.green.shade900),
      dropdownColor: Colors.white,
      borderRadius: BorderRadius.circular(12),
      elevation: 3,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hostel_management_app/components/fee_payments/hostel_fees_payment_page.dart';

void main() {
  runApp(MaterialApp(home: PaymentPage()));
}

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Payment Page")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              backgroundColor: Colors.white,
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              builder: (context) => PaymentMethodSheet(),
            );
          },
          child: const Text("Pay Dues"),
        ),
      ),
    );
  }
}

class PaymentMethodSheet extends StatefulWidget {
  @override
  _PaymentMethodSheetState createState() => _PaymentMethodSheetState();
}

class _PaymentMethodSheetState extends State<PaymentMethodSheet> {
  // List to hold card data
  List<Map<String, String>> cards = [
    {
      "name": "Satish Kumar",
      "number": "**** **** **** 6767",
      "expDate": "08/2028",
      "cvv": "4563",
      "type": "Primary",
      "cardType": "Visa"
    },
    {
      "name": "Nitish Kumar",
      "number": "**** **** **** 0035",
      "type": "",
      "expDate": "02/2030",
      "cvv": "8790",
      "cardType": "MasterCard"
    },
  ];

  int selectedCardIndex = 0; // Default selection

  void _addNewCard(
      String name, String number, String type, String expDate, String cvv) {
    setState(() {
      cards.add({
        "name": name,
        "number": number,
        "cardType": type,
        "type": "",
        "expDate": expDate,
        "cvv": cvv
      });
    });
  }

  void _selectCard(int index) {
    setState(() {
      selectedCardIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Choose payment method",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Display Cards
            ...cards.asMap().entries.map((entry) {
              int index = entry.key;
              Map<String, String> card = entry.value;

              return GestureDetector(
                onTap: () => _selectCard(index),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: index == selectedCardIndex
                        ? Colors.blue.shade50
                        : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: index == selectedCardIndex
                            ? Colors.blue.shade100
                            : Colors.grey.shade300),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Icon(Icons.payment,
                          color: index == selectedCardIndex
                              ? Colors.blue
                              : Colors.black),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            card["name"]!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(card["number"]!),
                        ],
                      ),
                      const Spacer(),
                      if (card["type"] == "primary")
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade100,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            card["type"]!,
                            style: const TextStyle(
                                color: Colors.blue, fontSize: 12),
                          ),
                        ),
                      const SizedBox(width: 8),
                      if (index == selectedCardIndex)
                        const Icon(Icons.check_circle, color: Colors.blue),
                    ],
                  ),
                ),
              );
            }).toList(),

            // Add new card
            GestureDetector(
              onTap: () {
                _showAddCardDialog(context);
              },
              child: const Row(
                children: [
                  Icon(Icons.add, color: Colors.blue),
                  SizedBox(width: 8),
                  Text(
                    "Add new card",
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Security Notice
            Container(
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(12),
              child: const Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.green),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "We adhere entirely to the data security standards of the payment card industry.",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Continue Button
            ElevatedButton(
              onPressed: () {
                // Handle continue logic
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HostelFeePaymentPage(
                      selectedCard:
                          cards[selectedCardIndex], // Pass the selected card
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
                "Continue",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddCardDialog(BuildContext context) {
    final nameController = TextEditingController();
    final numberController = TextEditingController();
    final expDateController = TextEditingController();
    final cvvController = TextEditingController();
    String cardType = "Visa"; // Default card type

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: Colors.green.shade900)),
          title: const Text(
            "Add New Card",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Cardholder Name
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "Cardholder Name",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 16),

                // Card Number
                TextField(
                  controller: numberController,
                  decoration: InputDecoration(
                    labelText: "Card Number",
                    prefixIcon: Icon(Icons.credit_card),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    helperText: "Enter your 16-digit card number",
                  ),
                  keyboardType: TextInputType.number,
                  obscureText: true, // Mask the input for security
                  maxLength: 16, // Limit card number length
                ),
                const SizedBox(height: 16),

                // Expiration Date and CVV
                Row(
                  children: [
                    // Expiration Date
                    Expanded(
                      child: TextField(
                        controller: expDateController,
                        decoration: InputDecoration(
                          labelText: "Expiry Date",
                          hintText: "MM/YY",
                          prefixIcon: Icon(Icons.calendar_today),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        keyboardType: TextInputType.datetime,
                        maxLength: 5, // For "MM/YY" format
                      ),
                    ),
                    const SizedBox(width: 16),
                    // CVV
                    Expanded(
                      child: TextField(
                        controller: cvvController,
                        decoration: InputDecoration(
                          labelText: "CVV",
                          hintText: "123",
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        keyboardType: TextInputType.number,
                        obscureText: true, // Mask CVV for security
                        maxLength: 3,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Card Type Dropdown
                DropdownButtonFormField<String>(
                  value: cardType,
                  items: const [
                    DropdownMenuItem(value: "Visa", child: Text("Visa")),
                    DropdownMenuItem(
                        value: "MasterCard", child: Text("MasterCard")),
                    DropdownMenuItem(
                        value: "American Express",
                        child: Text("American Express")),
                    DropdownMenuItem(
                        value: "Discover", child: Text("Discover")),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      cardType = value;
                    }
                  },
                  decoration: InputDecoration(
                    labelText: "Card Type",
                    prefixIcon: Icon(Icons.payment),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 16),

                // Security Notice
                Row(
                  children: [
                    const Icon(Icons.shield, color: Colors.green),
                    const SizedBox(width: 8),
                    Expanded(
                      child: const Text(
                        "Your card details are securely encrypted and stored.",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              style:
                  TextButton.styleFrom(foregroundColor: Colors.green.shade900),
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                // Validate Inputs
                if (nameController.text.isEmpty) {
                  _showErrorDialog(
                      context, "Please enter the cardholder name.");
                  return;
                }
                if (numberController.text.length != 16) {
                  _showErrorDialog(context, "Card number must be 16 digits.");
                  return;
                }
                if (expDateController.text.isEmpty ||
                    !RegExp(r"^(0[1-9]|1[0-2])\/?([0-9]{2})$")
                        .hasMatch(expDateController.text)) {
                  _showErrorDialog(
                      context, "Invalid expiry date. Use MM/YY format.");
                  return;
                }
                if (cvvController.text.length != 3) {
                  _showErrorDialog(context, "CVV must be 3 digits.");
                  return;
                }

                // Add new card to the list
                _addNewCard(
                    "${cardType.toUpperCase()} - ${nameController.text}",
                    "**** **** **** ${numberController.text.substring(12)}",
                    cardType.toString(),
                    expDateController.text,
                    cvvController.text);

                Navigator.pop(context); // Close dialog
              },
              child: const Text("Add Card"),
              style: TextButton.styleFrom(
                backgroundColor: Colors.green.shade100,
                foregroundColor: Colors.black,
                side: BorderSide(color: Colors.green.shade900),
              ),
            ),
          ],
        );
      },
    );
  }

// Error Dialog to show validation errors
  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Error"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}

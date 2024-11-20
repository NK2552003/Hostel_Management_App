import 'package:flutter/material.dart';

class RequestRoomChangeForm extends StatelessWidget {
  const RequestRoomChangeForm({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController reasonController = TextEditingController();
    final TextEditingController preferredRoomController =
        TextEditingController();

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16,
          right: 16,
          top: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Room Change Request",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Reason Input Field
            TextField(
              controller: reasonController,
              decoration: InputDecoration(
                labelText: "Reason for Room Change",
                hintText: "Explain why you need to change the room",
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
                prefixIcon: const Icon(Icons.question_mark),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            // Preferred Room Input Field
            TextField(
              controller: preferredRoomController,
              decoration: InputDecoration(
                labelText: "Preferred Room",
                hintText: "Enter the preferred room location or number",
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
                prefixIcon: const Icon(Icons.location_on),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (reasonController.text.isEmpty ||
                    preferredRoomController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Please fill out all the fields before submitting.",
                      ),
                    ),
                  );
                } else {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content:
                          Text("Room change request submitted successfully!"),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.blue,
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text("Submit Request"),
            ),
          ],
        ),
      ),
    );
  }
}

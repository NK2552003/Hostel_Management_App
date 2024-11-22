import 'package:flutter/material.dart';

class RequestRoomChangeForm extends StatelessWidget {
  final Function({
    required String currentRoom,
    required String preferredRoom,
    required String reason,
    required String urgency,
    required String contact,
    String? notes,
  }) onSubmit;

  const RequestRoomChangeForm({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    final TextEditingController reasonController = TextEditingController();
    final TextEditingController preferredRoomController =
        TextEditingController();
    final TextEditingController currentRoomController = TextEditingController();
    final TextEditingController notesController = TextEditingController();
    final TextEditingController contactController = TextEditingController();

    String? selectedReason;
    String? urgency = "Medium";

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 16,
            left: 16,
            right: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Room Change Request",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade900),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Current Room Input
            TextField(
              controller: currentRoomController,
              decoration: InputDecoration(
                labelText: "Current Room",
                hintText: "Enter your current room location or number",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.green.shade900, width: 1.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.meeting_room),
              ),
            ),
            const SizedBox(height: 16),
            // Reason Type Dropdown
            DropdownButtonFormField<String>(
              value: selectedReason,
              onChanged: (value) {
                selectedReason = value;
              },
              decoration: InputDecoration(
                labelText: "Reason Type",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              items: [
                "Noise Issues",
                "Maintenance Problems",
                "Roommate Conflict",
                "Other",
              ].map((reason) {
                return DropdownMenuItem(
                  value: reason,
                  child: Text(reason),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            // Reason Input
            TextField(
              controller: reasonController,
              decoration: InputDecoration(
                labelText: "Reason Details",
                hintText: "Explain why you need to change the room",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.green.shade900, width: 1.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.question_mark),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            // Urgency Dropdown
            DropdownButtonFormField<String>(
              value: urgency,
              onChanged: (value) {
                urgency = value!;
              },
              decoration: InputDecoration(
                labelText: "Urgency Level",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              items: ["Low", "Medium", "High"].map((level) {
                return DropdownMenuItem(
                  value: level,
                  child: Text(level),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            // Preferred Room Input
            TextField(
              controller: preferredRoomController,
              decoration: InputDecoration(
                labelText: "Preferred Room",
                hintText: "Enter the preferred room location or number",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.green.shade900, width: 1.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.location_on),
              ),
            ),
            const SizedBox(height: 16),
            // Preferred Move-in Date
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: "Preferred Move-in Date",
                hintText: "Select a date",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                prefixIcon: const Icon(Icons.calendar_today),
              ),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 365)),
                );
                if (pickedDate != null) {
                  // Format date to display
                }
              },
            ),
            const SizedBox(height: 16),
            // Additional Notes
            TextField(
              controller: notesController,
              decoration: InputDecoration(
                labelText: "Additional Notes",
                hintText: "Add any extra details",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.green.shade900, width: 1.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.note_alt),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 16),
            // Contact Information
            TextField(
              controller: contactController,
              decoration: InputDecoration(
                labelText: "Contact Number",
                hintText: "Enter your phone number",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.green.shade900, width: 1.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.phone),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (reasonController.text.isEmpty ||
                    preferredRoomController.text.isEmpty ||
                    currentRoomController.text.isEmpty ||
                    contactController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Please fill out all the required fields before submitting.",
                      ),
                    ),
                  );
                } else {
                  onSubmit(
                    currentRoom: currentRoomController.text,
                    preferredRoom: preferredRoomController.text,
                    reason: reasonController.text,
                    urgency: urgency!,
                    contact: contactController.text,
                    notes: notesController.text,
                  );
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
                backgroundColor: Colors.green.shade900,
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text("Submit Request"),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}

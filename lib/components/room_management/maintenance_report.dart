import 'package:flutter/material.dart';

class MaintenanceReportCard extends StatefulWidget {
  const MaintenanceReportCard({super.key});

  @override
  _MaintenanceReportCardState createState() => _MaintenanceReportCardState();
}

class _MaintenanceReportCardState extends State<MaintenanceReportCard> {
  // List to store maintenance reports
  List<Map<String, String>> maintenanceReports = [];

  final TextEditingController issueController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController roomController = TextEditingController();
  final TextEditingController studentIdController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  void _createReport() {
    // Show a modal bottom sheet to create a maintenance report
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allow resizing when the keyboard is open
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        String selectedCategory = "Plumbing"; // Default category
        String urgencyLevel = "Low"; // Default urgency
        bool allowEntry = false; // Default permission for room entry

        return Padding(
          padding: EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: StatefulBuilder(
            builder: (context, setState) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Title
                    Text(
                      "Maintenance Request",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal.shade800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),

                    // Full Name
                    TextField(
                      controller: fullNameController,
                      decoration: InputDecoration(
                        labelText: "Full Name",
                        hintText: "Enter your full name",
                        focusColor: Colors.green,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        prefixIcon: const Icon(Icons.person),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Hostel Block/Room Number
                    TextField(
                      controller: roomController,
                      decoration: InputDecoration(
                        labelText: "Hostel Block/Room Number",
                        hintText: "E.g., Block A, Room 101",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        prefixIcon: const Icon(Icons.room),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Student ID
                    TextField(
                      controller: studentIdController,
                      decoration: InputDecoration(
                        labelText: "Student ID",
                        hintText: "Enter your student ID",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        prefixIcon: const Icon(Icons.badge),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Category of Maintenance
                    DropdownButtonFormField<String>(
                      value: selectedCategory,
                      items: [
                        "Plumbing",
                        "Electrical",
                        "Cleaning",
                        "Furniture/Appliances",
                        "Internet",
                        "Others"
                      ]
                          .map((category) => DropdownMenuItem(
                                value: category,
                                child: Text(category),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCategory = value!;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: "Category of Maintenance",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Issue Description
                    TextField(
                      controller: issueController,
                      decoration: InputDecoration(
                        labelText: "Description of the Issue",
                        hintText: "Explain the issue in detail",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        prefixIcon: const Icon(Icons.report_problem),
                      ),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 16),

                    // Urgency Level
                    DropdownButtonFormField<String>(
                      value: urgencyLevel,
                      items: ["Low", "Medium", "High"]
                          .map((level) => DropdownMenuItem(
                                value: level,
                                child: Text(level),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          urgencyLevel = value!;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: "Urgency Level",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Contact Number
                    TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                        hintText: "Enter your contact number",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        prefixIcon: const Icon(Icons.phone),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Permission to Enter Room
                    CheckboxListTile(
                      value: allowEntry,
                      onChanged: (value) {
                        setState(() {
                          allowEntry = value!;
                        });
                      },
                      title: const Text(
                          "Do you allow maintenance personnel to enter your room in your absence?"),
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                    const SizedBox(height: 16),

                    // Submit Button
                    ElevatedButton(
                      onPressed: () {
                        _submitMaintenanceReport(
                          selectedCategory,
                          urgencyLevel,
                          allowEntry,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.teal.shade800,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: const Text("Submit"),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

// Submit Function
  void _submitMaintenanceReport(
      String category, String urgency, bool allowEntry) {
    if (fullNameController.text.isEmpty ||
        roomController.text.isEmpty ||
        studentIdController.text.isEmpty ||
        issueController.text.isEmpty ||
        phoneController.text.isEmpty) {
      // Show an error message if any input is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Please fill out all required fields."),
          backgroundColor: Colors.red.shade300,
        ),
      );
      return;
    }

    // Add the new maintenance report
    setState(() {
      maintenanceReports.add({
        'fullName': fullNameController.text.trim(),
        'room': roomController.text.trim(),
        'studentId': studentIdController.text.trim(),
        'category': category,
        'description': issueController.text.trim(),
        'urgency': urgency,
        'phone': phoneController.text.trim(),
        'allowEntry': allowEntry ? "Yes" : "No",
        'date': _formattedDate(),
        'status': "Pending", // Add status key
      });
    });

    // Clear all input fields and close the modal
    fullNameController.clear();
    roomController.clear();
    studentIdController.clear();
    issueController.clear();
    phoneController.clear();
    Navigator.pop(context);
  }

  String _formattedDate() {
    final DateTime now = DateTime.now();
    return "${now.day}${_daySuffix(now.day)} ${_monthName(now.month)} ${now.year}";
  }

  String _daySuffix(int day) {
    if (day >= 11 && day <= 13) return "th";
    switch (day % 10) {
      case 1:
        return "st";
      case 2:
        return "nd";
      case 3:
        return "rd";
      default:
        return "th";
    }
  }

  String _monthName(int month) {
    const months = [
      "Jan",
      "Feb",
      "March",
      "April",
      "May",
      "June",
      "July",
      "Aug",
      "Sept",
      "Oct",
      "Nov",
      "Dec"
    ];
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green.shade900),
          borderRadius: BorderRadius.circular(12),
          color: Colors.teal.shade50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Maintenance Reports",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade900,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: _createReport,
                  icon: const Icon(Icons.add),
                  label: const Text("Create"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade900,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Content
            maintenanceReports.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: maintenanceReports.length,
                    itemBuilder: (context, index) {
                      final report = maintenanceReports[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8), // Add spacing between cards
                        decoration: BoxDecoration(
                          color: Colors.white, // Background color for the tile
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: Colors.teal.shade800, width: 1.5),
                        ),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          contentPadding:
                              const EdgeInsets.all(12), // Inner padding
                          title: Container(
                            margin: EdgeInsets.only(bottom: 8),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.green.shade900),
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.teal.shade50,
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.report,
                                    size: 40, color: Colors.green.shade900),
                                SizedBox(width: 8),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      // Navigate to a new blank screen
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => BlankScreen(
                                              report:
                                                  report), // Replace with your desired screen
                                        ),
                                      );
                                    },
                                    child: Text(
                                      report['description'] ??
                                          "Unknown Description",
                                      style: TextStyle(
                                        color: Colors.green.shade900,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red),
                                  onPressed: () {
                                    // Handle delete action
                                    // Define this method to remove the tile
                                  },
                                ),
                              ],
                            ),
                          ),

                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, top: 3, bottom: 3),
                                decoration: BoxDecoration(
                                    color: report['status'] == "Pending"
                                        ? Colors.red.shade50
                                        : Colors.green.shade50,
                                    border: Border.all(color: Colors.red),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Column(
                                  children: [
                                    Text(
                                      "Status: ${report['status']}",
                                      style: TextStyle(
                                        color: report['status'] == "Pending"
                                            ? Colors.red
                                            : Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: Colors.grey.shade900,
                                    )),
                                child: Text(
                                  report['date']!,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text(
                      "Nothing to see here.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class BlankScreen extends StatelessWidget {
  final Map<String, dynamic> report;

  const BlankScreen({Key? key, required this.report}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Report Details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green.shade200,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            elevation: 0,
            shadowColor: Colors.teal.shade100,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header with animation
                  Center(
                    child: Hero(
                      tag: 'report-${report['studentId']}',
                      child: Icon(
                        Icons.report,
                        size: 80,
                        color: Colors.green.shade900,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: Text(
                      "Maintenance Report",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade900,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Divider(color: Colors.green.shade200, thickness: 1.5),
                  // Details
                  buildDetailRow("Full Name", report['fullName']),
                  buildDetailRow("Room", report['room']),
                  buildDetailRow("Student ID", report['studentId']),
                  buildDetailRow("Category", report['category']),
                  buildDetailRow("Description", report['description']),
                  buildDetailRow("Urgency", report['urgency']),
                  buildDetailRow("Phone", report['phone']),
                  buildDetailRow("Allow Entry", report['allowEntry']),
                  buildDetailRow("Date", report['date']),
                  buildDetailRow("Status", report['status'],
                      color: Colors.redAccent),
                  SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade900,
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Close",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDetailRow(String title, String value, {Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              "$title:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.green.shade900,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: color ?? Colors.black87,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

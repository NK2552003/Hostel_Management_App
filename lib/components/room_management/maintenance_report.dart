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

  void _createReport() {
    // Open the form to create a maintenance report
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allow resizing with the keyboard
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
              Container(
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.2),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: TextField(
                  controller: issueController,
                  decoration: InputDecoration(
                    labelText: "Issue Description",
                    hintText: "Describe the issue in detail",
                    labelStyle: TextStyle(color: Colors.green.shade900),
                    hintStyle: TextStyle(color: Colors.green.shade300),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.green.shade900, width: 1.5),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    prefixIcon: Icon(Icons.report_problem,
                        color: Colors.green.shade800),
                  ),
                  maxLines: 3,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (issueController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                            "Please enter a valid issue description."),
                        backgroundColor: Colors.red.shade300,
                      ),
                    );
                  } else {
                    setState(() {
                      maintenanceReports.add({
                        'title': issueController.text,
                        'status': 'Pending',
                        'date': _formattedDate(),
                      });
                    });
                    issueController.clear(); // Clear the input
                    Navigator.pop(context); // Close the modal
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.green.shade900,
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
    );
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
                                border:
                                    Border.all(color: Colors.green.shade900),
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.teal.shade50),
                            child: Row(
                              children: [
                                Icon(Icons.report,
                                    size: 40, color: Colors.green.shade900),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    report['title']!,
                                    style: TextStyle(
                                      color: Colors.green.shade900,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
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
                                child: Text(
                                  "Status: ${report['status']}",
                                  style: TextStyle(
                                    color: report['status'] == "Pending"
                                        ? Colors.red
                                        : Colors.green,
                                  ),
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

import 'package:flutter/material.dart';

class MaintenanceReportCard extends StatefulWidget {
  const MaintenanceReportCard({super.key});

  @override
  _MaintenanceReportCardState createState() => _MaintenanceReportCardState();
}

class _MaintenanceReportCardState extends State<MaintenanceReportCard> {
  // List to store maintenance reports
  List<Map<String, String>> maintenanceReports = [];

  void _createReport() {
    // Open the form to create a maintenance report
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) => MaintenanceRequestForm(
        onSubmit: (String issueDescription) {
          setState(() {
            maintenanceReports.add({
              'title': issueDescription,
              'status': 'Pending',
              'date': _formattedDate(),
            });
          });
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Report submitted successfully!"),
            ),
          );
        },
      ),
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
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
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
                    color: Colors.blue.shade800,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: _createReport,
                  icon: const Icon(Icons.add),
                  label: const Text("Create"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
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
                    itemCount: maintenanceReports.length,
                    itemBuilder: (context, index) {
                      final report = maintenanceReports[index];
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(Icons.report, color: Colors.blue),
                        title: Text(
                          report['title']!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          "Status: ${report['status']}",
                          style: TextStyle(
                            color: report['status'] == "Pending"
                                ? Colors.red
                                : Colors.green,
                          ),
                        ),
                        trailing: Text(
                          report['date']!,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
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

class MaintenanceRequestForm extends StatelessWidget {
  final void Function(String issueDescription) onSubmit;

  const MaintenanceRequestForm({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    final TextEditingController issueController = TextEditingController();

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Maintenance Request",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: issueController,
              decoration: InputDecoration(
                labelText: "Issue Description",
                hintText: "Describe the issue in detail",
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
                prefixIcon: const Icon(Icons.report_problem),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (issueController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please enter a valid issue description."),
                    ),
                  );
                } else {
                  onSubmit(issueController.text);
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.blue,
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}

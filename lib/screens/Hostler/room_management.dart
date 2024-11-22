import 'package:flutter/material.dart';
import 'package:hostel_management_app/components/custom_appbar.dart';
import 'package:hostel_management_app/components/custom_drawer.dart';
import 'package:hostel_management_app/components/room_management/details_card.dart';
import 'package:hostel_management_app/components/room_management/maintenance_report.dart';
import 'package:hostel_management_app/components/room_management/request_form.dart';

class RoomManagementPage extends StatefulWidget {
  @override
  _RoomManagementPageState createState() => _RoomManagementPageState();
}

class _RoomManagementPageState extends State<RoomManagementPage> {
  List<Map<String, dynamic>> roomChangeRequests = [];

  // Function to simulate form submission
  void _submitRoomChangeRequest({
    required String currentRoom,
    required String preferredRoom,
    required String reason,
    required String urgency,
    required String contact,
    String? notes,
  }) {
    setState(() {
      roomChangeRequests.add({
        'currentRoom': currentRoom,
        'preferredRoom': preferredRoom,
        'reason': reason,
        'urgency': urgency,
        'contact': contact,
        'notes': notes,
        'status': 'Pending',
      });
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Room change request submitted!")),
    );
  }

  // Function to show the room change form
  void _showRequestRoomChangeForm() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return RequestRoomChangeForm(
          onSubmit: _submitRoomChangeRequest,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: CustomDrawer(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppbar(
          title: "Room Management",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const RoomDetails(),
              const SizedBox(height: 10),
              const MaintenanceReportCard(),
              const SizedBox(height: 20),
              if (roomChangeRequests.isNotEmpty)
                ...roomChangeRequests.map((request) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 4, right: 4),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.green.shade900),
                        ),
                        child: ListTile(
                          tileColor: Colors.teal.shade50,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          contentPadding: const EdgeInsets.all(16),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Room Change Request",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal.shade800,
                                ),
                              ),
                              const SizedBox(height: 8),
                              detailRow("Current Room", request['currentRoom']),
                              detailRow(
                                  "Preferred Room", request['preferredRoom']),
                              detailRow("Reason", request['reason']),
                              detailRow("Urgency", request['urgency']),
                              detailRow("Contact", request['contact']),
                              if (request['notes'] != null &&
                                  request['notes']!.isNotEmpty)
                                detailRow("Notes", request['notes']),
                            ],
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: request['status'] == "Pending"
                                      ? Colors.orange.shade50
                                      : Colors.green.shade50,
                                  border: Border.all(
                                    color: request['status'] == "Pending"
                                        ? Colors.orange
                                        : Colors.green,
                                  ),
                                ),
                                child: Text(
                                  "Status: ${request['status']}",
                                  style: TextStyle(
                                    color: request['status'] == "Pending"
                                        ? Colors.orange
                                        : Colors.green,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    roomChangeRequests.remove(request);
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Request deleted."),
                                    ),
                                  );
                                },
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList()
              else
                Center(
                  child: Text(
                    "No requests yet.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _showRequestRoomChangeForm,
                icon: const Icon(Icons.add),
                label: const Text("Request Room Change"),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  backgroundColor: Colors.green.shade900,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget to display a labeled row
  Widget detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              "$label:",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade900,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

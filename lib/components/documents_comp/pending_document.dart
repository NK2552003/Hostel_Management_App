import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

class PendingDocumentsWidget extends StatefulWidget {
  @override
  _PendingDocumentsWidgetState createState() => _PendingDocumentsWidgetState();
}

class _PendingDocumentsWidgetState extends State<PendingDocumentsWidget> {
  // List of documents with their statuses
  final List<Map<String, String>> pendingDocuments = [
    {"name": "Aadhar Card", "status": "Pending"},
    {"name": "PAN Card", "status": "Pending"},
    {"name": "Bank Statement", "status": "Uploaded"},
    {"name": "Passport", "status": "Pending"},
    {"name": "Utility Bill", "status": "Uploaded"},
    {"name": "Images", "status": "Pending"}
  ];

  final List<Map<String, String>> uploadedFiles = [];

  // File picker and upload functionality
  void uploadFile(String documentName) async {
    // Open file picker
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['doc', 'docx', 'pdf', 'xls', 'xlsx', 'png', 'jpg'],
    );

    if (result != null) {
      // Get the selected file name and path
      String fileName = result.files.single.name;
      String? filePath = result.files.single.path;

      // Check if the uploaded file matches the required document name
      if (!_isValidFile(fileName, documentName)) {
        _showErrorDialog(
          "Invalid Document",
          "The uploaded file does not match the required document ($documentName). Please upload the correct file.",
        );
        return;
      }

      // Update the uploaded files list and document status
      setState(() {
        uploadedFiles.add({"name": fileName, "path": filePath!});

        // Update the document status to "Uploaded"
        for (var doc in pendingDocuments) {
          if (doc["name"] == documentName) {
            doc["status"] = "Uploaded";
            break;
          }
        }
      });

      _showSuccessDialog(
        "File Uploaded",
        "$documentName has been successfully uploaded.",
      );
    }
  }

  // Helper function to validate file name
  bool _isValidFile(String fileName, String documentName) {
    return fileName
        .toLowerCase()
        .contains(documentName.toLowerCase().replaceAll(" ", "_"));
  }

  // Function to show an error dialog
  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  // Function to show a success dialog
  void _showSuccessDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  // Function to view an uploaded file
  void _viewFile(String filePath) async {
    final result = await OpenFile.open(filePath);

    if (result.type != ResultType.done) {
      // Handle errors if the file could not be opened
      _showErrorDialog(
          "Error", "Unable to open file. Error: ${result.message}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: pendingDocuments.length,
            itemBuilder: (context, index) {
              final doc = pendingDocuments[index];
              bool isPending = doc["status"] == "Pending";

              return Card(
                elevation: 2,
                margin: EdgeInsets.symmetric(vertical: 6, horizontal: 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.green.shade900, width: 1),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(16),
                  tileColor: Colors.grey.shade50,
                  leading: CircleAvatar(
                    radius: 24,
                    backgroundColor:
                        isPending ? Colors.red.shade50 : Colors.green.shade50,
                    child: Icon(
                      isPending
                          ? Icons.warning_amber_rounded
                          : Icons.check_circle,
                      color: isPending ? Colors.red : Colors.green,
                      size: 28,
                    ),
                  ),
                  title: Text(
                    doc["name"]!,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Row(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: isPending
                                ? Colors.red.shade100
                                : Colors.green.shade100,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            isPending ? "Pending" : "Uploaded",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: isPending
                                  ? Colors.red.shade700
                                  : Colors.green.shade700,
                            ),
                          ),
                        ),
                        if (!isPending) ...[
                          SizedBox(width: 8),
                          Text(
                            "Uploaded Successfully",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                        ]
                      ],
                    ),
                  ),
                  trailing: isPending
                      ? ElevatedButton.icon(
                          onPressed: () {
                            uploadFile(doc["name"]!);
                          },
                          icon: Icon(
                            Icons.upload_file,
                            size: 18,
                            color: Colors.black,
                          ),
                          label: Text(
                            "Upload",
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.green.shade100,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(color: Colors.green.shade900)),
                          ),
                        )
                      : Icon(
                          Icons.check_circle_outline,
                          color: Colors.green,
                          size: 28,
                        ),
                ),
              );
            },
          ),
        ),
        if (uploadedFiles.isNotEmpty) ...[
          SizedBox(height: 16),
          Text(
            "Uploaded Files:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ...uploadedFiles.map((file) => Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.green.shade900)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // File Icon
                      Icon(
                        Icons.insert_drive_file,
                        color: Colors.green.shade900,
                        size: 36,
                      ),
                      SizedBox(width: 16),
                      // File Details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // File Name
                            Text(
                              file["name"]!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 4),
                            // File Type (derived from extension)
                            Text(
                              "File Type: ${file['name']!.split('.').last.toUpperCase()}",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                            SizedBox(height: 4),
                            // Upload Date (dummy data here; replace with actual if available)
                            Text(
                              "Uploaded on: ${DateTime.now().toString().split(' ').first}",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16),
                      // Action Button
                      ElevatedButton.icon(
                        onPressed: () => _viewFile(file["path"]!),
                        icon: Icon(
                          Icons.visibility,
                          color: Colors.black,
                        ),
                        label: Text(
                          "View",
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade100,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: Colors.green.shade900),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ],
    );
  }
}

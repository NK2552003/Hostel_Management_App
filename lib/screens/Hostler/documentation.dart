import 'package:flutter/material.dart';
import 'package:hostel_management_app/components/custom_appbar.dart';
import 'package:hostel_management_app/components/custom_drawer.dart';
import 'package:hostel_management_app/components/documents_comp/pending_document.dart';

class Documentation extends StatefulWidget {
  const Documentation({super.key});

  @override
  State<Documentation> createState() => _DocumentationState();
}

class _DocumentationState extends State<Documentation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: CustomDrawer(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppbar(
          title: "Documentation",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Expanded(
              child: PendingDocumentsWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

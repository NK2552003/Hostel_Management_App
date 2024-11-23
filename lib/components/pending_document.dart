import 'package:flutter/material.dart';

class PendingDocuments extends StatelessWidget {
  final List<String> pendingDocs;

  const PendingDocuments({super.key, required this.pendingDocs});

  @override
  Widget build(BuildContext context) {
    bool hasPendingDocs = pendingDocs.isNotEmpty;

    return SizedBox(
      width: 205,
      height: 185,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 1,
        shadowColor: Colors.green.withOpacity(0.5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.teal.shade700, width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pending Documents",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.teal.shade900, // Dark green for title
                  ),
                ),
                const SizedBox(height: 16),
                if (hasPendingDocs)
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemCount:
                                pendingDocs.length > 3 ? 3 : pendingDocs.length,
                            separatorBuilder: (_, __) => const Divider(
                              height: 16,
                              color: Colors.grey,
                            ),
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: Icon(Icons.document_scanner),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      pendingDocs[index],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        if (pendingDocs.length > 3)
                          TextButton(
                            onPressed: () {
                              // Implement navigation to a detailed view of all documents
                            },
                            child: Text(
                              "See All",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color:
                                    Colors.green.shade600, // Button text green
                              ),
                            ),
                          ),
                      ],
                    ),
                  )
                else
                  Expanded(
                    child: Center(
                      child: Text(
                        "Nothing to see here",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color:
                              Colors.green.shade600, // Subtle green placeholder
                        ),
                      ),
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

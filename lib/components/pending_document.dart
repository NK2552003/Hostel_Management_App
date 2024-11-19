import 'package:flutter/material.dart';

class PendingDocuments extends StatelessWidget {
  final List<String> pendingDocs;

  PendingDocuments({required this.pendingDocs});

  @override
  Widget build(BuildContext context) {
    bool hasPendingDocs = pendingDocs.isNotEmpty;

    return Container(
      width: 205,
      height: 185,
      child: Card(
        color: Colors.green.shade50, // Light green background
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 1,
        shadowColor: Colors.green.withOpacity(0.5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.green.shade700, width: 1),
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
                    color: Colors.green.shade900, // Dark green for title
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
                                  Expanded(
                                    child: Text(
                                      pendingDocs[index],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black87,
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

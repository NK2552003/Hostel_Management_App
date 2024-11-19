import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For SystemUiOverlayStyle
import 'package:hostel_management_app/components/custom_drawer.dart';
import 'package:hostel_management_app/components/event_list.dart';
import 'package:hostel_management_app/components/fee_overview.dart';
import 'package:hostel_management_app/components/info_card.dart';
import 'package:hostel_management_app/components/pending_document.dart';
import 'package:hostel_management_app/components/quick_access.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Set system overlay style
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Make status bar transparent
        statusBarIconBrightness:
            Brightness.dark, // Set status bar icons to black
        statusBarBrightness: Brightness.light, // For iOS compatibility
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60), // Reduced height
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green.shade900,
                borderRadius:
                    BorderRadius.circular(15), // Circular from all sides
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.green.withOpacity(0.4),
                //     blurRadius: 10,
                //     offset: Offset(0, 4), // Shadow below the AppBar
                //   ),
                // ],
              ),
              child: SizedBox(
                height: 60,
                child: Stack(
                  alignment: Alignment.center, // Align content to the center
                  children: [
                    // Centered title
                    const Text(
                      'Dashboard',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    // Left-aligned menu icon
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Builder(
                        builder: (BuildContext context) {
                          return IconButton(
                            icon: const Icon(Icons.menu, color: Colors.white),
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                          );
                        },
                      ),
                    ),
                    // Right-aligned actions
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.warning_amber_rounded,
                                color: Colors.white),
                            onPressed: () {
                              // Handle emergency action
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.notifications,
                                color: Colors.white),
                            onPressed: () {
                              // Handle notifications action
                            },
                          ),
                          const SizedBox(width: 5),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          // Animated background shapes
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  InfoCard(
                    avatarUrl: 'assets/profile_photo.png',
                    name: 'Nitish Kumar',
                    course: 'Computer Science',
                    duration: '4 Years',
                    block: 'BH3',
                    roomNumber: '407',
                    stayDuration: '2022 - 2026',
                    backgroundColor: Colors.green.shade50,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FeesOverview(
                        feeData: {'Paid': 70, 'Pending': 30},
                      ),
                      PendingDocuments(
                        pendingDocs: ['ID Proof', 'Photo', 'Address Proof'],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  QuickAccess(),
                  CommunityEvents(),
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: CustomDrawer(),
    );
  }
}

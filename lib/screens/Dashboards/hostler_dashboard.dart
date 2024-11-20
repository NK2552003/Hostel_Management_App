import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For SystemUiOverlayStyle
import 'package:hostel_management_app/components/bubble_background.dart';
import 'package:hostel_management_app/components/custom_appbar.dart';
import 'package:hostel_management_app/components/custom_drawer.dart';
import 'package:hostel_management_app/components/event_list.dart';
import 'package:hostel_management_app/components/fee_overview.dart';
import 'package:hostel_management_app/components/info_card.dart';
import 'package:hostel_management_app/components/pending_document.dart';
import 'package:hostel_management_app/components/quick_access.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Set system overlay style
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CustomAppbar(
            title: "Dashboard",
          )),
      body: Stack(
        children: [
          const BubblesBackground(),
          // Animated background shapes
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
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
                        feeData: const {'Paid': 70, 'Pending': 30},
                      ),
                      PendingDocuments(
                        pendingDocs: const [
                          'ID Proof',
                          'Photo',
                          'Address Proof'
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
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

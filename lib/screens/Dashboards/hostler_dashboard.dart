import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For SystemUiOverlayStyle
import 'dart:async'; // For delayed animations
import 'package:hostel_management_app/components/custom_appbar.dart';
import 'package:hostel_management_app/components/custom_drawer.dart';
import 'package:hostel_management_app/components/event_list.dart';
import 'package:hostel_management_app/components/fee_overview.dart';
import 'package:hostel_management_app/components/info_card.dart';
import 'package:hostel_management_app/components/pending_document.dart';
import 'package:hostel_management_app/components/quick_access.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  late List<bool> _isVisibleList;

  @override
  void initState() {
    super.initState();
    _isVisibleList = List.filled(5, false); // Total 5 widgets to animate
    _triggerAnimations();
  }

  void _triggerAnimations() {
    for (int i = 0; i < _isVisibleList.length; i++) {
      Timer(Duration(milliseconds: i * 200), () {
        if (mounted) {
          setState(() {
            _isVisibleList[i] = true;
          });
        }
      });
    }
  }

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
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Info Card with Animation
                  AnimatedOpacity(
                    opacity: _isVisibleList[0] ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: InfoCard(
                      avatarUrl: 'assets/profile_photo.png',
                      name: 'Nitish Kumar',
                      course: 'Computer Science',
                      duration: '4 Years',
                      block: 'BH3',
                      roomNumber: '407',
                      stayDuration: '2022 - 2026',
                      backgroundColor: Colors.green.shade50,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Fees Overview and Pending Documents Row
                  AnimatedOpacity(
                    opacity: _isVisibleList[1] ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: Row(
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
                  ),
                  const SizedBox(height: 20),

                  // Quick Access Section
                  AnimatedOpacity(
                    opacity: _isVisibleList[2] ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: QuickAccess(),
                  ),

                  // Community Events Section
                  AnimatedOpacity(
                    opacity: _isVisibleList[3] ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: CommunityEvents(),
                  ),
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

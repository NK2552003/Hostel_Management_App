import 'package:flutter/material.dart';
import 'package:hostel_management_app/components/custom_drawer.dart';
import 'package:hostel_management_app/components/event_list.dart';
import 'package:hostel_management_app/components/info_card.dart';
import 'package:hostel_management_app/components/quick_access.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        elevation: 4,
        // Hamburger menu to open drawer
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Opens the drawer
              },
            );
          },
        ),
        centerTitle: true,
        title: const Text(
          'Dashboard',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.warning_amber_rounded, color: Colors.white),
            onPressed: () {
              // Handle emergency action
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // Handle notifications action
            },
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // InfoCard Component
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
              QuickAccess(),
              CommunityEvents(),
            ],
          ),
        ),
      ),
      drawer: CustomDrawer(),
    );
  }
}

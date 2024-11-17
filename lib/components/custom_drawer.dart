import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Drawer Header
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green.shade900,
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("assets/profile_photo.png"),
                  ),
                ),
                SizedBox(height: 8),
                Center(
                  child: Text(
                    'Nitish Kumar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'nitish.202204098@tulas.edu.in',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Drawer Menu Items
          Expanded(
            child: ListView(
              children: [
                _buildDrawerItem(Icons.dashboard, 'Dashboard', () {
                  // Handle navigation
                }),
                _buildDrawerItem(Icons.person, 'Profile', () {
                  // Handle navigation
                }),
                _buildDrawerItem(Icons.settings, 'Settings', () {
                  // Handle navigation
                }),
                _buildDrawerItem(Icons.logout, 'Logout', () {
                  // Handle logout
                }),
              ],
            ),
          ),

          // Footer Section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text(
                  "Report Issue!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const Divider(thickness: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.email, color: Colors.green),
                      onPressed: () {
                        // Handle email tap
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.phone, color: Colors.blue),
                      onPressed: () {
                        // Handle phone tap
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.link, color: Colors.orange),
                      onPressed: () {
                        // Handle website/social media link tap
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.green.shade700),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      onTap: onTap,
    );
  }
}

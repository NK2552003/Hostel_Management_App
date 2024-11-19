import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color.fromARGB(255, 21, 73, 25),
        child: Column(
          children: [
            // Drawer Header
            const DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("assets/profile_photo.png"),
                    backgroundColor: Colors.white,
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    'Nitish Kumar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'nitish.202204098@tulas.edu.in',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            // Drawer Menu Items with Animation
            Expanded(
              child: ListView(
                children: [
                  _buildAnimatedDrawerItem(Icons.dashboard, 'Dashboard', () {
                    // Handle navigation
                  }),
                  _buildAnimatedDrawerItem(Icons.person, 'Profile', () {
                    // Handle navigation
                  }),
                  _buildAnimatedDrawerItem(Icons.settings, 'Settings', () {
                    // Handle navigation
                  }),
                  _buildAnimatedDrawerItem(Icons.logout, 'Logout', () {
                    // Handle logout
                  }),
                ],
              ),
            ),

            // Footer Section
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const Divider(color: Colors.white70, thickness: 0.5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.email, color: Colors.white),
                        onPressed: () {
                          // Handle email tap
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.phone, color: Colors.white),
                        onPressed: () {
                          // Handle phone tap
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.link, color: Colors.white),
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
      ),
    );
  }

  Widget _buildAnimatedDrawerItem(
      IconData icon, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.greenAccent.withOpacity(0.3),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.green.withOpacity(0.13),
                border: Border.all(color: Colors.white70)),
            child: Row(
              children: [
                const SizedBox(width: 20),
                Icon(icon, color: Colors.white, size: 28),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

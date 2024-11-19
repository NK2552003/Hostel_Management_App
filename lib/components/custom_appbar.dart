import 'package:flutter/material.dart';

class CustomAppbar extends StatefulWidget {
  final String title;
  const CustomAppbar({super.key, required this.title});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.green.shade900,
            borderRadius: BorderRadius.circular(15), // Circular from all sides
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
                Text(
                  widget.title,
                  style: const TextStyle(
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
    );
  }
}
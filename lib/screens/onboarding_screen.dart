import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hostel_management_app/consts/onboarding_items.dart';
import 'package:hostel_management_app/screens/login_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = OnboardingItems();
  final pageController = PageController();
  bool isLastPage = false;
  bool isReversing = false; // Track scroll direction
  Timer? autoScrollTimer;
  bool animateBorder = false; // Add animateBorder variable

  @override
  void initState() {
    super.initState();
    startAutoScroll();
  }

  void startAutoScroll() {
    autoScrollTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pageController.hasClients) {
        if (!isLastPage && !isReversing) {
          // Scroll forward if not reversing
          pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        } else {
          // Scroll backward if reversing
          pageController.previousPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }

  @override
  void dispose() {
    autoScrollTimer?.cancel();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Hostel",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                Text(
                  "Ease",
                  style: TextStyle(
                    color: Colors.green.shade900,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ],
            ),
            const Text(
              "Your One-Stop Management Solution!",
              style: TextStyle(fontSize: 10, color: Colors.grey),
            ),
          ],
        ),
      ),
      bottomSheet: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 80,
            color: Colors.white,
            width: double.infinity,
            child: Center(
              child: SmoothPageIndicator(
                controller: pageController,
                count: controller.items.length,
                effect: ExpandingDotsEffect(
                  activeDotColor: Colors.green.shade900,
                  dotWidth: 10,
                  dotHeight: 10,
                  spacing: 3,
                ),
                onDotClicked: (index) => pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                ),
              ),
            ),
          ),
          Container(
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            color: Colors.white,
            child: Row(
              children: [
                // Register Now button with animated border
                Expanded(
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: animateBorder ? Colors.blue : Colors.green,
                        width: 2,
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle register action
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Register Now!",
                        style: TextStyle(
                          color: Colors.green.shade900,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                // Sign In button with animated border
                Expanded(
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: animateBorder ? Colors.blue : Colors.greenAccent,
                        width: 2,
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.green.shade900,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: PageView.builder(
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == controller.items.length - 1;
              if (isLastPage) {
                isReversing = true;
              } else if (index == 0) {
                isReversing = false;
              }
            });
          },
          itemCount: controller.items.length,
          controller: pageController,
          itemBuilder: (context, index) {
            return AnimatedBuilder(
              animation: pageController,
              builder: (context, child) {
                double value = 1.0;
                if (pageController.position.haveDimensions) {
                  value = pageController.page! - index;
                  value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
                }
                return Transform.scale(
                  scale: value,
                  child: Opacity(
                    opacity: value,
                    child: child,
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(controller.items[index].image),
                  const SizedBox(height: 50.0),
                  Text(
                    controller.items[index].title,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    controller.items[index].description,
                    style: TextStyle(
                      color: Colors.green.shade700,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

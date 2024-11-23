import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:hostel_management_app/components/custom_appbar.dart';
import 'package:hostel_management_app/components/custom_drawer.dart';
import 'package:hostel_management_app/components/fee_payments/paid_due.dart';

class HostelFeeOverview extends StatefulWidget {
  @override
  _HostelFeeOverviewState createState() => _HostelFeeOverviewState();
}

class _HostelFeeOverviewState extends State<HostelFeeOverview>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  double displayedPercentage = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _animation = Tween<double>(begin: 0, end: 70).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    )..addListener(() {
        setState(() {
          displayedPercentage = _animation.value;
        });
      });

    // Start the animation on widget load
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: CustomDrawer(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppbar(
          title: "Fee Payments",
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
                // side: BorderSide(color: Colors.green.shade900),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Chart Section with Center Text
                    SizedBox(
                      height: 300,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          PieChart(
                            PieChartData(
                              sections: [
                                PieChartSectionData(
                                  value: displayedPercentage,
                                  color: Colors.green.shade900,
                                  title: '', // No text inside the pie section
                                  radius: 30,
                                ),
                                PieChartSectionData(
                                  value: 100 - displayedPercentage,
                                  color: Colors.green.shade100,
                                  title: '', // No text inside the pie section
                                  radius: 30,
                                ),
                              ],
                              centerSpaceRadius: 110,
                              sectionsSpace: 2,
                            ),
                          ),
                          // Center Text
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${displayedPercentage.toInt()}%',
                                style: TextStyle(
                                  fontSize: 46,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green.shade900,
                                ),
                              ),
                              Text(
                                'Fee Submitted',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          PaidDue(),
        ],
      ),
    );
  }
}

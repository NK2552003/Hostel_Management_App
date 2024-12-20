import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:hostel_management_app/components/custom_appbar.dart';
import 'package:hostel_management_app/components/custom_drawer.dart';
import 'package:hostel_management_app/components/fee_payments/history.dart';
import 'package:hostel_management_app/components/fee_payments/paid_due.dart';
import 'package:hostel_management_app/components/fee_payments/payment_method_sheet.dart';

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

    _animation = Tween<double>(begin: 0, end: 52).animate(
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
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Card(
                      elevation: 0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Chart Section with Center Text
                            SizedBox(
                              height: 300,
                              width: 300, // Set width explicitly
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  PieChart(
                                    PieChartData(
                                      sections: [
                                        PieChartSectionData(
                                          value: displayedPercentage,
                                          color: Colors.green.shade900,
                                          title: '',
                                          radius: 30,
                                        ),
                                        PieChartSectionData(
                                          value: 100 - displayedPercentage,
                                          color: Colors.green.shade100,
                                          title: '',
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
                  // PaidDue Section
                  PaidDue(),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled:
                              true, // For making it look like a modal dialog
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(16)),
                          ),
                          builder: (context) => PaymentMethodSheet(),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 2,
                        backgroundColor:
                            Colors.green.shade100, // Set background color
                        foregroundColor: Colors.black,
                        side: BorderSide(
                            color: Colors.green.shade900), // Set text color
                        minimumSize: Size(double.infinity,
                            50), // Expand the button to full width with a fixed height
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              12), // Optional: rounded corners for elegance
                        ),
                      ),
                      child: Text(
                        "Pay Dues",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight
                                .bold), // Adjust text style for elegance
                      ),
                    ),
                  ),

                  // TransactionHistory Section
                  Expanded(child: TransactionHistory()),
                ],
              ),
            ),
          ),
        ));
  }
}

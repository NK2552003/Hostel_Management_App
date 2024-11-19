import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class FeesOverview extends StatelessWidget {
  final Map<String, double> feeData; // Example: {'Paid': 70, 'Pending': 30}

  FeesOverview({required this.feeData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 205,
      height: 185,
      child: Card(
        color: Colors.green.shade50, // Light green background
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 1,
        shadowColor: Colors.green.withOpacity(0.4),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.green.shade700, width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Fees Overview",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.green.shade900, // Dark green for text
                  ),
                ),
                const SizedBox(height: 12),
                AspectRatio(
                  aspectRatio: 1.8,
                  child: PieChart(
                    PieChartData(
                      sections: feeData.entries.map((entry) {
                        return PieChartSectionData(
                          color: entry.key == "Paid"
                              ? Colors.green.shade500 // Harmonized green
                              : Colors.orange
                                  .shade400, // Muted orange for "Pending"
                          value: entry.value,
                          title: '${entry.value.toStringAsFixed(0)}%',
                          radius: 25,
                          titleStyle: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        );
                      }).toList(),
                      sectionsSpace: 4,
                      centerSpaceRadius: 18,
                      centerSpaceColor: Colors.white,
                      startDegreeOffset: -90,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: feeData.entries.map((entry) {
                    return Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: entry.key == "Paid"
                                ? Colors
                                    .green.shade600 // Darker green for "Paid"
                                : Colors.orange
                                    .shade600, // Consistent orange for "Pending"
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          entry.key,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color:
                                Colors.grey.shade700, // Neutral grey for labels
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

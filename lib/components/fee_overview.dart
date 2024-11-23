import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class FeesOverview extends StatelessWidget {
  final Map<String, double> feeData; // Example: {'Paid': 70, 'Pending': 30}

  const FeesOverview({super.key, required this.feeData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 205,
      height: 185,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 1,
        shadowColor: Colors.teal.withOpacity(0.4),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.teal.shade700, width: 1),
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
                    color: Colors.teal.shade900, // Dark green for text
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
                              ? Colors.green.shade900 // Harmonized green
                              : Colors.green.shade100,
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
                      centerSpaceRadius: 20,
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
                                    .green.shade900 // Darker green for "Paid"
                                : Colors.green.shade100,
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

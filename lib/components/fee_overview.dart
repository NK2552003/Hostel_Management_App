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
        color: Colors.green.shade50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 1,
        shadowColor: Colors.green.withOpacity(0.4),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.green.shade900, width: 1),
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
                    color: Colors.black,
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
                              ? Colors.green.shade700
                              : Colors.red.shade900,
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
                                ? Colors.green.shade700
                                : Colors.red.shade900,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          entry.key,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
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
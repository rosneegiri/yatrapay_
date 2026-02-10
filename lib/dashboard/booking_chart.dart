import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BookingChart extends StatelessWidget {
  const BookingChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Trips Overview',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: LineChart(_chartData()),
          ),
        ],
      ),
    );
  }

  LineChartData _chartData() {
    return LineChartData(
      minX: 0,
      maxX: 6,
      minY: 0,
      maxY: 120,

      gridData: FlGridData(show: false),
      borderData: FlBorderData(show: false),

      titlesData: FlTitlesData(
        rightTitles:
            AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles:
            AxisTitles(sideTitles: SideTitles(showTitles: false)),

        // ✅ FIX IS HERE (0 REMOVED)
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 20,
            reservedSize: 32,
            getTitlesWidget: (value, _) {
              if (value == 0) return const SizedBox.shrink();
              return Text(value.toInt().toString());
            },
          ),
        ),

        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: (value, _) {
              const days = [
                'Mon',
                'Tue',
                'Wed',
                'Thu',
                'Fri',
                'Sat',
                'Sun'
              ];

              if (value.toInt() >= 0 &&
                  value.toInt() < days.length) {
                return Text(days[value.toInt()]);
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),

      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 40),
            FlSpot(1, 60),
            FlSpot(2, 55),
            FlSpot(3, 90),
            FlSpot(4, 70),
            FlSpot(5, 110),
            FlSpot(6, 95),
          ],
          isCurved: true,
          barWidth: 4,
          color: Colors.blue,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            color: Colors.blue.withOpacity(0.15),
          ),
        ),
      ],
    );
  }
}

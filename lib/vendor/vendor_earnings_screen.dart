import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class VendorEarningsScreen extends StatelessWidget {
  const VendorEarningsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Earnings',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          Row(
            children: const [
              HoverSummaryCard(
                title: 'Total Earnings',
                value: '₹ 1,25,000',
                icon: Icons.currency_rupee,
              ),
              SizedBox(width: 16),
              HoverSummaryCard(
                title: 'This Month',
                value: '₹ 42,000',
                icon: Icons.calendar_month,
              ),
              SizedBox(width: 16),
              HoverSummaryCard(
                title: 'Completed Trips',
                value: '48',
                icon: Icons.directions_bus,
              ),
            ],
          ),

          const SizedBox(height: 30),

          Expanded(
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: LineChart(_earningsChartData()),
              ),
            ),
          ),
        ],
      ),
    );
  }

  LineChartData _earningsChartData() {
    return LineChartData(
      minX: 0,
      maxX: 5,
      minY: 0,
      maxY: 45000,

      gridData: FlGridData(show: true),
      borderData: FlBorderData(show: true),

      titlesData: FlTitlesData(
        rightTitles:
            AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles:
            AxisTitles(sideTitles: SideTitles(showTitles: false)),

        // ✅ FINAL FIXED LEFT AXIS
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 10000,
            reservedSize: 60,
            getTitlesWidget: (value, _) {
              if (value == 0) return const SizedBox.shrink();

              final int v = value.toInt();
              final String label = '₹${(v / 1000).toInt()}k';

              return Text(
                label,
                maxLines: 1,
                softWrap: false,
                style: const TextStyle(fontSize: 12),
              );
            },
          ),
        ),

        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: (value, _) {
              const months = [
                'Jan',
                'Feb',
                'Mar',
                'Apr',
                'May',
                'Jun',
              ];

              if (value.toInt() >= 0 &&
                  value.toInt() < months.length) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(months[value.toInt()]),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),

      lineBarsData: [
        LineChartBarData(
          isCurved: true,
          barWidth: 4,
          color: Colors.blue,
          dotData: FlDotData(show: true),
          spots: const [
            FlSpot(0, 15000),
            FlSpot(1, 22000),
            FlSpot(2, 18000),
            FlSpot(3, 26000),
            FlSpot(4, 30000),
            FlSpot(5, 42000),
          ],
        ),
      ],
    );
  }
}

/* ---------------- HOVER CARD ---------------- */

class HoverSummaryCard extends StatefulWidget {
  final String title;
  final String value;
  final IconData icon;

  const HoverSummaryCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  State<HoverSummaryCard> createState() => _HoverSummaryCardState();
}

class _HoverSummaryCardState extends State<HoverSummaryCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: _isHovered
              ? (Matrix4.identity()..translate(0, -6))
              : Matrix4.identity(),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? Colors.black26
                    : Colors.black12,
                blurRadius: _isHovered ? 20 : 8,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Icon(widget.icon, size: 36, color: Colors.blue),
              const SizedBox(height: 10),
              Text(
                widget.value,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                widget.title,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

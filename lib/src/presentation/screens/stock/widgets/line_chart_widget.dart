import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stock_market/src/core/core.dart';
import '../../../../data/models/stock_price_graph.dart';

class LineChartWidget extends StatelessWidget {
  final StockPriceGraph graph;

  const LineChartWidget({super.key, required this.graph});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    return LineChart(
      LineChartData(
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index < 0 || index >= graph.timestamps.length) {
                  return const SizedBox();
                }
                final time = graph.timestamps[index];
                return Text(
                  "${time.hour}:${time.minute}",
                  style: const TextStyle(fontSize: 10),
                );
              },
            ),
          ),
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
            ),
          ),
        ),
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: true),
        lineBarsData: [
          LineChartBarData(
            spots: List.generate(graph.price.length, (index) {
              return FlSpot(index.toDouble(), graph.price[index]);
            }),
            isCurved: true,
            color: colorScheme.primary,
            barWidth: 3,
            dotData: const FlDotData(show: false),
          ),
        ],
      ),
    );
  }
}

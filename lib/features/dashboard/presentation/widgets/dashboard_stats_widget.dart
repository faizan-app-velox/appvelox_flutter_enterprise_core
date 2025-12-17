import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../l10n/localization_extension.dart';

class DashboardStatsWidget extends StatelessWidget {
  final double totalRevenue;
  final List<double> chartData;

  const DashboardStatsWidget({
    super.key,
    required this.totalRevenue,
    required this.chartData,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Text(
          context.l10n.monthlyRevenue,
          style: textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ).animate().fadeIn(duration: 600.ms),

        const SizedBox(height: 8),

        // Amount & Badge
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "\$${totalRevenue.toStringAsFixed(2)}",
              style: textTheme.headlineMedium?.copyWith(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.5,
                height: 1.0,
              ),
            ).animate().fadeIn().slideX(begin: -0.1, end: 0, duration: 600.ms),

            const SizedBox(width: 12),

            // Badge
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.brandTeal.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.arrow_upward_rounded,
                      color: AppTheme.brandTeal,
                      size: 14,
                    ),
                    SizedBox(width: 4),
                    Text(
                      "12%",
                      style: TextStyle(
                        color: AppTheme.brandTeal,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ).animate().scale(delay: 200.ms, curve: Curves.elasticOut),
          ],
        ),

        const SizedBox(height: 30),

        // Chart
        SizedBox(
              height: 150,
              width: double.infinity,
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: false),
                  titlesData: const FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),

                  // Tooltip Configuration
                  lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                      getTooltipColor: (_) =>
                          theme.cardTheme.color ?? colorScheme.surface,
                      getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                        return touchedBarSpots.map((barSpot) {
                          return LineTooltipItem(
                            "\$${barSpot.y.toStringAsFixed(0)}",
                            textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }).toList();
                      },
                    ),
                    handleBuiltInTouches: true,
                    getTouchedSpotIndicator:
                        (LineChartBarData barData, List<int> spotIndexes) {
                          return spotIndexes.map((spotIndex) {
                            return TouchedSpotIndicatorData(
                              const FlLine(
                                color: AppTheme.brandTeal,
                                strokeWidth: 2,
                              ),
                              FlDotData(
                                getDotPainter: (spot, percent, barData, index) {
                                  return FlDotCirclePainter(
                                    radius: 6,
                                    color: colorScheme.surface,
                                    strokeWidth: 3,
                                    strokeColor: AppTheme.brandTeal,
                                  );
                                },
                              ),
                            );
                          }).toList();
                        },
                  ),

                  lineBarsData: [
                    LineChartBarData(
                      spots: chartData.asMap().entries.map((e) {
                        return FlSpot(e.key.toDouble(), e.value);
                      }).toList(),
                      isCurved: true,
                      color: AppTheme.brandTeal,
                      barWidth: 4,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: [
                            AppTheme.brandTeal.withValues(alpha: 0.2),
                            AppTheme.brandTeal.withValues(alpha: 0.0),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .animate(delay: 300.ms)
            .fadeIn(duration: 800.ms)
            .slideY(begin: 0.2, end: 0),
      ],
    );
  }
}

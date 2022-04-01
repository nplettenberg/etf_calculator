import 'package:etf_calculator/components/components.dart';
import 'package:etf_calculator/widgets/widgets.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculatorGraphPage extends ConsumerWidget {
  const CalculatorGraphPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final display = ref.watch(displaySettingsProvider);
    final result = ref.watch(calculatorProvider);
    final theme = ref.watch(themeProvider);

    return Stack(
      children: [
        Column(
          children: [
            result.when<Widget>(
              data: (data) {
                return Expanded(
                  flex: 9,
                  child: Padding(
                    padding: display.padding,
                    child: LineChart(
                      LineChartData(
                        gridData: FlGridData(
                          show: false,
                        ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        titlesData: FlTitlesData(
                          topTitles: SideTitles(
                            showTitles: false,
                          ),
                          leftTitles: SideTitles(
                            showTitles: false,
                          ),
                        ),
                        lineBarsData: [
                          LineChartBarData(
                            isCurved: true,
                            barWidth: 5,
                            dotData: FlDotData(
                              show: false,
                            ),
                            colors: [
                              theme.primaryColor,
                              Colors.greenAccent.withOpacity(.5),
                            ],
                            spots: data.series.entries
                                .map<FlSpot>(
                                  (e) => FlSpot(
                                    e.key.toDouble(),
                                    e.value.totalAmount,
                                  ),
                                )
                                .toList(),
                          ),
                          LineChartBarData(
                            isCurved: true,
                            barWidth: 5,
                            dotData: FlDotData(
                              show: false,
                            ),
                            colors: [
                              Colors.redAccent.withOpacity(.5),
                              theme.primaryColor,
                            ],
                            spots: data.series.entries
                                .map<FlSpot>(
                                  (e) => FlSpot(
                                    e.key.toDouble(),
                                    e.value.totalPaidAmount,
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              error: (_, __) => const Center(
                child: Text('error :('),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            const DefaultSpacer.vertical(),
            const Expanded(child: SizedBox())
          ],
        ),
        DraggableScrollableSheet(
          snap: true,
          minChildSize: .1,
          initialChildSize: .35,
          builder: (context, controller) {
            return Container(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 8,
              ),
              decoration: BoxDecoration(
                color: theme.primaryColor.withOpacity(.9),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: SingleChildScrollView(
                controller: controller,
                child: const CalculatorInputFields(),
              ),
            );
          },
        ),
      ],
    );
  }
}

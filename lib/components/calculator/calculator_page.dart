import 'package:etf_calculator/components/calculator/provider/calculator_input_provider.dart';
import 'package:etf_calculator/components/components.dart';
import 'package:etf_calculator/widgets/widgets.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class HomePage extends ConsumerWidget {
  static const String page = 'calculator_page';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final display = ref.watch(displaySettingsProvider);
    final result = ref.watch(homeProvider);
    final theme = ref.watch(themeProvider);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
            ),
          )
        ],
      ),
      body: Stack(
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
                                    (e) => FlSpot(e.key.toDouble(), e.value),
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
              DefaultSpacer.vertical(),
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
                  child: CalculatorInputFields(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CalculatorInputFields extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final input = ref.watch(calculatorInputProvider);
    final inputNotifier = ref.read(calculatorInputProvider.notifier);

    return DefaultTextStyle(
      style: const TextStyle(
        color: Colors.black,
      ),
      child: FormBuilder(
        child: Column(
          children: [
            Container(
              height: 3,
              width: 25,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            DefaultSpacer.vertical(vertical: 16),
            FormBuilderTextField(
              name: 'initialAmount',
              style: const TextStyle(
                color: Colors.black,
              ),
              initialValue: '${input.initialAmount}',
              decoration: const InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                label: Text('current amount'),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                inputNotifier.state = input.copyWith(
                  initialAmount: double.parse(value!),
                );
              },
            ),
            DefaultSpacer.vertical(),
            FormBuilderSlider(
              name: 'years',
              decoration: const InputDecoration(
                label: Text('years'),
                labelStyle: TextStyle(color: Colors.black),
                isCollapsed: true,
              ),
              initialValue: input.years,
              numberFormat: NumberFormat('0'),
              min: 1,
              max: 50,
              divisions: 50,
              onChanged: (value) {
                inputNotifier.state = input.copyWith(
                  years: value!.ceilToDouble(),
                );
              },
            ),
            DefaultSpacer.vertical(),
            FormBuilderSlider(
              name: 'expectedReturn',
              decoration: const InputDecoration(
                labelStyle: TextStyle(color: Colors.black),
                label: Text('expected return'),
                isCollapsed: true,
              ),
              initialValue: input.expectedReturn,
              numberFormat: NumberFormat('0'),
              min: 0,
              max: 100,
              divisions: 100,
              onChanged: (value) {
                inputNotifier.state = input.copyWith(
                  expectedReturn: value!.ceilToDouble(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

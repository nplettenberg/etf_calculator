import 'package:etf_calculator/components/calculator/provider/calculator_input_provider.dart';
import 'package:etf_calculator/components/components.dart';
import 'package:etf_calculator/widgets/botton_padding.dart';
import 'package:etf_calculator/widgets/widgets.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class HomePage extends ConsumerWidget {
  HomePage({Key? key}) : super(key: key);

  static const String page = 'calculator_page';

  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

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
      body: Column(
        children: [
          const TopPadding(),
          result.when<Widget>(
            data: (data) {
              return Expanded(
                child: Padding(
                  padding: display.padding * 2,
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
            error: (_, __) => const Expanded(
              child: Center(
                child: Text('error :('),
              ),
            ),
            loading: () => const Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          DefaultSpacer.vertical(vertical: 32),
          Padding(
            padding: display.padding,
            child: CalculatorInputFields(formKey: formKey),
          ),
          const BottomPadding(),
        ],
      ),
    );
  }
}

class CalculatorInputFields extends ConsumerWidget {
  const CalculatorInputFields({
    Key? key,
    this.formKey,
  }) : super(key: key);

  final Key? formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final input = ref.watch(calculatorInputProvider);
    final inputNotifier = ref.read(calculatorInputProvider.notifier);

    return FormBuilder(
      key: formKey,
      child: Column(
        children: [
          FormBuilderTextField(
            name: 'initialAmount',
            initialValue: '${input.initialAmount}',
            decoration: InputDecoration(
              label: const Text('current amount'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
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
            decoration: InputDecoration(
              label: const Text('years'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
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
            decoration: InputDecoration(
              label: const Text('expected return'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            initialValue: input.expectedReturn,
            numberFormat: NumberFormat('0'),
            min: 0,
            max: 100,
            divisions: 100,
            onChanged: (value) {
              inputNotifier.state = input.copyWith(
                years: value!.ceilToDouble(),
              );
            },
          ),
        ],
      ),
    );
  }
}

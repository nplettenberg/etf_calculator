import 'package:etf_calculator/components/components.dart';
import 'package:etf_calculator/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class CalculatorInputFields extends ConsumerWidget {
  const CalculatorInputFields();

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
            const DefaultSpacer.vertical(vertical: 16),
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
            const DefaultSpacer.vertical(),
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
            const DefaultSpacer.vertical(),
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
            FormBuilderTextField(
              name: 'monthlyPayment',
              style: const TextStyle(
                color: Colors.black,
              ),
              initialValue: '${input.monthlyPayment}',
              decoration: const InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                label: Text('monthly payment'),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                inputNotifier.state = input.copyWith(
                  monthlyPayment: double.parse(value!),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:etf_calculator/components/components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calculator_provider.freezed.dart';

final calculatorProvider = StateNotifierProvider.autoDispose<CalculatorNotifier,
    AsyncValue<CalculatorState>>((ref) {
  return CalculatorNotifier(
    arguments: ref.watch(calculatorInputProvider),
  );
});

class CalculatorNotifier extends StateNotifier<AsyncValue<CalculatorState>> {
  CalculatorNotifier({
    required CalculatorArguments arguments,
  })  : _arguments = arguments,
        super(AsyncValue.data(CalculatorState())) {
    _calculate();
  }

  final CalculatorArguments _arguments;

  void _calculate() async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard<CalculatorState>(() async {
      final series = await compute(_calculateSeries, _arguments);

      return CalculatorState(series: series);
    });
  }

  @override
  set state(AsyncValue<CalculatorState> state) {
    if (mounted) {
      super.state = state;
    }
  }
}

Map<int, CalculatedYear> _calculateSeries(CalculatorArguments arguments) {
  double amount = arguments.initialAmount;

  final series = <int, CalculatedYear>{
    0: CalculatedYear(
      totalAmount: amount,
      totalPaidAmount: amount,
      paidAmount: amount,
      returns: 0,
    ),
  };

  for (int i = 1; i <= arguments.years; i++) {
    final CalculatedYear previousYear = series[i - 1]!;

    final paidAmount = arguments.monthlyPayment * 12;
    final preReturnsAmount = (previousYear.totalAmount + paidAmount);
    final yearlyReturns = preReturnsAmount * (arguments.expectedReturn / 100);
    final totalAmount = preReturnsAmount + yearlyReturns;

    if (amount >= 10000000) {
      throw Exception('Amount to high!');
    }

    series[i] = CalculatedYear(
      totalAmount: totalAmount,
      totalPaidAmount: previousYear.totalPaidAmount + paidAmount,
      paidAmount: paidAmount,
      returns: yearlyReturns,
    );
  }

  if (series.length >= 50) {
    series.removeWhere((key, value) => key.isOdd);
  }

  return series;
}

class CalculatedYear {
  const CalculatedYear({
    required this.totalAmount,
    required this.totalPaidAmount,
    required this.paidAmount,
    required this.returns,
  });

  final double totalAmount;
  final double totalPaidAmount;
  final double paidAmount;
  final double returns;
}

@freezed
class CalculatorState with _$CalculatorState {
  factory CalculatorState({
    @Default({}) Map<int, CalculatedYear> series,
  }) = _CalculatorState;
}

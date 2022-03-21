import 'package:etf_calculator/components/calculator/provider/calculator_input_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_provider.freezed.dart';

final homeProvider =
    StateNotifierProvider<CalculatorNotifier, AsyncValue<CalculatorState>>(
        (ref) {
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

Map<int, double> _calculateSeries(CalculatorArguments arguments) {
  double amount = arguments.initialAmount;

  final series = <int, double>{
    0: amount,
  };

  for (int i = 1; i <= arguments.years; i++) {
    amount += (amount * (arguments.expectedReturn / 100));
    if (amount >= 10000000) {
      throw Exception('Amount to high!');
    }
    series[i] = amount;
  }

  if (series.length >= 50) {
    series.removeWhere((key, value) => key.isOdd);
  }

  return series;
}

@freezed
class CalculatorState with _$CalculatorState {
  factory CalculatorState({
    @Default({}) Map<int, double> series,
  }) = _CalculatorState;
}

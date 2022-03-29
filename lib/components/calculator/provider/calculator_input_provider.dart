import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calculator_input_provider.freezed.dart';

final calculatorInputProvider =
    StateProvider.autoDispose<CalculatorArguments>((ref) {
  return CalculatorArguments(
    years: 10,
    initialAmount: 100,
    expectedReturn: 5,
  );
});

@freezed
class CalculatorArguments with _$CalculatorArguments {
  factory CalculatorArguments({
    required double years,
    required double initialAmount,
    required double expectedReturn,
  }) = _CalculatorArguments;
}

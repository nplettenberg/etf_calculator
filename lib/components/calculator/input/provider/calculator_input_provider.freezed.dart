// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'calculator_input_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CalculatorArgumentsTearOff {
  const _$CalculatorArgumentsTearOff();

  _CalculatorArguments call(
      {required double years,
      required double initialAmount,
      required double expectedReturn,
      required double monthlyPayment}) {
    return _CalculatorArguments(
      years: years,
      initialAmount: initialAmount,
      expectedReturn: expectedReturn,
      monthlyPayment: monthlyPayment,
    );
  }
}

/// @nodoc
const $CalculatorArguments = _$CalculatorArgumentsTearOff();

/// @nodoc
mixin _$CalculatorArguments {
  double get years => throw _privateConstructorUsedError;
  double get initialAmount => throw _privateConstructorUsedError;
  double get expectedReturn => throw _privateConstructorUsedError;
  double get monthlyPayment => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalculatorArgumentsCopyWith<CalculatorArguments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalculatorArgumentsCopyWith<$Res> {
  factory $CalculatorArgumentsCopyWith(
          CalculatorArguments value, $Res Function(CalculatorArguments) then) =
      _$CalculatorArgumentsCopyWithImpl<$Res>;
  $Res call(
      {double years,
      double initialAmount,
      double expectedReturn,
      double monthlyPayment});
}

/// @nodoc
class _$CalculatorArgumentsCopyWithImpl<$Res>
    implements $CalculatorArgumentsCopyWith<$Res> {
  _$CalculatorArgumentsCopyWithImpl(this._value, this._then);

  final CalculatorArguments _value;
  // ignore: unused_field
  final $Res Function(CalculatorArguments) _then;

  @override
  $Res call({
    Object? years = freezed,
    Object? initialAmount = freezed,
    Object? expectedReturn = freezed,
    Object? monthlyPayment = freezed,
  }) {
    return _then(_value.copyWith(
      years: years == freezed
          ? _value.years
          : years // ignore: cast_nullable_to_non_nullable
              as double,
      initialAmount: initialAmount == freezed
          ? _value.initialAmount
          : initialAmount // ignore: cast_nullable_to_non_nullable
              as double,
      expectedReturn: expectedReturn == freezed
          ? _value.expectedReturn
          : expectedReturn // ignore: cast_nullable_to_non_nullable
              as double,
      monthlyPayment: monthlyPayment == freezed
          ? _value.monthlyPayment
          : monthlyPayment // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$CalculatorArgumentsCopyWith<$Res>
    implements $CalculatorArgumentsCopyWith<$Res> {
  factory _$CalculatorArgumentsCopyWith(_CalculatorArguments value,
          $Res Function(_CalculatorArguments) then) =
      __$CalculatorArgumentsCopyWithImpl<$Res>;
  @override
  $Res call(
      {double years,
      double initialAmount,
      double expectedReturn,
      double monthlyPayment});
}

/// @nodoc
class __$CalculatorArgumentsCopyWithImpl<$Res>
    extends _$CalculatorArgumentsCopyWithImpl<$Res>
    implements _$CalculatorArgumentsCopyWith<$Res> {
  __$CalculatorArgumentsCopyWithImpl(
      _CalculatorArguments _value, $Res Function(_CalculatorArguments) _then)
      : super(_value, (v) => _then(v as _CalculatorArguments));

  @override
  _CalculatorArguments get _value => super._value as _CalculatorArguments;

  @override
  $Res call({
    Object? years = freezed,
    Object? initialAmount = freezed,
    Object? expectedReturn = freezed,
    Object? monthlyPayment = freezed,
  }) {
    return _then(_CalculatorArguments(
      years: years == freezed
          ? _value.years
          : years // ignore: cast_nullable_to_non_nullable
              as double,
      initialAmount: initialAmount == freezed
          ? _value.initialAmount
          : initialAmount // ignore: cast_nullable_to_non_nullable
              as double,
      expectedReturn: expectedReturn == freezed
          ? _value.expectedReturn
          : expectedReturn // ignore: cast_nullable_to_non_nullable
              as double,
      monthlyPayment: monthlyPayment == freezed
          ? _value.monthlyPayment
          : monthlyPayment // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_CalculatorArguments implements _CalculatorArguments {
  _$_CalculatorArguments(
      {required this.years,
      required this.initialAmount,
      required this.expectedReturn,
      required this.monthlyPayment});

  @override
  final double years;
  @override
  final double initialAmount;
  @override
  final double expectedReturn;
  @override
  final double monthlyPayment;

  @override
  String toString() {
    return 'CalculatorArguments(years: $years, initialAmount: $initialAmount, expectedReturn: $expectedReturn, monthlyPayment: $monthlyPayment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CalculatorArguments &&
            const DeepCollectionEquality().equals(other.years, years) &&
            const DeepCollectionEquality()
                .equals(other.initialAmount, initialAmount) &&
            const DeepCollectionEquality()
                .equals(other.expectedReturn, expectedReturn) &&
            const DeepCollectionEquality()
                .equals(other.monthlyPayment, monthlyPayment));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(years),
      const DeepCollectionEquality().hash(initialAmount),
      const DeepCollectionEquality().hash(expectedReturn),
      const DeepCollectionEquality().hash(monthlyPayment));

  @JsonKey(ignore: true)
  @override
  _$CalculatorArgumentsCopyWith<_CalculatorArguments> get copyWith =>
      __$CalculatorArgumentsCopyWithImpl<_CalculatorArguments>(
          this, _$identity);
}

abstract class _CalculatorArguments implements CalculatorArguments {
  factory _CalculatorArguments(
      {required double years,
      required double initialAmount,
      required double expectedReturn,
      required double monthlyPayment}) = _$_CalculatorArguments;

  @override
  double get years;
  @override
  double get initialAmount;
  @override
  double get expectedReturn;
  @override
  double get monthlyPayment;
  @override
  @JsonKey(ignore: true)
  _$CalculatorArgumentsCopyWith<_CalculatorArguments> get copyWith =>
      throw _privateConstructorUsedError;
}

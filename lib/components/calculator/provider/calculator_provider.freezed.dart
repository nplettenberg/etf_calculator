// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'calculator_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CalculatorStateTearOff {
  const _$CalculatorStateTearOff();

  _CalculatorState call({Map<int, CalculatedYear> series = const {}}) {
    return _CalculatorState(
      series: series,
    );
  }
}

/// @nodoc
const $CalculatorState = _$CalculatorStateTearOff();

/// @nodoc
mixin _$CalculatorState {
  Map<int, CalculatedYear> get series => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalculatorStateCopyWith<CalculatorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalculatorStateCopyWith<$Res> {
  factory $CalculatorStateCopyWith(
          CalculatorState value, $Res Function(CalculatorState) then) =
      _$CalculatorStateCopyWithImpl<$Res>;
  $Res call({Map<int, CalculatedYear> series});
}

/// @nodoc
class _$CalculatorStateCopyWithImpl<$Res>
    implements $CalculatorStateCopyWith<$Res> {
  _$CalculatorStateCopyWithImpl(this._value, this._then);

  final CalculatorState _value;
  // ignore: unused_field
  final $Res Function(CalculatorState) _then;

  @override
  $Res call({
    Object? series = freezed,
  }) {
    return _then(_value.copyWith(
      series: series == freezed
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as Map<int, CalculatedYear>,
    ));
  }
}

/// @nodoc
abstract class _$CalculatorStateCopyWith<$Res>
    implements $CalculatorStateCopyWith<$Res> {
  factory _$CalculatorStateCopyWith(
          _CalculatorState value, $Res Function(_CalculatorState) then) =
      __$CalculatorStateCopyWithImpl<$Res>;
  @override
  $Res call({Map<int, CalculatedYear> series});
}

/// @nodoc
class __$CalculatorStateCopyWithImpl<$Res>
    extends _$CalculatorStateCopyWithImpl<$Res>
    implements _$CalculatorStateCopyWith<$Res> {
  __$CalculatorStateCopyWithImpl(
      _CalculatorState _value, $Res Function(_CalculatorState) _then)
      : super(_value, (v) => _then(v as _CalculatorState));

  @override
  _CalculatorState get _value => super._value as _CalculatorState;

  @override
  $Res call({
    Object? series = freezed,
  }) {
    return _then(_CalculatorState(
      series: series == freezed
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as Map<int, CalculatedYear>,
    ));
  }
}

/// @nodoc

class _$_CalculatorState
    with DiagnosticableTreeMixin
    implements _CalculatorState {
  _$_CalculatorState({this.series = const {}});

  @JsonKey()
  @override
  final Map<int, CalculatedYear> series;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CalculatorState(series: $series)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CalculatorState'))
      ..add(DiagnosticsProperty('series', series));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CalculatorState &&
            const DeepCollectionEquality().equals(other.series, series));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(series));

  @JsonKey(ignore: true)
  @override
  _$CalculatorStateCopyWith<_CalculatorState> get copyWith =>
      __$CalculatorStateCopyWithImpl<_CalculatorState>(this, _$identity);
}

abstract class _CalculatorState implements CalculatorState {
  factory _CalculatorState({Map<int, CalculatedYear> series}) =
      _$_CalculatorState;

  @override
  Map<int, CalculatedYear> get series;
  @override
  @JsonKey(ignore: true)
  _$CalculatorStateCopyWith<_CalculatorState> get copyWith =>
      throw _privateConstructorUsedError;
}

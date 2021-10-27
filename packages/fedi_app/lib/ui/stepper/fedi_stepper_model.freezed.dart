// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fedi_stepper_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FediStepperStateTearOff {
  const _$FediStepperStateTearOff();

  _FediStepperState<T> call<T extends IFediStepperItem>(
      {required List<T> steps, required int currentStepIndex}) {
    return _FediStepperState<T>(
      steps: steps,
      currentStepIndex: currentStepIndex,
    );
  }
}

/// @nodoc
const $FediStepperState = _$FediStepperStateTearOff();

/// @nodoc
mixin _$FediStepperState<T extends IFediStepperItem> {
  List<T> get steps => throw _privateConstructorUsedError;
  int get currentStepIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FediStepperStateCopyWith<T, FediStepperState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FediStepperStateCopyWith<T extends IFediStepperItem, $Res> {
  factory $FediStepperStateCopyWith(
          FediStepperState<T> value, $Res Function(FediStepperState<T>) then) =
      _$FediStepperStateCopyWithImpl<T, $Res>;
  $Res call({List<T> steps, int currentStepIndex});
}

/// @nodoc
class _$FediStepperStateCopyWithImpl<T extends IFediStepperItem, $Res>
    implements $FediStepperStateCopyWith<T, $Res> {
  _$FediStepperStateCopyWithImpl(this._value, this._then);

  final FediStepperState<T> _value;
  // ignore: unused_field
  final $Res Function(FediStepperState<T>) _then;

  @override
  $Res call({
    Object? steps = freezed,
    Object? currentStepIndex = freezed,
  }) {
    return _then(_value.copyWith(
      steps: steps == freezed
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<T>,
      currentStepIndex: currentStepIndex == freezed
          ? _value.currentStepIndex
          : currentStepIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$FediStepperStateCopyWith<T extends IFediStepperItem, $Res>
    implements $FediStepperStateCopyWith<T, $Res> {
  factory _$FediStepperStateCopyWith(_FediStepperState<T> value,
          $Res Function(_FediStepperState<T>) then) =
      __$FediStepperStateCopyWithImpl<T, $Res>;
  @override
  $Res call({List<T> steps, int currentStepIndex});
}

/// @nodoc
class __$FediStepperStateCopyWithImpl<T extends IFediStepperItem, $Res>
    extends _$FediStepperStateCopyWithImpl<T, $Res>
    implements _$FediStepperStateCopyWith<T, $Res> {
  __$FediStepperStateCopyWithImpl(
      _FediStepperState<T> _value, $Res Function(_FediStepperState<T>) _then)
      : super(_value, (v) => _then(v as _FediStepperState<T>));

  @override
  _FediStepperState<T> get _value => super._value as _FediStepperState<T>;

  @override
  $Res call({
    Object? steps = freezed,
    Object? currentStepIndex = freezed,
  }) {
    return _then(_FediStepperState<T>(
      steps: steps == freezed
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<T>,
      currentStepIndex: currentStepIndex == freezed
          ? _value.currentStepIndex
          : currentStepIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_FediStepperState<T extends IFediStepperItem>
    extends _FediStepperState<T> with DiagnosticableTreeMixin {
  const _$_FediStepperState(
      {required this.steps, required this.currentStepIndex})
      : super._();

  @override
  final List<T> steps;
  @override
  final int currentStepIndex;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FediStepperState<$T>(steps: $steps, currentStepIndex: $currentStepIndex)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FediStepperState<$T>'))
      ..add(DiagnosticsProperty('steps', steps))
      ..add(DiagnosticsProperty('currentStepIndex', currentStepIndex));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FediStepperState<T> &&
            const DeepCollectionEquality().equals(other.steps, steps) &&
            (identical(other.currentStepIndex, currentStepIndex) ||
                other.currentStepIndex == currentStepIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(steps), currentStepIndex);

  @JsonKey(ignore: true)
  @override
  _$FediStepperStateCopyWith<T, _FediStepperState<T>> get copyWith =>
      __$FediStepperStateCopyWithImpl<T, _FediStepperState<T>>(
          this, _$identity);
}

abstract class _FediStepperState<T extends IFediStepperItem>
    extends FediStepperState<T> {
  const factory _FediStepperState(
      {required List<T> steps,
      required int currentStepIndex}) = _$_FediStepperState<T>;
  const _FediStepperState._() : super._();

  @override
  List<T> get steps;
  @override
  int get currentStepIndex;
  @override
  @JsonKey(ignore: true)
  _$FediStepperStateCopyWith<T, _FediStepperState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

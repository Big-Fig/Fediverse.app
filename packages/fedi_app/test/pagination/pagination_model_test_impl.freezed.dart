// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pagination_model_test_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PaginationItemTestTearOff {
  const _$PaginationItemTestTearOff();

  _PaginationItemTest call(int index) {
    return _PaginationItemTest(
      index,
    );
  }
}

/// @nodoc
const $PaginationItemTest = _$PaginationItemTestTearOff();

/// @nodoc
mixin _$PaginationItemTest {
  int get index => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaginationItemTestCopyWith<PaginationItemTest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationItemTestCopyWith<$Res> {
  factory $PaginationItemTestCopyWith(
          PaginationItemTest value, $Res Function(PaginationItemTest) then) =
      _$PaginationItemTestCopyWithImpl<$Res>;
  $Res call({int index});
}

/// @nodoc
class _$PaginationItemTestCopyWithImpl<$Res>
    implements $PaginationItemTestCopyWith<$Res> {
  _$PaginationItemTestCopyWithImpl(this._value, this._then);

  final PaginationItemTest _value;
  // ignore: unused_field
  final $Res Function(PaginationItemTest) _then;

  @override
  $Res call({
    Object? index = freezed,
  }) {
    return _then(_value.copyWith(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$PaginationItemTestCopyWith<$Res>
    implements $PaginationItemTestCopyWith<$Res> {
  factory _$PaginationItemTestCopyWith(
          _PaginationItemTest value, $Res Function(_PaginationItemTest) then) =
      __$PaginationItemTestCopyWithImpl<$Res>;
  @override
  $Res call({int index});
}

/// @nodoc
class __$PaginationItemTestCopyWithImpl<$Res>
    extends _$PaginationItemTestCopyWithImpl<$Res>
    implements _$PaginationItemTestCopyWith<$Res> {
  __$PaginationItemTestCopyWithImpl(
      _PaginationItemTest _value, $Res Function(_PaginationItemTest) _then)
      : super(_value, (v) => _then(v as _PaginationItemTest));

  @override
  _PaginationItemTest get _value => super._value as _PaginationItemTest;

  @override
  $Res call({
    Object? index = freezed,
  }) {
    return _then(_PaginationItemTest(
      index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_PaginationItemTest extends _PaginationItemTest {
  const _$_PaginationItemTest(this.index) : super._();

  @override
  final int index;

  @override
  String toString() {
    return 'PaginationItemTest(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaginationItemTest &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  _$PaginationItemTestCopyWith<_PaginationItemTest> get copyWith =>
      __$PaginationItemTestCopyWithImpl<_PaginationItemTest>(this, _$identity);
}

abstract class _PaginationItemTest extends PaginationItemTest {
  const factory _PaginationItemTest(int index) = _$_PaginationItemTest;
  const _PaginationItemTest._() : super._();

  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$PaginationItemTestCopyWith<_PaginationItemTest> get copyWith =>
      throw _privateConstructorUsedError;
}

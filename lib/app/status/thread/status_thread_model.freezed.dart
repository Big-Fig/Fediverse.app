// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'status_thread_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$StatusThreadStatusAtIndexTearOff {
  const _$StatusThreadStatusAtIndexTearOff();

  _StatusThreadStatusAtIndex call(
      {required IStatus status, required int index}) {
    return _StatusThreadStatusAtIndex(
      status: status,
      index: index,
    );
  }
}

/// @nodoc
const $StatusThreadStatusAtIndex = _$StatusThreadStatusAtIndexTearOff();

/// @nodoc
mixin _$StatusThreadStatusAtIndex {
  IStatus get status => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StatusThreadStatusAtIndexCopyWith<StatusThreadStatusAtIndex> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusThreadStatusAtIndexCopyWith<$Res> {
  factory $StatusThreadStatusAtIndexCopyWith(StatusThreadStatusAtIndex value,
          $Res Function(StatusThreadStatusAtIndex) then) =
      _$StatusThreadStatusAtIndexCopyWithImpl<$Res>;
  $Res call({IStatus status, int index});
}

/// @nodoc
class _$StatusThreadStatusAtIndexCopyWithImpl<$Res>
    implements $StatusThreadStatusAtIndexCopyWith<$Res> {
  _$StatusThreadStatusAtIndexCopyWithImpl(this._value, this._then);

  final StatusThreadStatusAtIndex _value;
  // ignore: unused_field
  final $Res Function(StatusThreadStatusAtIndex) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? index = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as IStatus,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$StatusThreadStatusAtIndexCopyWith<$Res>
    implements $StatusThreadStatusAtIndexCopyWith<$Res> {
  factory _$StatusThreadStatusAtIndexCopyWith(_StatusThreadStatusAtIndex value,
          $Res Function(_StatusThreadStatusAtIndex) then) =
      __$StatusThreadStatusAtIndexCopyWithImpl<$Res>;
  @override
  $Res call({IStatus status, int index});
}

/// @nodoc
class __$StatusThreadStatusAtIndexCopyWithImpl<$Res>
    extends _$StatusThreadStatusAtIndexCopyWithImpl<$Res>
    implements _$StatusThreadStatusAtIndexCopyWith<$Res> {
  __$StatusThreadStatusAtIndexCopyWithImpl(_StatusThreadStatusAtIndex _value,
      $Res Function(_StatusThreadStatusAtIndex) _then)
      : super(_value, (v) => _then(v as _StatusThreadStatusAtIndex));

  @override
  _StatusThreadStatusAtIndex get _value =>
      super._value as _StatusThreadStatusAtIndex;

  @override
  $Res call({
    Object? status = freezed,
    Object? index = freezed,
  }) {
    return _then(_StatusThreadStatusAtIndex(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as IStatus,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_StatusThreadStatusAtIndex implements _StatusThreadStatusAtIndex {
  const _$_StatusThreadStatusAtIndex(
      {required this.status, required this.index});

  @override
  final IStatus status;
  @override
  final int index;

  @override
  String toString() {
    return 'StatusThreadStatusAtIndex(status: $status, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StatusThreadStatusAtIndex &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(index);

  @JsonKey(ignore: true)
  @override
  _$StatusThreadStatusAtIndexCopyWith<_StatusThreadStatusAtIndex>
      get copyWith =>
          __$StatusThreadStatusAtIndexCopyWithImpl<_StatusThreadStatusAtIndex>(
              this, _$identity);
}

abstract class _StatusThreadStatusAtIndex implements StatusThreadStatusAtIndex {
  const factory _StatusThreadStatusAtIndex(
      {required IStatus status,
      required int index}) = _$_StatusThreadStatusAtIndex;

  @override
  IStatus get status => throw _privateConstructorUsedError;
  @override
  int get index => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StatusThreadStatusAtIndexCopyWith<_StatusThreadStatusAtIndex>
      get copyWith => throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'my_account_featured_hashtag_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MyAccountFeaturedHashtagTearOff {
  const _$MyAccountFeaturedHashtagTearOff();

  _MyAccountFeaturedHashtag call(
      {required String? remoteId,
      required String name,
      required int? statusesCount,
      required DateTime? lastStatusAt}) {
    return _MyAccountFeaturedHashtag(
      remoteId: remoteId,
      name: name,
      statusesCount: statusesCount,
      lastStatusAt: lastStatusAt,
    );
  }
}

/// @nodoc
const $MyAccountFeaturedHashtag = _$MyAccountFeaturedHashtagTearOff();

/// @nodoc
mixin _$MyAccountFeaturedHashtag {
  String? get remoteId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int? get statusesCount => throw _privateConstructorUsedError;
  DateTime? get lastStatusAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyAccountFeaturedHashtagCopyWith<MyAccountFeaturedHashtag> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyAccountFeaturedHashtagCopyWith<$Res> {
  factory $MyAccountFeaturedHashtagCopyWith(MyAccountFeaturedHashtag value,
          $Res Function(MyAccountFeaturedHashtag) then) =
      _$MyAccountFeaturedHashtagCopyWithImpl<$Res>;
  $Res call(
      {String? remoteId,
      String name,
      int? statusesCount,
      DateTime? lastStatusAt});
}

/// @nodoc
class _$MyAccountFeaturedHashtagCopyWithImpl<$Res>
    implements $MyAccountFeaturedHashtagCopyWith<$Res> {
  _$MyAccountFeaturedHashtagCopyWithImpl(this._value, this._then);

  final MyAccountFeaturedHashtag _value;
  // ignore: unused_field
  final $Res Function(MyAccountFeaturedHashtag) _then;

  @override
  $Res call({
    Object? remoteId = freezed,
    Object? name = freezed,
    Object? statusesCount = freezed,
    Object? lastStatusAt = freezed,
  }) {
    return _then(_value.copyWith(
      remoteId: remoteId == freezed
          ? _value.remoteId
          : remoteId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      statusesCount: statusesCount == freezed
          ? _value.statusesCount
          : statusesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      lastStatusAt: lastStatusAt == freezed
          ? _value.lastStatusAt
          : lastStatusAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$MyAccountFeaturedHashtagCopyWith<$Res>
    implements $MyAccountFeaturedHashtagCopyWith<$Res> {
  factory _$MyAccountFeaturedHashtagCopyWith(_MyAccountFeaturedHashtag value,
          $Res Function(_MyAccountFeaturedHashtag) then) =
      __$MyAccountFeaturedHashtagCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? remoteId,
      String name,
      int? statusesCount,
      DateTime? lastStatusAt});
}

/// @nodoc
class __$MyAccountFeaturedHashtagCopyWithImpl<$Res>
    extends _$MyAccountFeaturedHashtagCopyWithImpl<$Res>
    implements _$MyAccountFeaturedHashtagCopyWith<$Res> {
  __$MyAccountFeaturedHashtagCopyWithImpl(_MyAccountFeaturedHashtag _value,
      $Res Function(_MyAccountFeaturedHashtag) _then)
      : super(_value, (v) => _then(v as _MyAccountFeaturedHashtag));

  @override
  _MyAccountFeaturedHashtag get _value =>
      super._value as _MyAccountFeaturedHashtag;

  @override
  $Res call({
    Object? remoteId = freezed,
    Object? name = freezed,
    Object? statusesCount = freezed,
    Object? lastStatusAt = freezed,
  }) {
    return _then(_MyAccountFeaturedHashtag(
      remoteId: remoteId == freezed
          ? _value.remoteId
          : remoteId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      statusesCount: statusesCount == freezed
          ? _value.statusesCount
          : statusesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      lastStatusAt: lastStatusAt == freezed
          ? _value.lastStatusAt
          : lastStatusAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_MyAccountFeaturedHashtag implements _MyAccountFeaturedHashtag {
  const _$_MyAccountFeaturedHashtag(
      {required this.remoteId,
      required this.name,
      required this.statusesCount,
      required this.lastStatusAt});

  @override
  final String? remoteId;
  @override
  final String name;
  @override
  final int? statusesCount;
  @override
  final DateTime? lastStatusAt;

  @override
  String toString() {
    return 'MyAccountFeaturedHashtag(remoteId: $remoteId, name: $name, statusesCount: $statusesCount, lastStatusAt: $lastStatusAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MyAccountFeaturedHashtag &&
            (identical(other.remoteId, remoteId) ||
                other.remoteId == remoteId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.statusesCount, statusesCount) ||
                other.statusesCount == statusesCount) &&
            (identical(other.lastStatusAt, lastStatusAt) ||
                other.lastStatusAt == lastStatusAt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, remoteId, name, statusesCount, lastStatusAt);

  @JsonKey(ignore: true)
  @override
  _$MyAccountFeaturedHashtagCopyWith<_MyAccountFeaturedHashtag> get copyWith =>
      __$MyAccountFeaturedHashtagCopyWithImpl<_MyAccountFeaturedHashtag>(
          this, _$identity);
}

abstract class _MyAccountFeaturedHashtag implements MyAccountFeaturedHashtag {
  const factory _MyAccountFeaturedHashtag(
      {required String? remoteId,
      required String name,
      required int? statusesCount,
      required DateTime? lastStatusAt}) = _$_MyAccountFeaturedHashtag;

  @override
  String? get remoteId;
  @override
  String get name;
  @override
  int? get statusesCount;
  @override
  DateTime? get lastStatusAt;
  @override
  @JsonKey(ignore: true)
  _$MyAccountFeaturedHashtagCopyWith<_MyAccountFeaturedHashtag> get copyWith =>
      throw _privateConstructorUsedError;
}

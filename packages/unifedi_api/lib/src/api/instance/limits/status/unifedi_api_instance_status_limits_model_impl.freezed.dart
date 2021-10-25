// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_instance_status_limits_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiInstanceStatusLimits _$UnifediApiInstanceStatusLimitsFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiInstanceStatusLimits.fromJson(json);
}

/// @nodoc
class _$UnifediApiInstanceStatusLimitsTearOff {
  const _$UnifediApiInstanceStatusLimitsTearOff();

  _UnifediApiInstanceStatusLimits call(
      {@HiveField(0)
      @JsonKey(name: 'max_toot_chars')
          required int? maxTootChars,
      @HiveField(1)
      @JsonKey(name: 'max_media_attachments_count')
          required int? maxMediaAttachmentsCount}) {
    return _UnifediApiInstanceStatusLimits(
      maxTootChars: maxTootChars,
      maxMediaAttachmentsCount: maxMediaAttachmentsCount,
    );
  }

  UnifediApiInstanceStatusLimits fromJson(Map<String, Object> json) {
    return UnifediApiInstanceStatusLimits.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiInstanceStatusLimits =
    _$UnifediApiInstanceStatusLimitsTearOff();

/// @nodoc
mixin _$UnifediApiInstanceStatusLimits {
  @HiveField(0)
  @JsonKey(name: 'max_toot_chars')
  int? get maxTootChars => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'max_media_attachments_count')
  int? get maxMediaAttachmentsCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiInstanceStatusLimitsCopyWith<UnifediApiInstanceStatusLimits>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiInstanceStatusLimitsCopyWith<$Res> {
  factory $UnifediApiInstanceStatusLimitsCopyWith(
          UnifediApiInstanceStatusLimits value,
          $Res Function(UnifediApiInstanceStatusLimits) then) =
      _$UnifediApiInstanceStatusLimitsCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'max_toot_chars')
          int? maxTootChars,
      @HiveField(1)
      @JsonKey(name: 'max_media_attachments_count')
          int? maxMediaAttachmentsCount});
}

/// @nodoc
class _$UnifediApiInstanceStatusLimitsCopyWithImpl<$Res>
    implements $UnifediApiInstanceStatusLimitsCopyWith<$Res> {
  _$UnifediApiInstanceStatusLimitsCopyWithImpl(this._value, this._then);

  final UnifediApiInstanceStatusLimits _value;
  // ignore: unused_field
  final $Res Function(UnifediApiInstanceStatusLimits) _then;

  @override
  $Res call({
    Object? maxTootChars = freezed,
    Object? maxMediaAttachmentsCount = freezed,
  }) {
    return _then(_value.copyWith(
      maxTootChars: maxTootChars == freezed
          ? _value.maxTootChars
          : maxTootChars // ignore: cast_nullable_to_non_nullable
              as int?,
      maxMediaAttachmentsCount: maxMediaAttachmentsCount == freezed
          ? _value.maxMediaAttachmentsCount
          : maxMediaAttachmentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$UnifediApiInstanceStatusLimitsCopyWith<$Res>
    implements $UnifediApiInstanceStatusLimitsCopyWith<$Res> {
  factory _$UnifediApiInstanceStatusLimitsCopyWith(
          _UnifediApiInstanceStatusLimits value,
          $Res Function(_UnifediApiInstanceStatusLimits) then) =
      __$UnifediApiInstanceStatusLimitsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'max_toot_chars')
          int? maxTootChars,
      @HiveField(1)
      @JsonKey(name: 'max_media_attachments_count')
          int? maxMediaAttachmentsCount});
}

/// @nodoc
class __$UnifediApiInstanceStatusLimitsCopyWithImpl<$Res>
    extends _$UnifediApiInstanceStatusLimitsCopyWithImpl<$Res>
    implements _$UnifediApiInstanceStatusLimitsCopyWith<$Res> {
  __$UnifediApiInstanceStatusLimitsCopyWithImpl(
      _UnifediApiInstanceStatusLimits _value,
      $Res Function(_UnifediApiInstanceStatusLimits) _then)
      : super(_value, (v) => _then(v as _UnifediApiInstanceStatusLimits));

  @override
  _UnifediApiInstanceStatusLimits get _value =>
      super._value as _UnifediApiInstanceStatusLimits;

  @override
  $Res call({
    Object? maxTootChars = freezed,
    Object? maxMediaAttachmentsCount = freezed,
  }) {
    return _then(_UnifediApiInstanceStatusLimits(
      maxTootChars: maxTootChars == freezed
          ? _value.maxTootChars
          : maxTootChars // ignore: cast_nullable_to_non_nullable
              as int?,
      maxMediaAttachmentsCount: maxMediaAttachmentsCount == freezed
          ? _value.maxMediaAttachmentsCount
          : maxMediaAttachmentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiInstanceStatusLimits
    implements _UnifediApiInstanceStatusLimits {
  const _$_UnifediApiInstanceStatusLimits(
      {@HiveField(0)
      @JsonKey(name: 'max_toot_chars')
          required this.maxTootChars,
      @HiveField(1)
      @JsonKey(name: 'max_media_attachments_count')
          required this.maxMediaAttachmentsCount});

  factory _$_UnifediApiInstanceStatusLimits.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiInstanceStatusLimitsFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'max_toot_chars')
  final int? maxTootChars;
  @override
  @HiveField(1)
  @JsonKey(name: 'max_media_attachments_count')
  final int? maxMediaAttachmentsCount;

  @override
  String toString() {
    return 'UnifediApiInstanceStatusLimits(maxTootChars: $maxTootChars, maxMediaAttachmentsCount: $maxMediaAttachmentsCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiInstanceStatusLimits &&
            (identical(other.maxTootChars, maxTootChars) ||
                const DeepCollectionEquality()
                    .equals(other.maxTootChars, maxTootChars)) &&
            (identical(
                    other.maxMediaAttachmentsCount, maxMediaAttachmentsCount) ||
                const DeepCollectionEquality().equals(
                    other.maxMediaAttachmentsCount, maxMediaAttachmentsCount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(maxTootChars) ^
      const DeepCollectionEquality().hash(maxMediaAttachmentsCount);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiInstanceStatusLimitsCopyWith<_UnifediApiInstanceStatusLimits>
      get copyWith => __$UnifediApiInstanceStatusLimitsCopyWithImpl<
          _UnifediApiInstanceStatusLimits>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiInstanceStatusLimitsToJson(this);
  }
}

abstract class _UnifediApiInstanceStatusLimits
    implements UnifediApiInstanceStatusLimits {
  const factory _UnifediApiInstanceStatusLimits(
          {@HiveField(0)
          @JsonKey(name: 'max_toot_chars')
              required int? maxTootChars,
          @HiveField(1)
          @JsonKey(name: 'max_media_attachments_count')
              required int? maxMediaAttachmentsCount}) =
      _$_UnifediApiInstanceStatusLimits;

  factory _UnifediApiInstanceStatusLimits.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiInstanceStatusLimits.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'max_toot_chars')
  int? get maxTootChars => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  @JsonKey(name: 'max_media_attachments_count')
  int? get maxMediaAttachmentsCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiInstanceStatusLimitsCopyWith<_UnifediApiInstanceStatusLimits>
      get copyWith => throw _privateConstructorUsedError;
}

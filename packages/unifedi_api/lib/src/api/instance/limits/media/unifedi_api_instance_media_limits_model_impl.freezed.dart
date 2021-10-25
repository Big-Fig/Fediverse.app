// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_instance_media_limits_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiInstanceMediaLimits _$UnifediApiInstanceMediaLimitsFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiInstanceMediaLimits.fromJson(json);
}

/// @nodoc
class _$UnifediApiInstanceMediaLimitsTearOff {
  const _$UnifediApiInstanceMediaLimitsTearOff();

  _UnifediApiInstanceMediaLimits call(
      {@HiveField(0)
      @JsonKey(name: 'upload_limit')
          required int? uploadLimit,
      @HiveField(1)
      @JsonKey(name: 'avatar_upload_limit')
          required int? avatarUploadLimit,
      @HiveField(2)
      @JsonKey(name: 'background_upload_limit')
          required int? backgroundUploadLimit,
      @HiveField(3)
      @JsonKey(name: 'banner_upload_limit')
          required int? bannerUploadLimit,
      @HiveField(4)
      @JsonKey(name: 'description_limit')
          required int? descriptionLimit}) {
    return _UnifediApiInstanceMediaLimits(
      uploadLimit: uploadLimit,
      avatarUploadLimit: avatarUploadLimit,
      backgroundUploadLimit: backgroundUploadLimit,
      bannerUploadLimit: bannerUploadLimit,
      descriptionLimit: descriptionLimit,
    );
  }

  UnifediApiInstanceMediaLimits fromJson(Map<String, Object> json) {
    return UnifediApiInstanceMediaLimits.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiInstanceMediaLimits = _$UnifediApiInstanceMediaLimitsTearOff();

/// @nodoc
mixin _$UnifediApiInstanceMediaLimits {
  @HiveField(0)
  @JsonKey(name: 'upload_limit')
  int? get uploadLimit => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'avatar_upload_limit')
  int? get avatarUploadLimit => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'background_upload_limit')
  int? get backgroundUploadLimit => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'banner_upload_limit')
  int? get bannerUploadLimit => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: 'description_limit')
  int? get descriptionLimit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiInstanceMediaLimitsCopyWith<UnifediApiInstanceMediaLimits>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiInstanceMediaLimitsCopyWith<$Res> {
  factory $UnifediApiInstanceMediaLimitsCopyWith(
          UnifediApiInstanceMediaLimits value,
          $Res Function(UnifediApiInstanceMediaLimits) then) =
      _$UnifediApiInstanceMediaLimitsCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'upload_limit')
          int? uploadLimit,
      @HiveField(1)
      @JsonKey(name: 'avatar_upload_limit')
          int? avatarUploadLimit,
      @HiveField(2)
      @JsonKey(name: 'background_upload_limit')
          int? backgroundUploadLimit,
      @HiveField(3)
      @JsonKey(name: 'banner_upload_limit')
          int? bannerUploadLimit,
      @HiveField(4)
      @JsonKey(name: 'description_limit')
          int? descriptionLimit});
}

/// @nodoc
class _$UnifediApiInstanceMediaLimitsCopyWithImpl<$Res>
    implements $UnifediApiInstanceMediaLimitsCopyWith<$Res> {
  _$UnifediApiInstanceMediaLimitsCopyWithImpl(this._value, this._then);

  final UnifediApiInstanceMediaLimits _value;
  // ignore: unused_field
  final $Res Function(UnifediApiInstanceMediaLimits) _then;

  @override
  $Res call({
    Object? uploadLimit = freezed,
    Object? avatarUploadLimit = freezed,
    Object? backgroundUploadLimit = freezed,
    Object? bannerUploadLimit = freezed,
    Object? descriptionLimit = freezed,
  }) {
    return _then(_value.copyWith(
      uploadLimit: uploadLimit == freezed
          ? _value.uploadLimit
          : uploadLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      avatarUploadLimit: avatarUploadLimit == freezed
          ? _value.avatarUploadLimit
          : avatarUploadLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      backgroundUploadLimit: backgroundUploadLimit == freezed
          ? _value.backgroundUploadLimit
          : backgroundUploadLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      bannerUploadLimit: bannerUploadLimit == freezed
          ? _value.bannerUploadLimit
          : bannerUploadLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      descriptionLimit: descriptionLimit == freezed
          ? _value.descriptionLimit
          : descriptionLimit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$UnifediApiInstanceMediaLimitsCopyWith<$Res>
    implements $UnifediApiInstanceMediaLimitsCopyWith<$Res> {
  factory _$UnifediApiInstanceMediaLimitsCopyWith(
          _UnifediApiInstanceMediaLimits value,
          $Res Function(_UnifediApiInstanceMediaLimits) then) =
      __$UnifediApiInstanceMediaLimitsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'upload_limit')
          int? uploadLimit,
      @HiveField(1)
      @JsonKey(name: 'avatar_upload_limit')
          int? avatarUploadLimit,
      @HiveField(2)
      @JsonKey(name: 'background_upload_limit')
          int? backgroundUploadLimit,
      @HiveField(3)
      @JsonKey(name: 'banner_upload_limit')
          int? bannerUploadLimit,
      @HiveField(4)
      @JsonKey(name: 'description_limit')
          int? descriptionLimit});
}

/// @nodoc
class __$UnifediApiInstanceMediaLimitsCopyWithImpl<$Res>
    extends _$UnifediApiInstanceMediaLimitsCopyWithImpl<$Res>
    implements _$UnifediApiInstanceMediaLimitsCopyWith<$Res> {
  __$UnifediApiInstanceMediaLimitsCopyWithImpl(
      _UnifediApiInstanceMediaLimits _value,
      $Res Function(_UnifediApiInstanceMediaLimits) _then)
      : super(_value, (v) => _then(v as _UnifediApiInstanceMediaLimits));

  @override
  _UnifediApiInstanceMediaLimits get _value =>
      super._value as _UnifediApiInstanceMediaLimits;

  @override
  $Res call({
    Object? uploadLimit = freezed,
    Object? avatarUploadLimit = freezed,
    Object? backgroundUploadLimit = freezed,
    Object? bannerUploadLimit = freezed,
    Object? descriptionLimit = freezed,
  }) {
    return _then(_UnifediApiInstanceMediaLimits(
      uploadLimit: uploadLimit == freezed
          ? _value.uploadLimit
          : uploadLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      avatarUploadLimit: avatarUploadLimit == freezed
          ? _value.avatarUploadLimit
          : avatarUploadLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      backgroundUploadLimit: backgroundUploadLimit == freezed
          ? _value.backgroundUploadLimit
          : backgroundUploadLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      bannerUploadLimit: bannerUploadLimit == freezed
          ? _value.bannerUploadLimit
          : bannerUploadLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      descriptionLimit: descriptionLimit == freezed
          ? _value.descriptionLimit
          : descriptionLimit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiInstanceMediaLimits
    implements _UnifediApiInstanceMediaLimits {
  const _$_UnifediApiInstanceMediaLimits(
      {@HiveField(0)
      @JsonKey(name: 'upload_limit')
          required this.uploadLimit,
      @HiveField(1)
      @JsonKey(name: 'avatar_upload_limit')
          required this.avatarUploadLimit,
      @HiveField(2)
      @JsonKey(name: 'background_upload_limit')
          required this.backgroundUploadLimit,
      @HiveField(3)
      @JsonKey(name: 'banner_upload_limit')
          required this.bannerUploadLimit,
      @HiveField(4)
      @JsonKey(name: 'description_limit')
          required this.descriptionLimit});

  factory _$_UnifediApiInstanceMediaLimits.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiInstanceMediaLimitsFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'upload_limit')
  final int? uploadLimit;
  @override
  @HiveField(1)
  @JsonKey(name: 'avatar_upload_limit')
  final int? avatarUploadLimit;
  @override
  @HiveField(2)
  @JsonKey(name: 'background_upload_limit')
  final int? backgroundUploadLimit;
  @override
  @HiveField(3)
  @JsonKey(name: 'banner_upload_limit')
  final int? bannerUploadLimit;
  @override
  @HiveField(4)
  @JsonKey(name: 'description_limit')
  final int? descriptionLimit;

  @override
  String toString() {
    return 'UnifediApiInstanceMediaLimits(uploadLimit: $uploadLimit, avatarUploadLimit: $avatarUploadLimit, backgroundUploadLimit: $backgroundUploadLimit, bannerUploadLimit: $bannerUploadLimit, descriptionLimit: $descriptionLimit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiInstanceMediaLimits &&
            (identical(other.uploadLimit, uploadLimit) ||
                const DeepCollectionEquality()
                    .equals(other.uploadLimit, uploadLimit)) &&
            (identical(other.avatarUploadLimit, avatarUploadLimit) ||
                const DeepCollectionEquality()
                    .equals(other.avatarUploadLimit, avatarUploadLimit)) &&
            (identical(other.backgroundUploadLimit, backgroundUploadLimit) ||
                const DeepCollectionEquality().equals(
                    other.backgroundUploadLimit, backgroundUploadLimit)) &&
            (identical(other.bannerUploadLimit, bannerUploadLimit) ||
                const DeepCollectionEquality()
                    .equals(other.bannerUploadLimit, bannerUploadLimit)) &&
            (identical(other.descriptionLimit, descriptionLimit) ||
                const DeepCollectionEquality()
                    .equals(other.descriptionLimit, descriptionLimit)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(uploadLimit) ^
      const DeepCollectionEquality().hash(avatarUploadLimit) ^
      const DeepCollectionEquality().hash(backgroundUploadLimit) ^
      const DeepCollectionEquality().hash(bannerUploadLimit) ^
      const DeepCollectionEquality().hash(descriptionLimit);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiInstanceMediaLimitsCopyWith<_UnifediApiInstanceMediaLimits>
      get copyWith => __$UnifediApiInstanceMediaLimitsCopyWithImpl<
          _UnifediApiInstanceMediaLimits>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiInstanceMediaLimitsToJson(this);
  }
}

abstract class _UnifediApiInstanceMediaLimits
    implements UnifediApiInstanceMediaLimits {
  const factory _UnifediApiInstanceMediaLimits(
      {@HiveField(0)
      @JsonKey(name: 'upload_limit')
          required int? uploadLimit,
      @HiveField(1)
      @JsonKey(name: 'avatar_upload_limit')
          required int? avatarUploadLimit,
      @HiveField(2)
      @JsonKey(name: 'background_upload_limit')
          required int? backgroundUploadLimit,
      @HiveField(3)
      @JsonKey(name: 'banner_upload_limit')
          required int? bannerUploadLimit,
      @HiveField(4)
      @JsonKey(name: 'description_limit')
          required int? descriptionLimit}) = _$_UnifediApiInstanceMediaLimits;

  factory _UnifediApiInstanceMediaLimits.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiInstanceMediaLimits.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'upload_limit')
  int? get uploadLimit => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  @JsonKey(name: 'avatar_upload_limit')
  int? get avatarUploadLimit => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  @JsonKey(name: 'background_upload_limit')
  int? get backgroundUploadLimit => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  @JsonKey(name: 'banner_upload_limit')
  int? get bannerUploadLimit => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  @JsonKey(name: 'description_limit')
  int? get descriptionLimit => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiInstanceMediaLimitsCopyWith<_UnifediApiInstanceMediaLimits>
      get copyWith => throw _privateConstructorUsedError;
}

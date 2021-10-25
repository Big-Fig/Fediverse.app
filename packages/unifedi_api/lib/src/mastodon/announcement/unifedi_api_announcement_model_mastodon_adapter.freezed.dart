// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_announcement_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiAnnouncementMastodonAdapter
    _$UnifediApiAnnouncementMastodonAdapterFromJson(Map<String, dynamic> json) {
  return _UnifediApiAnnouncementMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiAnnouncementMastodonAdapterTearOff {
  const _$UnifediApiAnnouncementMastodonAdapterTearOff();

  _UnifediApiAnnouncementMastodonAdapter call(
      @HiveField(0) MastodonApiAnnouncement value) {
    return _UnifediApiAnnouncementMastodonAdapter(
      value,
    );
  }

  UnifediApiAnnouncementMastodonAdapter fromJson(Map<String, Object> json) {
    return UnifediApiAnnouncementMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiAnnouncementMastodonAdapter =
    _$UnifediApiAnnouncementMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiAnnouncementMastodonAdapter {
  @HiveField(0)
  MastodonApiAnnouncement get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiAnnouncementMastodonAdapterCopyWith<
          UnifediApiAnnouncementMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiAnnouncementMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiAnnouncementMastodonAdapterCopyWith(
          UnifediApiAnnouncementMastodonAdapter value,
          $Res Function(UnifediApiAnnouncementMastodonAdapter) then) =
      _$UnifediApiAnnouncementMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiAnnouncement value});

  $MastodonApiAnnouncementCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiAnnouncementMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiAnnouncementMastodonAdapterCopyWith<$Res> {
  _$UnifediApiAnnouncementMastodonAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiAnnouncementMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiAnnouncementMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiAnnouncement,
    ));
  }

  @override
  $MastodonApiAnnouncementCopyWith<$Res> get value {
    return $MastodonApiAnnouncementCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiAnnouncementMastodonAdapterCopyWith<$Res>
    implements $UnifediApiAnnouncementMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiAnnouncementMastodonAdapterCopyWith(
          _UnifediApiAnnouncementMastodonAdapter value,
          $Res Function(_UnifediApiAnnouncementMastodonAdapter) then) =
      __$UnifediApiAnnouncementMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiAnnouncement value});

  @override
  $MastodonApiAnnouncementCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiAnnouncementMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiAnnouncementMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiAnnouncementMastodonAdapterCopyWith<$Res> {
  __$UnifediApiAnnouncementMastodonAdapterCopyWithImpl(
      _UnifediApiAnnouncementMastodonAdapter _value,
      $Res Function(_UnifediApiAnnouncementMastodonAdapter) _then)
      : super(
            _value, (v) => _then(v as _UnifediApiAnnouncementMastodonAdapter));

  @override
  _UnifediApiAnnouncementMastodonAdapter get _value =>
      super._value as _UnifediApiAnnouncementMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiAnnouncementMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiAnnouncement,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiAnnouncementMastodonAdapter
    extends _UnifediApiAnnouncementMastodonAdapter {
  const _$_UnifediApiAnnouncementMastodonAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiAnnouncementMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiAnnouncementMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiAnnouncement value;

  @override
  String toString() {
    return 'UnifediApiAnnouncementMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiAnnouncementMastodonAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiAnnouncementMastodonAdapterCopyWith<
          _UnifediApiAnnouncementMastodonAdapter>
      get copyWith => __$UnifediApiAnnouncementMastodonAdapterCopyWithImpl<
          _UnifediApiAnnouncementMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiAnnouncementMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiAnnouncementMastodonAdapter
    extends UnifediApiAnnouncementMastodonAdapter {
  const factory _UnifediApiAnnouncementMastodonAdapter(
          @HiveField(0) MastodonApiAnnouncement value) =
      _$_UnifediApiAnnouncementMastodonAdapter;
  const _UnifediApiAnnouncementMastodonAdapter._() : super._();

  factory _UnifediApiAnnouncementMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiAnnouncementMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiAnnouncement get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiAnnouncementMastodonAdapterCopyWith<
          _UnifediApiAnnouncementMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

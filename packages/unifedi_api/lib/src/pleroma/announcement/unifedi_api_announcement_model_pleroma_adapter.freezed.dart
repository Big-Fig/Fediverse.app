// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_announcement_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiAnnouncementPleromaAdapter
    _$UnifediApiAnnouncementPleromaAdapterFromJson(Map<String, dynamic> json) {
  return _UnifediApiAnnouncementPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiAnnouncementPleromaAdapterTearOff {
  const _$UnifediApiAnnouncementPleromaAdapterTearOff();

  _UnifediApiAnnouncementPleromaAdapter call(
      @HiveField(0) PleromaApiAnnouncement value) {
    return _UnifediApiAnnouncementPleromaAdapter(
      value,
    );
  }

  UnifediApiAnnouncementPleromaAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiAnnouncementPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiAnnouncementPleromaAdapter =
    _$UnifediApiAnnouncementPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiAnnouncementPleromaAdapter {
  @HiveField(0)
  PleromaApiAnnouncement get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiAnnouncementPleromaAdapterCopyWith<
          UnifediApiAnnouncementPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiAnnouncementPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiAnnouncementPleromaAdapterCopyWith(
          UnifediApiAnnouncementPleromaAdapter value,
          $Res Function(UnifediApiAnnouncementPleromaAdapter) then) =
      _$UnifediApiAnnouncementPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiAnnouncement value});

  $PleromaApiAnnouncementCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiAnnouncementPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiAnnouncementPleromaAdapterCopyWith<$Res> {
  _$UnifediApiAnnouncementPleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiAnnouncementPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiAnnouncementPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiAnnouncement,
    ));
  }

  @override
  $PleromaApiAnnouncementCopyWith<$Res> get value {
    return $PleromaApiAnnouncementCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiAnnouncementPleromaAdapterCopyWith<$Res>
    implements $UnifediApiAnnouncementPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiAnnouncementPleromaAdapterCopyWith(
          _UnifediApiAnnouncementPleromaAdapter value,
          $Res Function(_UnifediApiAnnouncementPleromaAdapter) then) =
      __$UnifediApiAnnouncementPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiAnnouncement value});

  @override
  $PleromaApiAnnouncementCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiAnnouncementPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiAnnouncementPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiAnnouncementPleromaAdapterCopyWith<$Res> {
  __$UnifediApiAnnouncementPleromaAdapterCopyWithImpl(
      _UnifediApiAnnouncementPleromaAdapter _value,
      $Res Function(_UnifediApiAnnouncementPleromaAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiAnnouncementPleromaAdapter));

  @override
  _UnifediApiAnnouncementPleromaAdapter get _value =>
      super._value as _UnifediApiAnnouncementPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiAnnouncementPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiAnnouncement,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiAnnouncementPleromaAdapter
    extends _UnifediApiAnnouncementPleromaAdapter {
  const _$_UnifediApiAnnouncementPleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiAnnouncementPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiAnnouncementPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiAnnouncement value;

  @override
  String toString() {
    return 'UnifediApiAnnouncementPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiAnnouncementPleromaAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiAnnouncementPleromaAdapterCopyWith<
          _UnifediApiAnnouncementPleromaAdapter>
      get copyWith => __$UnifediApiAnnouncementPleromaAdapterCopyWithImpl<
          _UnifediApiAnnouncementPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiAnnouncementPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiAnnouncementPleromaAdapter
    extends UnifediApiAnnouncementPleromaAdapter {
  const factory _UnifediApiAnnouncementPleromaAdapter(
          @HiveField(0) PleromaApiAnnouncement value) =
      _$_UnifediApiAnnouncementPleromaAdapter;
  const _UnifediApiAnnouncementPleromaAdapter._() : super._();

  factory _UnifediApiAnnouncementPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiAnnouncementPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiAnnouncement get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiAnnouncementPleromaAdapterCopyWith<
          _UnifediApiAnnouncementPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_tag_history_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiTagHistoryMastodonAdapter
    _$UnifediApiTagHistoryMastodonAdapterFromJson(Map<String, dynamic> json) {
  return _UnifediApiTagHistoryMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiTagHistoryMastodonAdapterTearOff {
  const _$UnifediApiTagHistoryMastodonAdapterTearOff();

  _UnifediApiTagHistoryMastodonAdapter call(
      @HiveField(0) List<MastodonApiTagHistoryItem> value) {
    return _UnifediApiTagHistoryMastodonAdapter(
      value,
    );
  }

  UnifediApiTagHistoryMastodonAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiTagHistoryMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiTagHistoryMastodonAdapter =
    _$UnifediApiTagHistoryMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiTagHistoryMastodonAdapter {
  @HiveField(0)
  List<MastodonApiTagHistoryItem> get value =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiTagHistoryMastodonAdapterCopyWith<
          UnifediApiTagHistoryMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiTagHistoryMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiTagHistoryMastodonAdapterCopyWith(
          UnifediApiTagHistoryMastodonAdapter value,
          $Res Function(UnifediApiTagHistoryMastodonAdapter) then) =
      _$UnifediApiTagHistoryMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) List<MastodonApiTagHistoryItem> value});
}

/// @nodoc
class _$UnifediApiTagHistoryMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiTagHistoryMastodonAdapterCopyWith<$Res> {
  _$UnifediApiTagHistoryMastodonAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiTagHistoryMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiTagHistoryMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiTagHistoryItem>,
    ));
  }
}

/// @nodoc
abstract class _$UnifediApiTagHistoryMastodonAdapterCopyWith<$Res>
    implements $UnifediApiTagHistoryMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiTagHistoryMastodonAdapterCopyWith(
          _UnifediApiTagHistoryMastodonAdapter value,
          $Res Function(_UnifediApiTagHistoryMastodonAdapter) then) =
      __$UnifediApiTagHistoryMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) List<MastodonApiTagHistoryItem> value});
}

/// @nodoc
class __$UnifediApiTagHistoryMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiTagHistoryMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiTagHistoryMastodonAdapterCopyWith<$Res> {
  __$UnifediApiTagHistoryMastodonAdapterCopyWithImpl(
      _UnifediApiTagHistoryMastodonAdapter _value,
      $Res Function(_UnifediApiTagHistoryMastodonAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiTagHistoryMastodonAdapter));

  @override
  _UnifediApiTagHistoryMastodonAdapter get _value =>
      super._value as _UnifediApiTagHistoryMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiTagHistoryMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiTagHistoryItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiTagHistoryMastodonAdapter
    extends _UnifediApiTagHistoryMastodonAdapter {
  const _$_UnifediApiTagHistoryMastodonAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiTagHistoryMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiTagHistoryMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final List<MastodonApiTagHistoryItem> value;

  @override
  String toString() {
    return 'UnifediApiTagHistoryMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiTagHistoryMastodonAdapter &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$UnifediApiTagHistoryMastodonAdapterCopyWith<
          _UnifediApiTagHistoryMastodonAdapter>
      get copyWith => __$UnifediApiTagHistoryMastodonAdapterCopyWithImpl<
          _UnifediApiTagHistoryMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiTagHistoryMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiTagHistoryMastodonAdapter
    extends UnifediApiTagHistoryMastodonAdapter {
  const factory _UnifediApiTagHistoryMastodonAdapter(
          @HiveField(0) List<MastodonApiTagHistoryItem> value) =
      _$_UnifediApiTagHistoryMastodonAdapter;
  const _UnifediApiTagHistoryMastodonAdapter._() : super._();

  factory _UnifediApiTagHistoryMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiTagHistoryMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  List<MastodonApiTagHistoryItem> get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiTagHistoryMastodonAdapterCopyWith<
          _UnifediApiTagHistoryMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

UnifediApiTagHistoryItemMastodonAdapter
    _$UnifediApiTagHistoryItemMastodonAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiTagHistoryItemMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiTagHistoryItemMastodonAdapterTearOff {
  const _$UnifediApiTagHistoryItemMastodonAdapterTearOff();

  _UnifediApiTagHistoryItemMastodonAdapter call(
      @HiveField(0) MastodonApiTagHistoryItem value) {
    return _UnifediApiTagHistoryItemMastodonAdapter(
      value,
    );
  }

  UnifediApiTagHistoryItemMastodonAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiTagHistoryItemMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiTagHistoryItemMastodonAdapter =
    _$UnifediApiTagHistoryItemMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiTagHistoryItemMastodonAdapter {
  @HiveField(0)
  MastodonApiTagHistoryItem get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiTagHistoryItemMastodonAdapterCopyWith<
          UnifediApiTagHistoryItemMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiTagHistoryItemMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiTagHistoryItemMastodonAdapterCopyWith(
          UnifediApiTagHistoryItemMastodonAdapter value,
          $Res Function(UnifediApiTagHistoryItemMastodonAdapter) then) =
      _$UnifediApiTagHistoryItemMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiTagHistoryItem value});

  $MastodonApiTagHistoryItemCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiTagHistoryItemMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiTagHistoryItemMastodonAdapterCopyWith<$Res> {
  _$UnifediApiTagHistoryItemMastodonAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiTagHistoryItemMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiTagHistoryItemMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiTagHistoryItem,
    ));
  }

  @override
  $MastodonApiTagHistoryItemCopyWith<$Res> get value {
    return $MastodonApiTagHistoryItemCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiTagHistoryItemMastodonAdapterCopyWith<$Res>
    implements $UnifediApiTagHistoryItemMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiTagHistoryItemMastodonAdapterCopyWith(
          _UnifediApiTagHistoryItemMastodonAdapter value,
          $Res Function(_UnifediApiTagHistoryItemMastodonAdapter) then) =
      __$UnifediApiTagHistoryItemMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiTagHistoryItem value});

  @override
  $MastodonApiTagHistoryItemCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiTagHistoryItemMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiTagHistoryItemMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiTagHistoryItemMastodonAdapterCopyWith<$Res> {
  __$UnifediApiTagHistoryItemMastodonAdapterCopyWithImpl(
      _UnifediApiTagHistoryItemMastodonAdapter _value,
      $Res Function(_UnifediApiTagHistoryItemMastodonAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiTagHistoryItemMastodonAdapter));

  @override
  _UnifediApiTagHistoryItemMastodonAdapter get _value =>
      super._value as _UnifediApiTagHistoryItemMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiTagHistoryItemMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiTagHistoryItem,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiTagHistoryItemMastodonAdapter
    extends _UnifediApiTagHistoryItemMastodonAdapter {
  const _$_UnifediApiTagHistoryItemMastodonAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiTagHistoryItemMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiTagHistoryItemMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiTagHistoryItem value;

  @override
  String toString() {
    return 'UnifediApiTagHistoryItemMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiTagHistoryItemMastodonAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiTagHistoryItemMastodonAdapterCopyWith<
          _UnifediApiTagHistoryItemMastodonAdapter>
      get copyWith => __$UnifediApiTagHistoryItemMastodonAdapterCopyWithImpl<
          _UnifediApiTagHistoryItemMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiTagHistoryItemMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiTagHistoryItemMastodonAdapter
    extends UnifediApiTagHistoryItemMastodonAdapter {
  const factory _UnifediApiTagHistoryItemMastodonAdapter(
          @HiveField(0) MastodonApiTagHistoryItem value) =
      _$_UnifediApiTagHistoryItemMastodonAdapter;
  const _UnifediApiTagHistoryItemMastodonAdapter._() : super._();

  factory _UnifediApiTagHistoryItemMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiTagHistoryItemMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiTagHistoryItem get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiTagHistoryItemMastodonAdapterCopyWith<
          _UnifediApiTagHistoryItemMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

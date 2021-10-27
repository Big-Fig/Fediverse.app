// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_tag_history_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiTagHistoryPleromaAdapter _$UnifediApiTagHistoryPleromaAdapterFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiTagHistoryPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiTagHistoryPleromaAdapterTearOff {
  const _$UnifediApiTagHistoryPleromaAdapterTearOff();

  _UnifediApiTagHistoryPleromaAdapter call(
      @HiveField(0) List<PleromaApiTagHistoryItem> value) {
    return _UnifediApiTagHistoryPleromaAdapter(
      value,
    );
  }

  UnifediApiTagHistoryPleromaAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiTagHistoryPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiTagHistoryPleromaAdapter =
    _$UnifediApiTagHistoryPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiTagHistoryPleromaAdapter {
  @HiveField(0)
  List<PleromaApiTagHistoryItem> get value =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiTagHistoryPleromaAdapterCopyWith<
          UnifediApiTagHistoryPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiTagHistoryPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiTagHistoryPleromaAdapterCopyWith(
          UnifediApiTagHistoryPleromaAdapter value,
          $Res Function(UnifediApiTagHistoryPleromaAdapter) then) =
      _$UnifediApiTagHistoryPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) List<PleromaApiTagHistoryItem> value});
}

/// @nodoc
class _$UnifediApiTagHistoryPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiTagHistoryPleromaAdapterCopyWith<$Res> {
  _$UnifediApiTagHistoryPleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiTagHistoryPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiTagHistoryPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiTagHistoryItem>,
    ));
  }
}

/// @nodoc
abstract class _$UnifediApiTagHistoryPleromaAdapterCopyWith<$Res>
    implements $UnifediApiTagHistoryPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiTagHistoryPleromaAdapterCopyWith(
          _UnifediApiTagHistoryPleromaAdapter value,
          $Res Function(_UnifediApiTagHistoryPleromaAdapter) then) =
      __$UnifediApiTagHistoryPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) List<PleromaApiTagHistoryItem> value});
}

/// @nodoc
class __$UnifediApiTagHistoryPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiTagHistoryPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiTagHistoryPleromaAdapterCopyWith<$Res> {
  __$UnifediApiTagHistoryPleromaAdapterCopyWithImpl(
      _UnifediApiTagHistoryPleromaAdapter _value,
      $Res Function(_UnifediApiTagHistoryPleromaAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiTagHistoryPleromaAdapter));

  @override
  _UnifediApiTagHistoryPleromaAdapter get _value =>
      super._value as _UnifediApiTagHistoryPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiTagHistoryPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiTagHistoryItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiTagHistoryPleromaAdapter
    extends _UnifediApiTagHistoryPleromaAdapter {
  const _$_UnifediApiTagHistoryPleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiTagHistoryPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiTagHistoryPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final List<PleromaApiTagHistoryItem> value;

  @override
  String toString() {
    return 'UnifediApiTagHistoryPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiTagHistoryPleromaAdapter &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$UnifediApiTagHistoryPleromaAdapterCopyWith<
          _UnifediApiTagHistoryPleromaAdapter>
      get copyWith => __$UnifediApiTagHistoryPleromaAdapterCopyWithImpl<
          _UnifediApiTagHistoryPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiTagHistoryPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiTagHistoryPleromaAdapter
    extends UnifediApiTagHistoryPleromaAdapter {
  const factory _UnifediApiTagHistoryPleromaAdapter(
          @HiveField(0) List<PleromaApiTagHistoryItem> value) =
      _$_UnifediApiTagHistoryPleromaAdapter;
  const _UnifediApiTagHistoryPleromaAdapter._() : super._();

  factory _UnifediApiTagHistoryPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiTagHistoryPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  List<PleromaApiTagHistoryItem> get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiTagHistoryPleromaAdapterCopyWith<
          _UnifediApiTagHistoryPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

UnifediApiTagHistoryItemPleromaAdapter
    _$UnifediApiTagHistoryItemPleromaAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiTagHistoryItemPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiTagHistoryItemPleromaAdapterTearOff {
  const _$UnifediApiTagHistoryItemPleromaAdapterTearOff();

  _UnifediApiTagHistoryItemPleromaAdapter call(
      @HiveField(0) PleromaApiTagHistoryItem value) {
    return _UnifediApiTagHistoryItemPleromaAdapter(
      value,
    );
  }

  UnifediApiTagHistoryItemPleromaAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiTagHistoryItemPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiTagHistoryItemPleromaAdapter =
    _$UnifediApiTagHistoryItemPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiTagHistoryItemPleromaAdapter {
  @HiveField(0)
  PleromaApiTagHistoryItem get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiTagHistoryItemPleromaAdapterCopyWith<
          UnifediApiTagHistoryItemPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiTagHistoryItemPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiTagHistoryItemPleromaAdapterCopyWith(
          UnifediApiTagHistoryItemPleromaAdapter value,
          $Res Function(UnifediApiTagHistoryItemPleromaAdapter) then) =
      _$UnifediApiTagHistoryItemPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiTagHistoryItem value});

  $PleromaApiTagHistoryItemCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiTagHistoryItemPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiTagHistoryItemPleromaAdapterCopyWith<$Res> {
  _$UnifediApiTagHistoryItemPleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiTagHistoryItemPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiTagHistoryItemPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiTagHistoryItem,
    ));
  }

  @override
  $PleromaApiTagHistoryItemCopyWith<$Res> get value {
    return $PleromaApiTagHistoryItemCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiTagHistoryItemPleromaAdapterCopyWith<$Res>
    implements $UnifediApiTagHistoryItemPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiTagHistoryItemPleromaAdapterCopyWith(
          _UnifediApiTagHistoryItemPleromaAdapter value,
          $Res Function(_UnifediApiTagHistoryItemPleromaAdapter) then) =
      __$UnifediApiTagHistoryItemPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiTagHistoryItem value});

  @override
  $PleromaApiTagHistoryItemCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiTagHistoryItemPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiTagHistoryItemPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiTagHistoryItemPleromaAdapterCopyWith<$Res> {
  __$UnifediApiTagHistoryItemPleromaAdapterCopyWithImpl(
      _UnifediApiTagHistoryItemPleromaAdapter _value,
      $Res Function(_UnifediApiTagHistoryItemPleromaAdapter) _then)
      : super(
            _value, (v) => _then(v as _UnifediApiTagHistoryItemPleromaAdapter));

  @override
  _UnifediApiTagHistoryItemPleromaAdapter get _value =>
      super._value as _UnifediApiTagHistoryItemPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiTagHistoryItemPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiTagHistoryItem,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiTagHistoryItemPleromaAdapter
    extends _UnifediApiTagHistoryItemPleromaAdapter {
  const _$_UnifediApiTagHistoryItemPleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiTagHistoryItemPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiTagHistoryItemPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiTagHistoryItem value;

  @override
  String toString() {
    return 'UnifediApiTagHistoryItemPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiTagHistoryItemPleromaAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiTagHistoryItemPleromaAdapterCopyWith<
          _UnifediApiTagHistoryItemPleromaAdapter>
      get copyWith => __$UnifediApiTagHistoryItemPleromaAdapterCopyWithImpl<
          _UnifediApiTagHistoryItemPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiTagHistoryItemPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiTagHistoryItemPleromaAdapter
    extends UnifediApiTagHistoryItemPleromaAdapter {
  const factory _UnifediApiTagHistoryItemPleromaAdapter(
          @HiveField(0) PleromaApiTagHistoryItem value) =
      _$_UnifediApiTagHistoryItemPleromaAdapter;
  const _UnifediApiTagHistoryItemPleromaAdapter._() : super._();

  factory _UnifediApiTagHistoryItemPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiTagHistoryItemPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiTagHistoryItem get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiTagHistoryItemPleromaAdapterCopyWith<
          _UnifediApiTagHistoryItemPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

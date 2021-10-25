// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_mention_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiMentionPleromaAdapter _$UnifediApiMentionPleromaAdapterFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiMentionPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiMentionPleromaAdapterTearOff {
  const _$UnifediApiMentionPleromaAdapterTearOff();

  _UnifediApiMentionPleromaAdapter call(@HiveField(0) PleromaApiMention value) {
    return _UnifediApiMentionPleromaAdapter(
      value,
    );
  }

  UnifediApiMentionPleromaAdapter fromJson(Map<String, Object> json) {
    return UnifediApiMentionPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiMentionPleromaAdapter =
    _$UnifediApiMentionPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiMentionPleromaAdapter {
  @HiveField(0)
  PleromaApiMention get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiMentionPleromaAdapterCopyWith<UnifediApiMentionPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiMentionPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiMentionPleromaAdapterCopyWith(
          UnifediApiMentionPleromaAdapter value,
          $Res Function(UnifediApiMentionPleromaAdapter) then) =
      _$UnifediApiMentionPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiMention value});

  $PleromaApiMentionCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiMentionPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiMentionPleromaAdapterCopyWith<$Res> {
  _$UnifediApiMentionPleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiMentionPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiMentionPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiMention,
    ));
  }

  @override
  $PleromaApiMentionCopyWith<$Res> get value {
    return $PleromaApiMentionCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiMentionPleromaAdapterCopyWith<$Res>
    implements $UnifediApiMentionPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiMentionPleromaAdapterCopyWith(
          _UnifediApiMentionPleromaAdapter value,
          $Res Function(_UnifediApiMentionPleromaAdapter) then) =
      __$UnifediApiMentionPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiMention value});

  @override
  $PleromaApiMentionCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiMentionPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiMentionPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiMentionPleromaAdapterCopyWith<$Res> {
  __$UnifediApiMentionPleromaAdapterCopyWithImpl(
      _UnifediApiMentionPleromaAdapter _value,
      $Res Function(_UnifediApiMentionPleromaAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiMentionPleromaAdapter));

  @override
  _UnifediApiMentionPleromaAdapter get _value =>
      super._value as _UnifediApiMentionPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiMentionPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiMention,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiMentionPleromaAdapter
    extends _UnifediApiMentionPleromaAdapter {
  const _$_UnifediApiMentionPleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiMentionPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiMentionPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiMention value;

  @override
  String toString() {
    return 'UnifediApiMentionPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiMentionPleromaAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiMentionPleromaAdapterCopyWith<_UnifediApiMentionPleromaAdapter>
      get copyWith => __$UnifediApiMentionPleromaAdapterCopyWithImpl<
          _UnifediApiMentionPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiMentionPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiMentionPleromaAdapter
    extends UnifediApiMentionPleromaAdapter {
  const factory _UnifediApiMentionPleromaAdapter(
          @HiveField(0) PleromaApiMention value) =
      _$_UnifediApiMentionPleromaAdapter;
  const _UnifediApiMentionPleromaAdapter._() : super._();

  factory _UnifediApiMentionPleromaAdapter.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiMentionPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiMention get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiMentionPleromaAdapterCopyWith<_UnifediApiMentionPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

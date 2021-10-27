// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_tag_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiTag _$PleromaApiTagFromJson(Map<String, dynamic> json) {
  return _PleromaApiTag.fromJson(json);
}

/// @nodoc
class _$PleromaApiTagTearOff {
  const _$PleromaApiTagTearOff();

  _PleromaApiTag call(
      {@HiveField(0) required String name,
      @HiveField(1) required String url,
      @HiveField(2) required List<PleromaApiTagHistoryItem>? history}) {
    return _PleromaApiTag(
      name: name,
      url: url,
      history: history,
    );
  }

  PleromaApiTag fromJson(Map<String, Object?> json) {
    return PleromaApiTag.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiTag = _$PleromaApiTagTearOff();

/// @nodoc
mixin _$PleromaApiTag {
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;
  @HiveField(1)
  String get url => throw _privateConstructorUsedError;
  @HiveField(2)
  List<PleromaApiTagHistoryItem>? get history =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiTagCopyWith<PleromaApiTag> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiTagCopyWith<$Res> {
  factory $PleromaApiTagCopyWith(
          PleromaApiTag value, $Res Function(PleromaApiTag) then) =
      _$PleromaApiTagCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) String url,
      @HiveField(2) List<PleromaApiTagHistoryItem>? history});
}

/// @nodoc
class _$PleromaApiTagCopyWithImpl<$Res>
    implements $PleromaApiTagCopyWith<$Res> {
  _$PleromaApiTagCopyWithImpl(this._value, this._then);

  final PleromaApiTag _value;
  // ignore: unused_field
  final $Res Function(PleromaApiTag) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
    Object? history = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      history: history == freezed
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiTagHistoryItem>?,
    ));
  }
}

/// @nodoc
abstract class _$PleromaApiTagCopyWith<$Res>
    implements $PleromaApiTagCopyWith<$Res> {
  factory _$PleromaApiTagCopyWith(
          _PleromaApiTag value, $Res Function(_PleromaApiTag) then) =
      __$PleromaApiTagCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) String url,
      @HiveField(2) List<PleromaApiTagHistoryItem>? history});
}

/// @nodoc
class __$PleromaApiTagCopyWithImpl<$Res>
    extends _$PleromaApiTagCopyWithImpl<$Res>
    implements _$PleromaApiTagCopyWith<$Res> {
  __$PleromaApiTagCopyWithImpl(
      _PleromaApiTag _value, $Res Function(_PleromaApiTag) _then)
      : super(_value, (v) => _then(v as _PleromaApiTag));

  @override
  _PleromaApiTag get _value => super._value as _PleromaApiTag;

  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
    Object? history = freezed,
  }) {
    return _then(_PleromaApiTag(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      history: history == freezed
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiTagHistoryItem>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiTag implements _PleromaApiTag {
  const _$_PleromaApiTag(
      {@HiveField(0) required this.name,
      @HiveField(1) required this.url,
      @HiveField(2) required this.history});

  factory _$_PleromaApiTag.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiTagFromJson(json);

  @override
  @HiveField(0)
  final String name;
  @override
  @HiveField(1)
  final String url;
  @override
  @HiveField(2)
  final List<PleromaApiTagHistoryItem>? history;

  @override
  String toString() {
    return 'PleromaApiTag(name: $name, url: $url, history: $history)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PleromaApiTag &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url) &&
            const DeepCollectionEquality().equals(other.history, history));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, url, const DeepCollectionEquality().hash(history));

  @JsonKey(ignore: true)
  @override
  _$PleromaApiTagCopyWith<_PleromaApiTag> get copyWith =>
      __$PleromaApiTagCopyWithImpl<_PleromaApiTag>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiTagToJson(this);
  }
}

abstract class _PleromaApiTag implements PleromaApiTag {
  const factory _PleromaApiTag(
          {@HiveField(0) required String name,
          @HiveField(1) required String url,
          @HiveField(2) required List<PleromaApiTagHistoryItem>? history}) =
      _$_PleromaApiTag;

  factory _PleromaApiTag.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiTag.fromJson;

  @override
  @HiveField(0)
  String get name;
  @override
  @HiveField(1)
  String get url;
  @override
  @HiveField(2)
  List<PleromaApiTagHistoryItem>? get history;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiTagCopyWith<_PleromaApiTag> get copyWith =>
      throw _privateConstructorUsedError;
}

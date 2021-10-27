// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_instance_activity_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiInstanceActivity _$UnifediApiInstanceActivityFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiInstanceActivity.fromJson(json);
}

/// @nodoc
class _$UnifediApiInstanceActivityTearOff {
  const _$UnifediApiInstanceActivityTearOff();

  _UnifediApiInstanceActivity call(
      {@HiveField(0) required List<UnifediApiInstanceActivityItem> items}) {
    return _UnifediApiInstanceActivity(
      items: items,
    );
  }

  UnifediApiInstanceActivity fromJson(Map<String, Object?> json) {
    return UnifediApiInstanceActivity.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiInstanceActivity = _$UnifediApiInstanceActivityTearOff();

/// @nodoc
mixin _$UnifediApiInstanceActivity {
  @HiveField(0)
  List<UnifediApiInstanceActivityItem> get items =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiInstanceActivityCopyWith<UnifediApiInstanceActivity>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiInstanceActivityCopyWith<$Res> {
  factory $UnifediApiInstanceActivityCopyWith(UnifediApiInstanceActivity value,
          $Res Function(UnifediApiInstanceActivity) then) =
      _$UnifediApiInstanceActivityCopyWithImpl<$Res>;
  $Res call({@HiveField(0) List<UnifediApiInstanceActivityItem> items});
}

/// @nodoc
class _$UnifediApiInstanceActivityCopyWithImpl<$Res>
    implements $UnifediApiInstanceActivityCopyWith<$Res> {
  _$UnifediApiInstanceActivityCopyWithImpl(this._value, this._then);

  final UnifediApiInstanceActivity _value;
  // ignore: unused_field
  final $Res Function(UnifediApiInstanceActivity) _then;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiInstanceActivityItem>,
    ));
  }
}

/// @nodoc
abstract class _$UnifediApiInstanceActivityCopyWith<$Res>
    implements $UnifediApiInstanceActivityCopyWith<$Res> {
  factory _$UnifediApiInstanceActivityCopyWith(
          _UnifediApiInstanceActivity value,
          $Res Function(_UnifediApiInstanceActivity) then) =
      __$UnifediApiInstanceActivityCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) List<UnifediApiInstanceActivityItem> items});
}

/// @nodoc
class __$UnifediApiInstanceActivityCopyWithImpl<$Res>
    extends _$UnifediApiInstanceActivityCopyWithImpl<$Res>
    implements _$UnifediApiInstanceActivityCopyWith<$Res> {
  __$UnifediApiInstanceActivityCopyWithImpl(_UnifediApiInstanceActivity _value,
      $Res Function(_UnifediApiInstanceActivity) _then)
      : super(_value, (v) => _then(v as _UnifediApiInstanceActivity));

  @override
  _UnifediApiInstanceActivity get _value =>
      super._value as _UnifediApiInstanceActivity;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_UnifediApiInstanceActivity(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiInstanceActivityItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiInstanceActivity implements _UnifediApiInstanceActivity {
  const _$_UnifediApiInstanceActivity({@HiveField(0) required this.items});

  factory _$_UnifediApiInstanceActivity.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiInstanceActivityFromJson(json);

  @override
  @HiveField(0)
  final List<UnifediApiInstanceActivityItem> items;

  @override
  String toString() {
    return 'UnifediApiInstanceActivity(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiInstanceActivity &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(items));

  @JsonKey(ignore: true)
  @override
  _$UnifediApiInstanceActivityCopyWith<_UnifediApiInstanceActivity>
      get copyWith => __$UnifediApiInstanceActivityCopyWithImpl<
          _UnifediApiInstanceActivity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiInstanceActivityToJson(this);
  }
}

abstract class _UnifediApiInstanceActivity
    implements UnifediApiInstanceActivity {
  const factory _UnifediApiInstanceActivity(
          {@HiveField(0) required List<UnifediApiInstanceActivityItem> items}) =
      _$_UnifediApiInstanceActivity;

  factory _UnifediApiInstanceActivity.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiInstanceActivity.fromJson;

  @override
  @HiveField(0)
  List<UnifediApiInstanceActivityItem> get items;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiInstanceActivityCopyWith<_UnifediApiInstanceActivity>
      get copyWith => throw _privateConstructorUsedError;
}

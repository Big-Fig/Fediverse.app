// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'hashtag_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HashtagTearOff {
  const _$HashtagTearOff();

  _Hashtag call(
      {@override required String name,
      @override required IUnifediApiTagHistory? history,
      @override required String? url}) {
    return _Hashtag(
      name: name,
      history: history,
      url: url,
    );
  }
}

/// @nodoc
const $Hashtag = _$HashtagTearOff();

/// @nodoc
mixin _$Hashtag {
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  IUnifediApiTagHistory? get history => throw _privateConstructorUsedError;
  @override
  String? get url => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HashtagCopyWith<Hashtag> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HashtagCopyWith<$Res> {
  factory $HashtagCopyWith(Hashtag value, $Res Function(Hashtag) then) =
      _$HashtagCopyWithImpl<$Res>;
  $Res call(
      {@override String name,
      @override IUnifediApiTagHistory? history,
      @override String? url});
}

/// @nodoc
class _$HashtagCopyWithImpl<$Res> implements $HashtagCopyWith<$Res> {
  _$HashtagCopyWithImpl(this._value, this._then);

  final Hashtag _value;
  // ignore: unused_field
  final $Res Function(Hashtag) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? history = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      history: history == freezed
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as IUnifediApiTagHistory?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$HashtagCopyWith<$Res> implements $HashtagCopyWith<$Res> {
  factory _$HashtagCopyWith(_Hashtag value, $Res Function(_Hashtag) then) =
      __$HashtagCopyWithImpl<$Res>;
  @override
  $Res call(
      {@override String name,
      @override IUnifediApiTagHistory? history,
      @override String? url});
}

/// @nodoc
class __$HashtagCopyWithImpl<$Res> extends _$HashtagCopyWithImpl<$Res>
    implements _$HashtagCopyWith<$Res> {
  __$HashtagCopyWithImpl(_Hashtag _value, $Res Function(_Hashtag) _then)
      : super(_value, (v) => _then(v as _Hashtag));

  @override
  _Hashtag get _value => super._value as _Hashtag;

  @override
  $Res call({
    Object? name = freezed,
    Object? history = freezed,
    Object? url = freezed,
  }) {
    return _then(_Hashtag(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      history: history == freezed
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as IUnifediApiTagHistory?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Hashtag extends _Hashtag {
  const _$_Hashtag(
      {@override required this.name,
      @override required this.history,
      @override required this.url})
      : super._();

  @override
  @override
  final String name;
  @override
  @override
  final IUnifediApiTagHistory? history;
  @override
  @override
  final String? url;

  @override
  String toString() {
    return 'Hashtag(name: $name, history: $history, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Hashtag &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.history, history) ||
                const DeepCollectionEquality()
                    .equals(other.history, history)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(history) ^
      const DeepCollectionEquality().hash(url);

  @JsonKey(ignore: true)
  @override
  _$HashtagCopyWith<_Hashtag> get copyWith =>
      __$HashtagCopyWithImpl<_Hashtag>(this, _$identity);
}

abstract class _Hashtag extends Hashtag {
  const factory _Hashtag(
      {@override required String name,
      @override required IUnifediApiTagHistory? history,
      @override required String? url}) = _$_Hashtag;
  const _Hashtag._() : super._();

  @override
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  @override
  IUnifediApiTagHistory? get history => throw _privateConstructorUsedError;
  @override
  @override
  String? get url => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$HashtagCopyWith<_Hashtag> get copyWith =>
      throw _privateConstructorUsedError;
}

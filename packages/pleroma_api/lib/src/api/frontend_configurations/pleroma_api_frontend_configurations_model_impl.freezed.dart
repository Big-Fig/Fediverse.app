// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_frontend_configurations_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiFrontendConfigurations _$PleromaApiFrontendConfigurationsFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiFrontendConfigurations.fromJson(json);
}

/// @nodoc
class _$PleromaApiFrontendConfigurationsTearOff {
  const _$PleromaApiFrontendConfigurationsTearOff();

  _PleromaApiFrontendConfigurations call(
      {@JsonKey(name: 'masto_fe')
      @HiveField(0)
          required PleromaApiFrontendConfigurationsMastoFe? mastoFe,
      @JsonKey(name: 'pleroma_fe')
      @HiveField(1)
          required PleromaApiFrontendConfigurationsPleromaFe? pleromaFe,
      @JsonKey(name: 'soapbox_fe')
      @HiveField(2)
          required PleromaApiFrontendConfigurationsSoapboxFe? soapboxFe}) {
    return _PleromaApiFrontendConfigurations(
      mastoFe: mastoFe,
      pleromaFe: pleromaFe,
      soapboxFe: soapboxFe,
    );
  }

  PleromaApiFrontendConfigurations fromJson(Map<String, Object> json) {
    return PleromaApiFrontendConfigurations.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiFrontendConfigurations =
    _$PleromaApiFrontendConfigurationsTearOff();

/// @nodoc
mixin _$PleromaApiFrontendConfigurations {
  @JsonKey(name: 'masto_fe')
  @HiveField(0)
  PleromaApiFrontendConfigurationsMastoFe? get mastoFe =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'pleroma_fe')
  @HiveField(1)
  PleromaApiFrontendConfigurationsPleromaFe? get pleromaFe =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'soapbox_fe')
  @HiveField(2)
  PleromaApiFrontendConfigurationsSoapboxFe? get soapboxFe =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiFrontendConfigurationsCopyWith<PleromaApiFrontendConfigurations>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiFrontendConfigurationsCopyWith<$Res> {
  factory $PleromaApiFrontendConfigurationsCopyWith(
          PleromaApiFrontendConfigurations value,
          $Res Function(PleromaApiFrontendConfigurations) then) =
      _$PleromaApiFrontendConfigurationsCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'masto_fe')
      @HiveField(0)
          PleromaApiFrontendConfigurationsMastoFe? mastoFe,
      @JsonKey(name: 'pleroma_fe')
      @HiveField(1)
          PleromaApiFrontendConfigurationsPleromaFe? pleromaFe,
      @JsonKey(name: 'soapbox_fe')
      @HiveField(2)
          PleromaApiFrontendConfigurationsSoapboxFe? soapboxFe});

  $PleromaApiFrontendConfigurationsMastoFeCopyWith<$Res>? get mastoFe;
  $PleromaApiFrontendConfigurationsPleromaFeCopyWith<$Res>? get pleromaFe;
  $PleromaApiFrontendConfigurationsSoapboxFeCopyWith<$Res>? get soapboxFe;
}

/// @nodoc
class _$PleromaApiFrontendConfigurationsCopyWithImpl<$Res>
    implements $PleromaApiFrontendConfigurationsCopyWith<$Res> {
  _$PleromaApiFrontendConfigurationsCopyWithImpl(this._value, this._then);

  final PleromaApiFrontendConfigurations _value;
  // ignore: unused_field
  final $Res Function(PleromaApiFrontendConfigurations) _then;

  @override
  $Res call({
    Object? mastoFe = freezed,
    Object? pleromaFe = freezed,
    Object? soapboxFe = freezed,
  }) {
    return _then(_value.copyWith(
      mastoFe: mastoFe == freezed
          ? _value.mastoFe
          : mastoFe // ignore: cast_nullable_to_non_nullable
              as PleromaApiFrontendConfigurationsMastoFe?,
      pleromaFe: pleromaFe == freezed
          ? _value.pleromaFe
          : pleromaFe // ignore: cast_nullable_to_non_nullable
              as PleromaApiFrontendConfigurationsPleromaFe?,
      soapboxFe: soapboxFe == freezed
          ? _value.soapboxFe
          : soapboxFe // ignore: cast_nullable_to_non_nullable
              as PleromaApiFrontendConfigurationsSoapboxFe?,
    ));
  }

  @override
  $PleromaApiFrontendConfigurationsMastoFeCopyWith<$Res>? get mastoFe {
    if (_value.mastoFe == null) {
      return null;
    }

    return $PleromaApiFrontendConfigurationsMastoFeCopyWith<$Res>(
        _value.mastoFe!, (value) {
      return _then(_value.copyWith(mastoFe: value));
    });
  }

  @override
  $PleromaApiFrontendConfigurationsPleromaFeCopyWith<$Res>? get pleromaFe {
    if (_value.pleromaFe == null) {
      return null;
    }

    return $PleromaApiFrontendConfigurationsPleromaFeCopyWith<$Res>(
        _value.pleromaFe!, (value) {
      return _then(_value.copyWith(pleromaFe: value));
    });
  }

  @override
  $PleromaApiFrontendConfigurationsSoapboxFeCopyWith<$Res>? get soapboxFe {
    if (_value.soapboxFe == null) {
      return null;
    }

    return $PleromaApiFrontendConfigurationsSoapboxFeCopyWith<$Res>(
        _value.soapboxFe!, (value) {
      return _then(_value.copyWith(soapboxFe: value));
    });
  }
}

/// @nodoc
abstract class _$PleromaApiFrontendConfigurationsCopyWith<$Res>
    implements $PleromaApiFrontendConfigurationsCopyWith<$Res> {
  factory _$PleromaApiFrontendConfigurationsCopyWith(
          _PleromaApiFrontendConfigurations value,
          $Res Function(_PleromaApiFrontendConfigurations) then) =
      __$PleromaApiFrontendConfigurationsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'masto_fe')
      @HiveField(0)
          PleromaApiFrontendConfigurationsMastoFe? mastoFe,
      @JsonKey(name: 'pleroma_fe')
      @HiveField(1)
          PleromaApiFrontendConfigurationsPleromaFe? pleromaFe,
      @JsonKey(name: 'soapbox_fe')
      @HiveField(2)
          PleromaApiFrontendConfigurationsSoapboxFe? soapboxFe});

  @override
  $PleromaApiFrontendConfigurationsMastoFeCopyWith<$Res>? get mastoFe;
  @override
  $PleromaApiFrontendConfigurationsPleromaFeCopyWith<$Res>? get pleromaFe;
  @override
  $PleromaApiFrontendConfigurationsSoapboxFeCopyWith<$Res>? get soapboxFe;
}

/// @nodoc
class __$PleromaApiFrontendConfigurationsCopyWithImpl<$Res>
    extends _$PleromaApiFrontendConfigurationsCopyWithImpl<$Res>
    implements _$PleromaApiFrontendConfigurationsCopyWith<$Res> {
  __$PleromaApiFrontendConfigurationsCopyWithImpl(
      _PleromaApiFrontendConfigurations _value,
      $Res Function(_PleromaApiFrontendConfigurations) _then)
      : super(_value, (v) => _then(v as _PleromaApiFrontendConfigurations));

  @override
  _PleromaApiFrontendConfigurations get _value =>
      super._value as _PleromaApiFrontendConfigurations;

  @override
  $Res call({
    Object? mastoFe = freezed,
    Object? pleromaFe = freezed,
    Object? soapboxFe = freezed,
  }) {
    return _then(_PleromaApiFrontendConfigurations(
      mastoFe: mastoFe == freezed
          ? _value.mastoFe
          : mastoFe // ignore: cast_nullable_to_non_nullable
              as PleromaApiFrontendConfigurationsMastoFe?,
      pleromaFe: pleromaFe == freezed
          ? _value.pleromaFe
          : pleromaFe // ignore: cast_nullable_to_non_nullable
              as PleromaApiFrontendConfigurationsPleromaFe?,
      soapboxFe: soapboxFe == freezed
          ? _value.soapboxFe
          : soapboxFe // ignore: cast_nullable_to_non_nullable
              as PleromaApiFrontendConfigurationsSoapboxFe?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiFrontendConfigurations
    implements _PleromaApiFrontendConfigurations {
  const _$_PleromaApiFrontendConfigurations(
      {@JsonKey(name: 'masto_fe') @HiveField(0) required this.mastoFe,
      @JsonKey(name: 'pleroma_fe') @HiveField(1) required this.pleromaFe,
      @JsonKey(name: 'soapbox_fe') @HiveField(2) required this.soapboxFe});

  factory _$_PleromaApiFrontendConfigurations.fromJson(
          Map<String, dynamic> json) =>
      _$$_PleromaApiFrontendConfigurationsFromJson(json);

  @override
  @JsonKey(name: 'masto_fe')
  @HiveField(0)
  final PleromaApiFrontendConfigurationsMastoFe? mastoFe;
  @override
  @JsonKey(name: 'pleroma_fe')
  @HiveField(1)
  final PleromaApiFrontendConfigurationsPleromaFe? pleromaFe;
  @override
  @JsonKey(name: 'soapbox_fe')
  @HiveField(2)
  final PleromaApiFrontendConfigurationsSoapboxFe? soapboxFe;

  @override
  String toString() {
    return 'PleromaApiFrontendConfigurations(mastoFe: $mastoFe, pleromaFe: $pleromaFe, soapboxFe: $soapboxFe)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiFrontendConfigurations &&
            (identical(other.mastoFe, mastoFe) ||
                const DeepCollectionEquality()
                    .equals(other.mastoFe, mastoFe)) &&
            (identical(other.pleromaFe, pleromaFe) ||
                const DeepCollectionEquality()
                    .equals(other.pleromaFe, pleromaFe)) &&
            (identical(other.soapboxFe, soapboxFe) ||
                const DeepCollectionEquality()
                    .equals(other.soapboxFe, soapboxFe)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(mastoFe) ^
      const DeepCollectionEquality().hash(pleromaFe) ^
      const DeepCollectionEquality().hash(soapboxFe);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiFrontendConfigurationsCopyWith<_PleromaApiFrontendConfigurations>
      get copyWith => __$PleromaApiFrontendConfigurationsCopyWithImpl<
          _PleromaApiFrontendConfigurations>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiFrontendConfigurationsToJson(this);
  }
}

abstract class _PleromaApiFrontendConfigurations
    implements PleromaApiFrontendConfigurations {
  const factory _PleromaApiFrontendConfigurations(
          {@JsonKey(name: 'masto_fe')
          @HiveField(0)
              required PleromaApiFrontendConfigurationsMastoFe? mastoFe,
          @JsonKey(name: 'pleroma_fe')
          @HiveField(1)
              required PleromaApiFrontendConfigurationsPleromaFe? pleromaFe,
          @JsonKey(name: 'soapbox_fe')
          @HiveField(2)
              required PleromaApiFrontendConfigurationsSoapboxFe? soapboxFe}) =
      _$_PleromaApiFrontendConfigurations;

  factory _PleromaApiFrontendConfigurations.fromJson(
      Map<String, dynamic> json) = _$_PleromaApiFrontendConfigurations.fromJson;

  @override
  @JsonKey(name: 'masto_fe')
  @HiveField(0)
  PleromaApiFrontendConfigurationsMastoFe? get mastoFe =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'pleroma_fe')
  @HiveField(1)
  PleromaApiFrontendConfigurationsPleromaFe? get pleromaFe =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'soapbox_fe')
  @HiveField(2)
  PleromaApiFrontendConfigurationsSoapboxFe? get soapboxFe =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiFrontendConfigurationsCopyWith<_PleromaApiFrontendConfigurations>
      get copyWith => throw _privateConstructorUsedError;
}

PleromaApiFrontendConfigurationsMastoFe
    _$PleromaApiFrontendConfigurationsMastoFeFromJson(
        Map<String, dynamic> json) {
  return _PleromaApiFrontendConfigurationsMastoFe.fromJson(json);
}

/// @nodoc
class _$PleromaApiFrontendConfigurationsMastoFeTearOff {
  const _$PleromaApiFrontendConfigurationsMastoFeTearOff();

  _PleromaApiFrontendConfigurationsMastoFe call(
      {@HiveField(0) required bool? showInstanceSpecificPanel}) {
    return _PleromaApiFrontendConfigurationsMastoFe(
      showInstanceSpecificPanel: showInstanceSpecificPanel,
    );
  }

  PleromaApiFrontendConfigurationsMastoFe fromJson(Map<String, Object> json) {
    return PleromaApiFrontendConfigurationsMastoFe.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiFrontendConfigurationsMastoFe =
    _$PleromaApiFrontendConfigurationsMastoFeTearOff();

/// @nodoc
mixin _$PleromaApiFrontendConfigurationsMastoFe {
  @HiveField(0)
  bool? get showInstanceSpecificPanel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiFrontendConfigurationsMastoFeCopyWith<
          PleromaApiFrontendConfigurationsMastoFe>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiFrontendConfigurationsMastoFeCopyWith<$Res> {
  factory $PleromaApiFrontendConfigurationsMastoFeCopyWith(
          PleromaApiFrontendConfigurationsMastoFe value,
          $Res Function(PleromaApiFrontendConfigurationsMastoFe) then) =
      _$PleromaApiFrontendConfigurationsMastoFeCopyWithImpl<$Res>;
  $Res call({@HiveField(0) bool? showInstanceSpecificPanel});
}

/// @nodoc
class _$PleromaApiFrontendConfigurationsMastoFeCopyWithImpl<$Res>
    implements $PleromaApiFrontendConfigurationsMastoFeCopyWith<$Res> {
  _$PleromaApiFrontendConfigurationsMastoFeCopyWithImpl(
      this._value, this._then);

  final PleromaApiFrontendConfigurationsMastoFe _value;
  // ignore: unused_field
  final $Res Function(PleromaApiFrontendConfigurationsMastoFe) _then;

  @override
  $Res call({
    Object? showInstanceSpecificPanel = freezed,
  }) {
    return _then(_value.copyWith(
      showInstanceSpecificPanel: showInstanceSpecificPanel == freezed
          ? _value.showInstanceSpecificPanel
          : showInstanceSpecificPanel // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$PleromaApiFrontendConfigurationsMastoFeCopyWith<$Res>
    implements $PleromaApiFrontendConfigurationsMastoFeCopyWith<$Res> {
  factory _$PleromaApiFrontendConfigurationsMastoFeCopyWith(
          _PleromaApiFrontendConfigurationsMastoFe value,
          $Res Function(_PleromaApiFrontendConfigurationsMastoFe) then) =
      __$PleromaApiFrontendConfigurationsMastoFeCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) bool? showInstanceSpecificPanel});
}

/// @nodoc
class __$PleromaApiFrontendConfigurationsMastoFeCopyWithImpl<$Res>
    extends _$PleromaApiFrontendConfigurationsMastoFeCopyWithImpl<$Res>
    implements _$PleromaApiFrontendConfigurationsMastoFeCopyWith<$Res> {
  __$PleromaApiFrontendConfigurationsMastoFeCopyWithImpl(
      _PleromaApiFrontendConfigurationsMastoFe _value,
      $Res Function(_PleromaApiFrontendConfigurationsMastoFe) _then)
      : super(_value,
            (v) => _then(v as _PleromaApiFrontendConfigurationsMastoFe));

  @override
  _PleromaApiFrontendConfigurationsMastoFe get _value =>
      super._value as _PleromaApiFrontendConfigurationsMastoFe;

  @override
  $Res call({
    Object? showInstanceSpecificPanel = freezed,
  }) {
    return _then(_PleromaApiFrontendConfigurationsMastoFe(
      showInstanceSpecificPanel: showInstanceSpecificPanel == freezed
          ? _value.showInstanceSpecificPanel
          : showInstanceSpecificPanel // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiFrontendConfigurationsMastoFe
    implements _PleromaApiFrontendConfigurationsMastoFe {
  const _$_PleromaApiFrontendConfigurationsMastoFe(
      {@HiveField(0) required this.showInstanceSpecificPanel});

  factory _$_PleromaApiFrontendConfigurationsMastoFe.fromJson(
          Map<String, dynamic> json) =>
      _$$_PleromaApiFrontendConfigurationsMastoFeFromJson(json);

  @override
  @HiveField(0)
  final bool? showInstanceSpecificPanel;

  @override
  String toString() {
    return 'PleromaApiFrontendConfigurationsMastoFe(showInstanceSpecificPanel: $showInstanceSpecificPanel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiFrontendConfigurationsMastoFe &&
            (identical(other.showInstanceSpecificPanel,
                    showInstanceSpecificPanel) ||
                const DeepCollectionEquality().equals(
                    other.showInstanceSpecificPanel,
                    showInstanceSpecificPanel)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(showInstanceSpecificPanel);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiFrontendConfigurationsMastoFeCopyWith<
          _PleromaApiFrontendConfigurationsMastoFe>
      get copyWith => __$PleromaApiFrontendConfigurationsMastoFeCopyWithImpl<
          _PleromaApiFrontendConfigurationsMastoFe>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiFrontendConfigurationsMastoFeToJson(this);
  }
}

abstract class _PleromaApiFrontendConfigurationsMastoFe
    implements PleromaApiFrontendConfigurationsMastoFe {
  const factory _PleromaApiFrontendConfigurationsMastoFe(
          {@HiveField(0) required bool? showInstanceSpecificPanel}) =
      _$_PleromaApiFrontendConfigurationsMastoFe;

  factory _PleromaApiFrontendConfigurationsMastoFe.fromJson(
          Map<String, dynamic> json) =
      _$_PleromaApiFrontendConfigurationsMastoFe.fromJson;

  @override
  @HiveField(0)
  bool? get showInstanceSpecificPanel => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiFrontendConfigurationsMastoFeCopyWith<
          _PleromaApiFrontendConfigurationsMastoFe>
      get copyWith => throw _privateConstructorUsedError;
}

PleromaApiFrontendConfigurationsPleromaFe
    _$PleromaApiFrontendConfigurationsPleromaFeFromJson(
        Map<String, dynamic> json) {
  return _PleromaApiFrontendConfigurationsPleromaFe.fromJson(json);
}

/// @nodoc
class _$PleromaApiFrontendConfigurationsPleromaFeTearOff {
  const _$PleromaApiFrontendConfigurationsPleromaFeTearOff();

  _PleromaApiFrontendConfigurationsPleromaFe call(
      {@HiveField(0) required bool? alwaysShowSubjectInput,
      @HiveField(1) required String? background,
      @HiveField(2) required bool? collapseMessageWithSubject,
      @HiveField(3) required bool? disableChat,
      @HiveField(4) required bool? greentext,
      @HiveField(5) required bool? hideFilteredStatuses,
      @HiveField(6) required bool? hideMutedPosts,
      @HiveField(7) required bool? hidePostStats,
      @HiveField(8) required bool? hideUserStats,
      @HiveField(9) required String? loginMethod,
      @HiveField(10) required String? logo,
      @HiveField(11) required String? logoMargin,
      @HiveField(12) required bool? logoMask,
      @HiveField(13) required bool? minimalScopesMode,
      @HiveField(14) required bool? noAttachmentLinks,
      @HiveField(15) required String? nsfwCensorImage,
      @HiveField(16) required String? postContentType,
      @HiveField(17) required String? redirectRootLogin,
      @HiveField(18) required String? redirectRootNoLogin,
      @HiveField(19) required bool? scopeCopy,
      @HiveField(20) required bool? showFeaturesPanel,
      @HiveField(21) required bool? showInstanceSpecificPanel,
      @HiveField(22) required bool? sidebarRight,
      @HiveField(23) required String? subjectLineBehavior,
      @HiveField(24) required String? theme,
      @HiveField(25) required bool? webPushNotifications}) {
    return _PleromaApiFrontendConfigurationsPleromaFe(
      alwaysShowSubjectInput: alwaysShowSubjectInput,
      background: background,
      collapseMessageWithSubject: collapseMessageWithSubject,
      disableChat: disableChat,
      greentext: greentext,
      hideFilteredStatuses: hideFilteredStatuses,
      hideMutedPosts: hideMutedPosts,
      hidePostStats: hidePostStats,
      hideUserStats: hideUserStats,
      loginMethod: loginMethod,
      logo: logo,
      logoMargin: logoMargin,
      logoMask: logoMask,
      minimalScopesMode: minimalScopesMode,
      noAttachmentLinks: noAttachmentLinks,
      nsfwCensorImage: nsfwCensorImage,
      postContentType: postContentType,
      redirectRootLogin: redirectRootLogin,
      redirectRootNoLogin: redirectRootNoLogin,
      scopeCopy: scopeCopy,
      showFeaturesPanel: showFeaturesPanel,
      showInstanceSpecificPanel: showInstanceSpecificPanel,
      sidebarRight: sidebarRight,
      subjectLineBehavior: subjectLineBehavior,
      theme: theme,
      webPushNotifications: webPushNotifications,
    );
  }

  PleromaApiFrontendConfigurationsPleromaFe fromJson(Map<String, Object> json) {
    return PleromaApiFrontendConfigurationsPleromaFe.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiFrontendConfigurationsPleromaFe =
    _$PleromaApiFrontendConfigurationsPleromaFeTearOff();

/// @nodoc
mixin _$PleromaApiFrontendConfigurationsPleromaFe {
  @HiveField(0)
  bool? get alwaysShowSubjectInput => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get background => throw _privateConstructorUsedError;
  @HiveField(2)
  bool? get collapseMessageWithSubject => throw _privateConstructorUsedError;
  @HiveField(3)
  bool? get disableChat => throw _privateConstructorUsedError;
  @HiveField(4)
  bool? get greentext => throw _privateConstructorUsedError;
  @HiveField(5)
  bool? get hideFilteredStatuses => throw _privateConstructorUsedError;
  @HiveField(6)
  bool? get hideMutedPosts => throw _privateConstructorUsedError;
  @HiveField(7)
  bool? get hidePostStats => throw _privateConstructorUsedError;
  @HiveField(8)
  bool? get hideUserStats => throw _privateConstructorUsedError;
  @HiveField(9)
  String? get loginMethod => throw _privateConstructorUsedError;
  @HiveField(10)
  String? get logo => throw _privateConstructorUsedError;
  @HiveField(11)
  String? get logoMargin => throw _privateConstructorUsedError;
  @HiveField(12)
  bool? get logoMask => throw _privateConstructorUsedError;
  @HiveField(13)
  bool? get minimalScopesMode => throw _privateConstructorUsedError;
  @HiveField(14)
  bool? get noAttachmentLinks => throw _privateConstructorUsedError;
  @HiveField(15)
  String? get nsfwCensorImage => throw _privateConstructorUsedError;
  @HiveField(16)
  String? get postContentType => throw _privateConstructorUsedError;
  @HiveField(17)
  String? get redirectRootLogin => throw _privateConstructorUsedError;
  @HiveField(18)
  String? get redirectRootNoLogin => throw _privateConstructorUsedError;
  @HiveField(19)
  bool? get scopeCopy => throw _privateConstructorUsedError;
  @HiveField(20)
  bool? get showFeaturesPanel => throw _privateConstructorUsedError;
  @HiveField(21)
  bool? get showInstanceSpecificPanel => throw _privateConstructorUsedError;
  @HiveField(22)
  bool? get sidebarRight => throw _privateConstructorUsedError;
  @HiveField(23)
  String? get subjectLineBehavior => throw _privateConstructorUsedError;
  @HiveField(24)
  String? get theme => throw _privateConstructorUsedError;
  @HiveField(25)
  bool? get webPushNotifications => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiFrontendConfigurationsPleromaFeCopyWith<
          PleromaApiFrontendConfigurationsPleromaFe>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiFrontendConfigurationsPleromaFeCopyWith<$Res> {
  factory $PleromaApiFrontendConfigurationsPleromaFeCopyWith(
          PleromaApiFrontendConfigurationsPleromaFe value,
          $Res Function(PleromaApiFrontendConfigurationsPleromaFe) then) =
      _$PleromaApiFrontendConfigurationsPleromaFeCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) bool? alwaysShowSubjectInput,
      @HiveField(1) String? background,
      @HiveField(2) bool? collapseMessageWithSubject,
      @HiveField(3) bool? disableChat,
      @HiveField(4) bool? greentext,
      @HiveField(5) bool? hideFilteredStatuses,
      @HiveField(6) bool? hideMutedPosts,
      @HiveField(7) bool? hidePostStats,
      @HiveField(8) bool? hideUserStats,
      @HiveField(9) String? loginMethod,
      @HiveField(10) String? logo,
      @HiveField(11) String? logoMargin,
      @HiveField(12) bool? logoMask,
      @HiveField(13) bool? minimalScopesMode,
      @HiveField(14) bool? noAttachmentLinks,
      @HiveField(15) String? nsfwCensorImage,
      @HiveField(16) String? postContentType,
      @HiveField(17) String? redirectRootLogin,
      @HiveField(18) String? redirectRootNoLogin,
      @HiveField(19) bool? scopeCopy,
      @HiveField(20) bool? showFeaturesPanel,
      @HiveField(21) bool? showInstanceSpecificPanel,
      @HiveField(22) bool? sidebarRight,
      @HiveField(23) String? subjectLineBehavior,
      @HiveField(24) String? theme,
      @HiveField(25) bool? webPushNotifications});
}

/// @nodoc
class _$PleromaApiFrontendConfigurationsPleromaFeCopyWithImpl<$Res>
    implements $PleromaApiFrontendConfigurationsPleromaFeCopyWith<$Res> {
  _$PleromaApiFrontendConfigurationsPleromaFeCopyWithImpl(
      this._value, this._then);

  final PleromaApiFrontendConfigurationsPleromaFe _value;
  // ignore: unused_field
  final $Res Function(PleromaApiFrontendConfigurationsPleromaFe) _then;

  @override
  $Res call({
    Object? alwaysShowSubjectInput = freezed,
    Object? background = freezed,
    Object? collapseMessageWithSubject = freezed,
    Object? disableChat = freezed,
    Object? greentext = freezed,
    Object? hideFilteredStatuses = freezed,
    Object? hideMutedPosts = freezed,
    Object? hidePostStats = freezed,
    Object? hideUserStats = freezed,
    Object? loginMethod = freezed,
    Object? logo = freezed,
    Object? logoMargin = freezed,
    Object? logoMask = freezed,
    Object? minimalScopesMode = freezed,
    Object? noAttachmentLinks = freezed,
    Object? nsfwCensorImage = freezed,
    Object? postContentType = freezed,
    Object? redirectRootLogin = freezed,
    Object? redirectRootNoLogin = freezed,
    Object? scopeCopy = freezed,
    Object? showFeaturesPanel = freezed,
    Object? showInstanceSpecificPanel = freezed,
    Object? sidebarRight = freezed,
    Object? subjectLineBehavior = freezed,
    Object? theme = freezed,
    Object? webPushNotifications = freezed,
  }) {
    return _then(_value.copyWith(
      alwaysShowSubjectInput: alwaysShowSubjectInput == freezed
          ? _value.alwaysShowSubjectInput
          : alwaysShowSubjectInput // ignore: cast_nullable_to_non_nullable
              as bool?,
      background: background == freezed
          ? _value.background
          : background // ignore: cast_nullable_to_non_nullable
              as String?,
      collapseMessageWithSubject: collapseMessageWithSubject == freezed
          ? _value.collapseMessageWithSubject
          : collapseMessageWithSubject // ignore: cast_nullable_to_non_nullable
              as bool?,
      disableChat: disableChat == freezed
          ? _value.disableChat
          : disableChat // ignore: cast_nullable_to_non_nullable
              as bool?,
      greentext: greentext == freezed
          ? _value.greentext
          : greentext // ignore: cast_nullable_to_non_nullable
              as bool?,
      hideFilteredStatuses: hideFilteredStatuses == freezed
          ? _value.hideFilteredStatuses
          : hideFilteredStatuses // ignore: cast_nullable_to_non_nullable
              as bool?,
      hideMutedPosts: hideMutedPosts == freezed
          ? _value.hideMutedPosts
          : hideMutedPosts // ignore: cast_nullable_to_non_nullable
              as bool?,
      hidePostStats: hidePostStats == freezed
          ? _value.hidePostStats
          : hidePostStats // ignore: cast_nullable_to_non_nullable
              as bool?,
      hideUserStats: hideUserStats == freezed
          ? _value.hideUserStats
          : hideUserStats // ignore: cast_nullable_to_non_nullable
              as bool?,
      loginMethod: loginMethod == freezed
          ? _value.loginMethod
          : loginMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: logo == freezed
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      logoMargin: logoMargin == freezed
          ? _value.logoMargin
          : logoMargin // ignore: cast_nullable_to_non_nullable
              as String?,
      logoMask: logoMask == freezed
          ? _value.logoMask
          : logoMask // ignore: cast_nullable_to_non_nullable
              as bool?,
      minimalScopesMode: minimalScopesMode == freezed
          ? _value.minimalScopesMode
          : minimalScopesMode // ignore: cast_nullable_to_non_nullable
              as bool?,
      noAttachmentLinks: noAttachmentLinks == freezed
          ? _value.noAttachmentLinks
          : noAttachmentLinks // ignore: cast_nullable_to_non_nullable
              as bool?,
      nsfwCensorImage: nsfwCensorImage == freezed
          ? _value.nsfwCensorImage
          : nsfwCensorImage // ignore: cast_nullable_to_non_nullable
              as String?,
      postContentType: postContentType == freezed
          ? _value.postContentType
          : postContentType // ignore: cast_nullable_to_non_nullable
              as String?,
      redirectRootLogin: redirectRootLogin == freezed
          ? _value.redirectRootLogin
          : redirectRootLogin // ignore: cast_nullable_to_non_nullable
              as String?,
      redirectRootNoLogin: redirectRootNoLogin == freezed
          ? _value.redirectRootNoLogin
          : redirectRootNoLogin // ignore: cast_nullable_to_non_nullable
              as String?,
      scopeCopy: scopeCopy == freezed
          ? _value.scopeCopy
          : scopeCopy // ignore: cast_nullable_to_non_nullable
              as bool?,
      showFeaturesPanel: showFeaturesPanel == freezed
          ? _value.showFeaturesPanel
          : showFeaturesPanel // ignore: cast_nullable_to_non_nullable
              as bool?,
      showInstanceSpecificPanel: showInstanceSpecificPanel == freezed
          ? _value.showInstanceSpecificPanel
          : showInstanceSpecificPanel // ignore: cast_nullable_to_non_nullable
              as bool?,
      sidebarRight: sidebarRight == freezed
          ? _value.sidebarRight
          : sidebarRight // ignore: cast_nullable_to_non_nullable
              as bool?,
      subjectLineBehavior: subjectLineBehavior == freezed
          ? _value.subjectLineBehavior
          : subjectLineBehavior // ignore: cast_nullable_to_non_nullable
              as String?,
      theme: theme == freezed
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String?,
      webPushNotifications: webPushNotifications == freezed
          ? _value.webPushNotifications
          : webPushNotifications // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$PleromaApiFrontendConfigurationsPleromaFeCopyWith<$Res>
    implements $PleromaApiFrontendConfigurationsPleromaFeCopyWith<$Res> {
  factory _$PleromaApiFrontendConfigurationsPleromaFeCopyWith(
          _PleromaApiFrontendConfigurationsPleromaFe value,
          $Res Function(_PleromaApiFrontendConfigurationsPleromaFe) then) =
      __$PleromaApiFrontendConfigurationsPleromaFeCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) bool? alwaysShowSubjectInput,
      @HiveField(1) String? background,
      @HiveField(2) bool? collapseMessageWithSubject,
      @HiveField(3) bool? disableChat,
      @HiveField(4) bool? greentext,
      @HiveField(5) bool? hideFilteredStatuses,
      @HiveField(6) bool? hideMutedPosts,
      @HiveField(7) bool? hidePostStats,
      @HiveField(8) bool? hideUserStats,
      @HiveField(9) String? loginMethod,
      @HiveField(10) String? logo,
      @HiveField(11) String? logoMargin,
      @HiveField(12) bool? logoMask,
      @HiveField(13) bool? minimalScopesMode,
      @HiveField(14) bool? noAttachmentLinks,
      @HiveField(15) String? nsfwCensorImage,
      @HiveField(16) String? postContentType,
      @HiveField(17) String? redirectRootLogin,
      @HiveField(18) String? redirectRootNoLogin,
      @HiveField(19) bool? scopeCopy,
      @HiveField(20) bool? showFeaturesPanel,
      @HiveField(21) bool? showInstanceSpecificPanel,
      @HiveField(22) bool? sidebarRight,
      @HiveField(23) String? subjectLineBehavior,
      @HiveField(24) String? theme,
      @HiveField(25) bool? webPushNotifications});
}

/// @nodoc
class __$PleromaApiFrontendConfigurationsPleromaFeCopyWithImpl<$Res>
    extends _$PleromaApiFrontendConfigurationsPleromaFeCopyWithImpl<$Res>
    implements _$PleromaApiFrontendConfigurationsPleromaFeCopyWith<$Res> {
  __$PleromaApiFrontendConfigurationsPleromaFeCopyWithImpl(
      _PleromaApiFrontendConfigurationsPleromaFe _value,
      $Res Function(_PleromaApiFrontendConfigurationsPleromaFe) _then)
      : super(_value,
            (v) => _then(v as _PleromaApiFrontendConfigurationsPleromaFe));

  @override
  _PleromaApiFrontendConfigurationsPleromaFe get _value =>
      super._value as _PleromaApiFrontendConfigurationsPleromaFe;

  @override
  $Res call({
    Object? alwaysShowSubjectInput = freezed,
    Object? background = freezed,
    Object? collapseMessageWithSubject = freezed,
    Object? disableChat = freezed,
    Object? greentext = freezed,
    Object? hideFilteredStatuses = freezed,
    Object? hideMutedPosts = freezed,
    Object? hidePostStats = freezed,
    Object? hideUserStats = freezed,
    Object? loginMethod = freezed,
    Object? logo = freezed,
    Object? logoMargin = freezed,
    Object? logoMask = freezed,
    Object? minimalScopesMode = freezed,
    Object? noAttachmentLinks = freezed,
    Object? nsfwCensorImage = freezed,
    Object? postContentType = freezed,
    Object? redirectRootLogin = freezed,
    Object? redirectRootNoLogin = freezed,
    Object? scopeCopy = freezed,
    Object? showFeaturesPanel = freezed,
    Object? showInstanceSpecificPanel = freezed,
    Object? sidebarRight = freezed,
    Object? subjectLineBehavior = freezed,
    Object? theme = freezed,
    Object? webPushNotifications = freezed,
  }) {
    return _then(_PleromaApiFrontendConfigurationsPleromaFe(
      alwaysShowSubjectInput: alwaysShowSubjectInput == freezed
          ? _value.alwaysShowSubjectInput
          : alwaysShowSubjectInput // ignore: cast_nullable_to_non_nullable
              as bool?,
      background: background == freezed
          ? _value.background
          : background // ignore: cast_nullable_to_non_nullable
              as String?,
      collapseMessageWithSubject: collapseMessageWithSubject == freezed
          ? _value.collapseMessageWithSubject
          : collapseMessageWithSubject // ignore: cast_nullable_to_non_nullable
              as bool?,
      disableChat: disableChat == freezed
          ? _value.disableChat
          : disableChat // ignore: cast_nullable_to_non_nullable
              as bool?,
      greentext: greentext == freezed
          ? _value.greentext
          : greentext // ignore: cast_nullable_to_non_nullable
              as bool?,
      hideFilteredStatuses: hideFilteredStatuses == freezed
          ? _value.hideFilteredStatuses
          : hideFilteredStatuses // ignore: cast_nullable_to_non_nullable
              as bool?,
      hideMutedPosts: hideMutedPosts == freezed
          ? _value.hideMutedPosts
          : hideMutedPosts // ignore: cast_nullable_to_non_nullable
              as bool?,
      hidePostStats: hidePostStats == freezed
          ? _value.hidePostStats
          : hidePostStats // ignore: cast_nullable_to_non_nullable
              as bool?,
      hideUserStats: hideUserStats == freezed
          ? _value.hideUserStats
          : hideUserStats // ignore: cast_nullable_to_non_nullable
              as bool?,
      loginMethod: loginMethod == freezed
          ? _value.loginMethod
          : loginMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: logo == freezed
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      logoMargin: logoMargin == freezed
          ? _value.logoMargin
          : logoMargin // ignore: cast_nullable_to_non_nullable
              as String?,
      logoMask: logoMask == freezed
          ? _value.logoMask
          : logoMask // ignore: cast_nullable_to_non_nullable
              as bool?,
      minimalScopesMode: minimalScopesMode == freezed
          ? _value.minimalScopesMode
          : minimalScopesMode // ignore: cast_nullable_to_non_nullable
              as bool?,
      noAttachmentLinks: noAttachmentLinks == freezed
          ? _value.noAttachmentLinks
          : noAttachmentLinks // ignore: cast_nullable_to_non_nullable
              as bool?,
      nsfwCensorImage: nsfwCensorImage == freezed
          ? _value.nsfwCensorImage
          : nsfwCensorImage // ignore: cast_nullable_to_non_nullable
              as String?,
      postContentType: postContentType == freezed
          ? _value.postContentType
          : postContentType // ignore: cast_nullable_to_non_nullable
              as String?,
      redirectRootLogin: redirectRootLogin == freezed
          ? _value.redirectRootLogin
          : redirectRootLogin // ignore: cast_nullable_to_non_nullable
              as String?,
      redirectRootNoLogin: redirectRootNoLogin == freezed
          ? _value.redirectRootNoLogin
          : redirectRootNoLogin // ignore: cast_nullable_to_non_nullable
              as String?,
      scopeCopy: scopeCopy == freezed
          ? _value.scopeCopy
          : scopeCopy // ignore: cast_nullable_to_non_nullable
              as bool?,
      showFeaturesPanel: showFeaturesPanel == freezed
          ? _value.showFeaturesPanel
          : showFeaturesPanel // ignore: cast_nullable_to_non_nullable
              as bool?,
      showInstanceSpecificPanel: showInstanceSpecificPanel == freezed
          ? _value.showInstanceSpecificPanel
          : showInstanceSpecificPanel // ignore: cast_nullable_to_non_nullable
              as bool?,
      sidebarRight: sidebarRight == freezed
          ? _value.sidebarRight
          : sidebarRight // ignore: cast_nullable_to_non_nullable
              as bool?,
      subjectLineBehavior: subjectLineBehavior == freezed
          ? _value.subjectLineBehavior
          : subjectLineBehavior // ignore: cast_nullable_to_non_nullable
              as String?,
      theme: theme == freezed
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String?,
      webPushNotifications: webPushNotifications == freezed
          ? _value.webPushNotifications
          : webPushNotifications // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiFrontendConfigurationsPleromaFe
    implements _PleromaApiFrontendConfigurationsPleromaFe {
  const _$_PleromaApiFrontendConfigurationsPleromaFe(
      {@HiveField(0) required this.alwaysShowSubjectInput,
      @HiveField(1) required this.background,
      @HiveField(2) required this.collapseMessageWithSubject,
      @HiveField(3) required this.disableChat,
      @HiveField(4) required this.greentext,
      @HiveField(5) required this.hideFilteredStatuses,
      @HiveField(6) required this.hideMutedPosts,
      @HiveField(7) required this.hidePostStats,
      @HiveField(8) required this.hideUserStats,
      @HiveField(9) required this.loginMethod,
      @HiveField(10) required this.logo,
      @HiveField(11) required this.logoMargin,
      @HiveField(12) required this.logoMask,
      @HiveField(13) required this.minimalScopesMode,
      @HiveField(14) required this.noAttachmentLinks,
      @HiveField(15) required this.nsfwCensorImage,
      @HiveField(16) required this.postContentType,
      @HiveField(17) required this.redirectRootLogin,
      @HiveField(18) required this.redirectRootNoLogin,
      @HiveField(19) required this.scopeCopy,
      @HiveField(20) required this.showFeaturesPanel,
      @HiveField(21) required this.showInstanceSpecificPanel,
      @HiveField(22) required this.sidebarRight,
      @HiveField(23) required this.subjectLineBehavior,
      @HiveField(24) required this.theme,
      @HiveField(25) required this.webPushNotifications});

  factory _$_PleromaApiFrontendConfigurationsPleromaFe.fromJson(
          Map<String, dynamic> json) =>
      _$$_PleromaApiFrontendConfigurationsPleromaFeFromJson(json);

  @override
  @HiveField(0)
  final bool? alwaysShowSubjectInput;
  @override
  @HiveField(1)
  final String? background;
  @override
  @HiveField(2)
  final bool? collapseMessageWithSubject;
  @override
  @HiveField(3)
  final bool? disableChat;
  @override
  @HiveField(4)
  final bool? greentext;
  @override
  @HiveField(5)
  final bool? hideFilteredStatuses;
  @override
  @HiveField(6)
  final bool? hideMutedPosts;
  @override
  @HiveField(7)
  final bool? hidePostStats;
  @override
  @HiveField(8)
  final bool? hideUserStats;
  @override
  @HiveField(9)
  final String? loginMethod;
  @override
  @HiveField(10)
  final String? logo;
  @override
  @HiveField(11)
  final String? logoMargin;
  @override
  @HiveField(12)
  final bool? logoMask;
  @override
  @HiveField(13)
  final bool? minimalScopesMode;
  @override
  @HiveField(14)
  final bool? noAttachmentLinks;
  @override
  @HiveField(15)
  final String? nsfwCensorImage;
  @override
  @HiveField(16)
  final String? postContentType;
  @override
  @HiveField(17)
  final String? redirectRootLogin;
  @override
  @HiveField(18)
  final String? redirectRootNoLogin;
  @override
  @HiveField(19)
  final bool? scopeCopy;
  @override
  @HiveField(20)
  final bool? showFeaturesPanel;
  @override
  @HiveField(21)
  final bool? showInstanceSpecificPanel;
  @override
  @HiveField(22)
  final bool? sidebarRight;
  @override
  @HiveField(23)
  final String? subjectLineBehavior;
  @override
  @HiveField(24)
  final String? theme;
  @override
  @HiveField(25)
  final bool? webPushNotifications;

  @override
  String toString() {
    return 'PleromaApiFrontendConfigurationsPleromaFe(alwaysShowSubjectInput: $alwaysShowSubjectInput, background: $background, collapseMessageWithSubject: $collapseMessageWithSubject, disableChat: $disableChat, greentext: $greentext, hideFilteredStatuses: $hideFilteredStatuses, hideMutedPosts: $hideMutedPosts, hidePostStats: $hidePostStats, hideUserStats: $hideUserStats, loginMethod: $loginMethod, logo: $logo, logoMargin: $logoMargin, logoMask: $logoMask, minimalScopesMode: $minimalScopesMode, noAttachmentLinks: $noAttachmentLinks, nsfwCensorImage: $nsfwCensorImage, postContentType: $postContentType, redirectRootLogin: $redirectRootLogin, redirectRootNoLogin: $redirectRootNoLogin, scopeCopy: $scopeCopy, showFeaturesPanel: $showFeaturesPanel, showInstanceSpecificPanel: $showInstanceSpecificPanel, sidebarRight: $sidebarRight, subjectLineBehavior: $subjectLineBehavior, theme: $theme, webPushNotifications: $webPushNotifications)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiFrontendConfigurationsPleromaFe &&
            (identical(other.alwaysShowSubjectInput, alwaysShowSubjectInput) ||
                const DeepCollectionEquality().equals(
                    other.alwaysShowSubjectInput, alwaysShowSubjectInput)) &&
            (identical(other.background, background) ||
                const DeepCollectionEquality()
                    .equals(other.background, background)) &&
            (identical(other.collapseMessageWithSubject, collapseMessageWithSubject) ||
                const DeepCollectionEquality().equals(
                    other.collapseMessageWithSubject,
                    collapseMessageWithSubject)) &&
            (identical(other.disableChat, disableChat) ||
                const DeepCollectionEquality()
                    .equals(other.disableChat, disableChat)) &&
            (identical(other.greentext, greentext) ||
                const DeepCollectionEquality()
                    .equals(other.greentext, greentext)) &&
            (identical(other.hideFilteredStatuses, hideFilteredStatuses) ||
                const DeepCollectionEquality().equals(
                    other.hideFilteredStatuses, hideFilteredStatuses)) &&
            (identical(other.hideMutedPosts, hideMutedPosts) ||
                const DeepCollectionEquality()
                    .equals(other.hideMutedPosts, hideMutedPosts)) &&
            (identical(other.hidePostStats, hidePostStats) ||
                const DeepCollectionEquality()
                    .equals(other.hidePostStats, hidePostStats)) &&
            (identical(other.hideUserStats, hideUserStats) ||
                const DeepCollectionEquality()
                    .equals(other.hideUserStats, hideUserStats)) &&
            (identical(other.loginMethod, loginMethod) ||
                const DeepCollectionEquality()
                    .equals(other.loginMethod, loginMethod)) &&
            (identical(other.logo, logo) ||
                const DeepCollectionEquality().equals(other.logo, logo)) &&
            (identical(other.logoMargin, logoMargin) ||
                const DeepCollectionEquality()
                    .equals(other.logoMargin, logoMargin)) &&
            (identical(other.logoMask, logoMask) ||
                const DeepCollectionEquality()
                    .equals(other.logoMask, logoMask)) &&
            (identical(other.minimalScopesMode, minimalScopesMode) ||
                const DeepCollectionEquality()
                    .equals(other.minimalScopesMode, minimalScopesMode)) &&
            (identical(other.noAttachmentLinks, noAttachmentLinks) ||
                const DeepCollectionEquality()
                    .equals(other.noAttachmentLinks, noAttachmentLinks)) &&
            (identical(other.nsfwCensorImage, nsfwCensorImage) ||
                const DeepCollectionEquality()
                    .equals(other.nsfwCensorImage, nsfwCensorImage)) &&
            (identical(other.postContentType, postContentType) ||
                const DeepCollectionEquality()
                    .equals(other.postContentType, postContentType)) &&
            (identical(other.redirectRootLogin, redirectRootLogin) || const DeepCollectionEquality().equals(other.redirectRootLogin, redirectRootLogin)) &&
            (identical(other.redirectRootNoLogin, redirectRootNoLogin) || const DeepCollectionEquality().equals(other.redirectRootNoLogin, redirectRootNoLogin)) &&
            (identical(other.scopeCopy, scopeCopy) || const DeepCollectionEquality().equals(other.scopeCopy, scopeCopy)) &&
            (identical(other.showFeaturesPanel, showFeaturesPanel) || const DeepCollectionEquality().equals(other.showFeaturesPanel, showFeaturesPanel)) &&
            (identical(other.showInstanceSpecificPanel, showInstanceSpecificPanel) || const DeepCollectionEquality().equals(other.showInstanceSpecificPanel, showInstanceSpecificPanel)) &&
            (identical(other.sidebarRight, sidebarRight) || const DeepCollectionEquality().equals(other.sidebarRight, sidebarRight)) &&
            (identical(other.subjectLineBehavior, subjectLineBehavior) || const DeepCollectionEquality().equals(other.subjectLineBehavior, subjectLineBehavior)) &&
            (identical(other.theme, theme) || const DeepCollectionEquality().equals(other.theme, theme)) &&
            (identical(other.webPushNotifications, webPushNotifications) || const DeepCollectionEquality().equals(other.webPushNotifications, webPushNotifications)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(alwaysShowSubjectInput) ^
      const DeepCollectionEquality().hash(background) ^
      const DeepCollectionEquality().hash(collapseMessageWithSubject) ^
      const DeepCollectionEquality().hash(disableChat) ^
      const DeepCollectionEquality().hash(greentext) ^
      const DeepCollectionEquality().hash(hideFilteredStatuses) ^
      const DeepCollectionEquality().hash(hideMutedPosts) ^
      const DeepCollectionEquality().hash(hidePostStats) ^
      const DeepCollectionEquality().hash(hideUserStats) ^
      const DeepCollectionEquality().hash(loginMethod) ^
      const DeepCollectionEquality().hash(logo) ^
      const DeepCollectionEquality().hash(logoMargin) ^
      const DeepCollectionEquality().hash(logoMask) ^
      const DeepCollectionEquality().hash(minimalScopesMode) ^
      const DeepCollectionEquality().hash(noAttachmentLinks) ^
      const DeepCollectionEquality().hash(nsfwCensorImage) ^
      const DeepCollectionEquality().hash(postContentType) ^
      const DeepCollectionEquality().hash(redirectRootLogin) ^
      const DeepCollectionEquality().hash(redirectRootNoLogin) ^
      const DeepCollectionEquality().hash(scopeCopy) ^
      const DeepCollectionEquality().hash(showFeaturesPanel) ^
      const DeepCollectionEquality().hash(showInstanceSpecificPanel) ^
      const DeepCollectionEquality().hash(sidebarRight) ^
      const DeepCollectionEquality().hash(subjectLineBehavior) ^
      const DeepCollectionEquality().hash(theme) ^
      const DeepCollectionEquality().hash(webPushNotifications);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiFrontendConfigurationsPleromaFeCopyWith<
          _PleromaApiFrontendConfigurationsPleromaFe>
      get copyWith => __$PleromaApiFrontendConfigurationsPleromaFeCopyWithImpl<
          _PleromaApiFrontendConfigurationsPleromaFe>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiFrontendConfigurationsPleromaFeToJson(this);
  }
}

abstract class _PleromaApiFrontendConfigurationsPleromaFe
    implements PleromaApiFrontendConfigurationsPleromaFe {
  const factory _PleromaApiFrontendConfigurationsPleromaFe(
          {@HiveField(0) required bool? alwaysShowSubjectInput,
          @HiveField(1) required String? background,
          @HiveField(2) required bool? collapseMessageWithSubject,
          @HiveField(3) required bool? disableChat,
          @HiveField(4) required bool? greentext,
          @HiveField(5) required bool? hideFilteredStatuses,
          @HiveField(6) required bool? hideMutedPosts,
          @HiveField(7) required bool? hidePostStats,
          @HiveField(8) required bool? hideUserStats,
          @HiveField(9) required String? loginMethod,
          @HiveField(10) required String? logo,
          @HiveField(11) required String? logoMargin,
          @HiveField(12) required bool? logoMask,
          @HiveField(13) required bool? minimalScopesMode,
          @HiveField(14) required bool? noAttachmentLinks,
          @HiveField(15) required String? nsfwCensorImage,
          @HiveField(16) required String? postContentType,
          @HiveField(17) required String? redirectRootLogin,
          @HiveField(18) required String? redirectRootNoLogin,
          @HiveField(19) required bool? scopeCopy,
          @HiveField(20) required bool? showFeaturesPanel,
          @HiveField(21) required bool? showInstanceSpecificPanel,
          @HiveField(22) required bool? sidebarRight,
          @HiveField(23) required String? subjectLineBehavior,
          @HiveField(24) required String? theme,
          @HiveField(25) required bool? webPushNotifications}) =
      _$_PleromaApiFrontendConfigurationsPleromaFe;

  factory _PleromaApiFrontendConfigurationsPleromaFe.fromJson(
          Map<String, dynamic> json) =
      _$_PleromaApiFrontendConfigurationsPleromaFe.fromJson;

  @override
  @HiveField(0)
  bool? get alwaysShowSubjectInput => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String? get background => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  bool? get collapseMessageWithSubject => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  bool? get disableChat => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  bool? get greentext => throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  bool? get hideFilteredStatuses => throw _privateConstructorUsedError;
  @override
  @HiveField(6)
  bool? get hideMutedPosts => throw _privateConstructorUsedError;
  @override
  @HiveField(7)
  bool? get hidePostStats => throw _privateConstructorUsedError;
  @override
  @HiveField(8)
  bool? get hideUserStats => throw _privateConstructorUsedError;
  @override
  @HiveField(9)
  String? get loginMethod => throw _privateConstructorUsedError;
  @override
  @HiveField(10)
  String? get logo => throw _privateConstructorUsedError;
  @override
  @HiveField(11)
  String? get logoMargin => throw _privateConstructorUsedError;
  @override
  @HiveField(12)
  bool? get logoMask => throw _privateConstructorUsedError;
  @override
  @HiveField(13)
  bool? get minimalScopesMode => throw _privateConstructorUsedError;
  @override
  @HiveField(14)
  bool? get noAttachmentLinks => throw _privateConstructorUsedError;
  @override
  @HiveField(15)
  String? get nsfwCensorImage => throw _privateConstructorUsedError;
  @override
  @HiveField(16)
  String? get postContentType => throw _privateConstructorUsedError;
  @override
  @HiveField(17)
  String? get redirectRootLogin => throw _privateConstructorUsedError;
  @override
  @HiveField(18)
  String? get redirectRootNoLogin => throw _privateConstructorUsedError;
  @override
  @HiveField(19)
  bool? get scopeCopy => throw _privateConstructorUsedError;
  @override
  @HiveField(20)
  bool? get showFeaturesPanel => throw _privateConstructorUsedError;
  @override
  @HiveField(21)
  bool? get showInstanceSpecificPanel => throw _privateConstructorUsedError;
  @override
  @HiveField(22)
  bool? get sidebarRight => throw _privateConstructorUsedError;
  @override
  @HiveField(23)
  String? get subjectLineBehavior => throw _privateConstructorUsedError;
  @override
  @HiveField(24)
  String? get theme => throw _privateConstructorUsedError;
  @override
  @HiveField(25)
  bool? get webPushNotifications => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiFrontendConfigurationsPleromaFeCopyWith<
          _PleromaApiFrontendConfigurationsPleromaFe>
      get copyWith => throw _privateConstructorUsedError;
}

PleromaApiFrontendConfigurationsSoapboxFe
    _$PleromaApiFrontendConfigurationsSoapboxFeFromJson(
        Map<String, dynamic> json) {
  return _PleromaApiFrontendConfigurationsSoapboxFe.fromJson(json);
}

/// @nodoc
class _$PleromaApiFrontendConfigurationsSoapboxFeTearOff {
  const _$PleromaApiFrontendConfigurationsSoapboxFeTearOff();

  _PleromaApiFrontendConfigurationsSoapboxFe call(
      {@HiveField(0) required String? brandColor}) {
    return _PleromaApiFrontendConfigurationsSoapboxFe(
      brandColor: brandColor,
    );
  }

  PleromaApiFrontendConfigurationsSoapboxFe fromJson(Map<String, Object> json) {
    return PleromaApiFrontendConfigurationsSoapboxFe.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiFrontendConfigurationsSoapboxFe =
    _$PleromaApiFrontendConfigurationsSoapboxFeTearOff();

/// @nodoc
mixin _$PleromaApiFrontendConfigurationsSoapboxFe {
  @HiveField(0)
  String? get brandColor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiFrontendConfigurationsSoapboxFeCopyWith<
          PleromaApiFrontendConfigurationsSoapboxFe>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiFrontendConfigurationsSoapboxFeCopyWith<$Res> {
  factory $PleromaApiFrontendConfigurationsSoapboxFeCopyWith(
          PleromaApiFrontendConfigurationsSoapboxFe value,
          $Res Function(PleromaApiFrontendConfigurationsSoapboxFe) then) =
      _$PleromaApiFrontendConfigurationsSoapboxFeCopyWithImpl<$Res>;
  $Res call({@HiveField(0) String? brandColor});
}

/// @nodoc
class _$PleromaApiFrontendConfigurationsSoapboxFeCopyWithImpl<$Res>
    implements $PleromaApiFrontendConfigurationsSoapboxFeCopyWith<$Res> {
  _$PleromaApiFrontendConfigurationsSoapboxFeCopyWithImpl(
      this._value, this._then);

  final PleromaApiFrontendConfigurationsSoapboxFe _value;
  // ignore: unused_field
  final $Res Function(PleromaApiFrontendConfigurationsSoapboxFe) _then;

  @override
  $Res call({
    Object? brandColor = freezed,
  }) {
    return _then(_value.copyWith(
      brandColor: brandColor == freezed
          ? _value.brandColor
          : brandColor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PleromaApiFrontendConfigurationsSoapboxFeCopyWith<$Res>
    implements $PleromaApiFrontendConfigurationsSoapboxFeCopyWith<$Res> {
  factory _$PleromaApiFrontendConfigurationsSoapboxFeCopyWith(
          _PleromaApiFrontendConfigurationsSoapboxFe value,
          $Res Function(_PleromaApiFrontendConfigurationsSoapboxFe) then) =
      __$PleromaApiFrontendConfigurationsSoapboxFeCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) String? brandColor});
}

/// @nodoc
class __$PleromaApiFrontendConfigurationsSoapboxFeCopyWithImpl<$Res>
    extends _$PleromaApiFrontendConfigurationsSoapboxFeCopyWithImpl<$Res>
    implements _$PleromaApiFrontendConfigurationsSoapboxFeCopyWith<$Res> {
  __$PleromaApiFrontendConfigurationsSoapboxFeCopyWithImpl(
      _PleromaApiFrontendConfigurationsSoapboxFe _value,
      $Res Function(_PleromaApiFrontendConfigurationsSoapboxFe) _then)
      : super(_value,
            (v) => _then(v as _PleromaApiFrontendConfigurationsSoapboxFe));

  @override
  _PleromaApiFrontendConfigurationsSoapboxFe get _value =>
      super._value as _PleromaApiFrontendConfigurationsSoapboxFe;

  @override
  $Res call({
    Object? brandColor = freezed,
  }) {
    return _then(_PleromaApiFrontendConfigurationsSoapboxFe(
      brandColor: brandColor == freezed
          ? _value.brandColor
          : brandColor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiFrontendConfigurationsSoapboxFe
    implements _PleromaApiFrontendConfigurationsSoapboxFe {
  const _$_PleromaApiFrontendConfigurationsSoapboxFe(
      {@HiveField(0) required this.brandColor});

  factory _$_PleromaApiFrontendConfigurationsSoapboxFe.fromJson(
          Map<String, dynamic> json) =>
      _$$_PleromaApiFrontendConfigurationsSoapboxFeFromJson(json);

  @override
  @HiveField(0)
  final String? brandColor;

  @override
  String toString() {
    return 'PleromaApiFrontendConfigurationsSoapboxFe(brandColor: $brandColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiFrontendConfigurationsSoapboxFe &&
            (identical(other.brandColor, brandColor) ||
                const DeepCollectionEquality()
                    .equals(other.brandColor, brandColor)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(brandColor);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiFrontendConfigurationsSoapboxFeCopyWith<
          _PleromaApiFrontendConfigurationsSoapboxFe>
      get copyWith => __$PleromaApiFrontendConfigurationsSoapboxFeCopyWithImpl<
          _PleromaApiFrontendConfigurationsSoapboxFe>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiFrontendConfigurationsSoapboxFeToJson(this);
  }
}

abstract class _PleromaApiFrontendConfigurationsSoapboxFe
    implements PleromaApiFrontendConfigurationsSoapboxFe {
  const factory _PleromaApiFrontendConfigurationsSoapboxFe(
          {@HiveField(0) required String? brandColor}) =
      _$_PleromaApiFrontendConfigurationsSoapboxFe;

  factory _PleromaApiFrontendConfigurationsSoapboxFe.fromJson(
          Map<String, dynamic> json) =
      _$_PleromaApiFrontendConfigurationsSoapboxFe.fromJson;

  @override
  @HiveField(0)
  String? get brandColor => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiFrontendConfigurationsSoapboxFeCopyWith<
          _PleromaApiFrontendConfigurationsSoapboxFe>
      get copyWith => throw _privateConstructorUsedError;
}

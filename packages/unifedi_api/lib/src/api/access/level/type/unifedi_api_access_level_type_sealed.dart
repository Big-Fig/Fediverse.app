import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../unifedi_api_model.dart';

part 'unifedi_api_access_level_type_sealed.freezed.dart';

// ignore_for_file: no-magic-number
@freezed
class UnifediApiAccessLevelType
    with _$UnifediApiAccessLevelType
    implements IUnifediApiUnion {
  static const publicLevelIntValue =
      FediverseApiAccessLevelType.publicLevelIntValue;
  static const applicationLevelIntValue =
      FediverseApiAccessLevelType.applicationLevelIntValue;
  static const userLevelIntValue =
      FediverseApiAccessLevelType.userLevelIntValue;

  static const publicLevelStringValue =
      FediverseApiAccessLevelType.publicLevelStringValue;
  static const applicationLevelStringValue =
      FediverseApiAccessLevelType.applicationLevelStringValue;
  static const userLevelStringValue =
      FediverseApiAccessLevelType.userLevelStringValue;

  static const publicValue = UnifediApiAccessLevelType.public();
  static const applicationValue = UnifediApiAccessLevelType.application();
  static const userValue = UnifediApiAccessLevelType.user();

  static const values = [
    publicValue,
    applicationValue,
    userValue,
  ];

  const factory UnifediApiAccessLevelType.public({
    @Default(UnifediApiAccessLevelType.publicLevelIntValue) int level,
    @Default(UnifediApiAccessLevelType.publicLevelStringValue)
        String stringValue,
  }) = _Public;

  const factory UnifediApiAccessLevelType.application({
    @Default(UnifediApiAccessLevelType.applicationLevelIntValue) int level,
    @Default(UnifediApiAccessLevelType.applicationLevelStringValue)
        String stringValue,
  }) = _Application;

  const factory UnifediApiAccessLevelType.user({
    @Default(UnifediApiAccessLevelType.userLevelIntValue) int level,
    @Default(UnifediApiAccessLevelType.userLevelStringValue) String stringValue,
  }) = _Valid;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static UnifediApiAccessLevelType fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: null,
      );
}

extension UnifediApiAccessLevelTypeStringExtension on String {
  UnifediApiAccessLevelType toUnifediApiAccessLevelType() =>
      UnifediApiAccessLevelType.fromStringValue(this);
}

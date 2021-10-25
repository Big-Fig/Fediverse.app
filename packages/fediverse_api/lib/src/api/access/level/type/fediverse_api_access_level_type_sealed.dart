import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../fediverse_api.dart';

part 'fediverse_api_access_level_type_sealed.freezed.dart';

// ignore_for_file: no-magic-number
@freezed
class FediverseApiAccessLevelType
    with _$FediverseApiAccessLevelType
    implements IFediverseApiUnion {
  static const publicLevelIntValue = 100;
  static const applicationLevelIntValue = 200;
  static const userLevelIntValue = 300;

  static const publicLevelStringValue = 'public';
  static const applicationLevelStringValue = 'application';
  static const userLevelStringValue = 'user';

  static const publicValue = FediverseApiAccessLevelType.public();
  static const applicationValue = FediverseApiAccessLevelType.application();
  static const userValue = FediverseApiAccessLevelType.user();

  static const values = [
    publicValue,
    applicationValue,
    userValue,
  ];

  const factory FediverseApiAccessLevelType.public({
    @Default(FediverseApiAccessLevelType.publicLevelIntValue) int level,
    @Default(FediverseApiAccessLevelType.publicLevelStringValue)
        String stringValue,
  }) = _Public;

  const factory FediverseApiAccessLevelType.application({
    @Default(FediverseApiAccessLevelType.applicationLevelIntValue) int level,
    @Default(FediverseApiAccessLevelType.applicationLevelStringValue)
        String stringValue,
  }) = _Application;

  const factory FediverseApiAccessLevelType.user({
    @Default(FediverseApiAccessLevelType.userLevelIntValue) int level,
    @Default(FediverseApiAccessLevelType.userLevelStringValue)
        String stringValue,
  }) = _User;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static FediverseApiAccessLevelType fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: null,
      );
}

extension FediverseApiAccessLevelTypeStringExtension on String {
  FediverseApiAccessLevelType toFediverseApiAccessLevelType() =>
      FediverseApiAccessLevelType.fromStringValue(this);
}

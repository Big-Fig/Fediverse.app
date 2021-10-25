import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../mastodon_api_model.dart';

part 'mastodon_api_visibility_sealed.freezed.dart';

@freezed
class MastodonApiVisibility
    with _$MastodonApiVisibility
    implements IMastodonApiUnion {
  static const publicStringValue = 'public';
  static const unlistedStringValue = 'unlisted';
  static const directStringValue = 'direct';
  static const privateStringValue = 'private';

  static const publicValue = MastodonApiVisibility.public();
  static const unlistedValue = MastodonApiVisibility.unlisted();
  static const directValue = MastodonApiVisibility.direct();
  static const privateValue = MastodonApiVisibility.private();

  static const values = [
    publicValue,
    unlistedValue,
    directValue,
    privateValue,
  ];

  const factory MastodonApiVisibility.public({
    @Default(MastodonApiVisibility.publicStringValue) String stringValue,
  }) = _Public;

  const factory MastodonApiVisibility.unlisted({
    @Default(MastodonApiVisibility.unlistedStringValue) String stringValue,
  }) = _Unlisted;

  const factory MastodonApiVisibility.direct({
    @Default(MastodonApiVisibility.directStringValue) String stringValue,
  }) = _Direct;

  const factory MastodonApiVisibility.private({
    @Default(MastodonApiVisibility.privateStringValue) String stringValue,
  }) = _Private;

  const factory MastodonApiVisibility.unknown({
    required String stringValue,
  }) = _Unknown;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static MastodonApiVisibility fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: (stringValue) => MastodonApiVisibility.unknown(
          stringValue: stringValue,
        ),
      );
}

extension MastodonApiVisibilityStringExtension on String {
  MastodonApiVisibility toMastodonApiVisibility() =>
      MastodonApiVisibility.fromStringValue(this);
}

extension MastodonApiVisibilityStringListExtension on List<String> {
  List<MastodonApiVisibility> toMastodonApiVisibilityList() =>
      map((stringValue) => stringValue.toMastodonApiVisibility()).toList();
}

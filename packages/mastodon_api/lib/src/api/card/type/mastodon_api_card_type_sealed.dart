import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../mastodon_api_model.dart';

part 'mastodon_api_card_type_sealed.freezed.dart';

@freezed
class MastodonApiCardType
    with _$MastodonApiCardType
    implements IMastodonApiUnion {
  static const linkStringValue = 'link';
  static const photoStringValue = 'photo';
  static const videoStringValue = 'video';
  static const richStringValue = 'rich';

  static const linkValue = MastodonApiCardType.link();
  static const photoValue = MastodonApiCardType.photo();
  static const videoValue = MastodonApiCardType.video();
  static const richValue = MastodonApiCardType.rich();

  static const values = [
    linkValue,
    photoValue,
    videoValue,
    richValue,
  ];

  const factory MastodonApiCardType.link({
    @Default(MastodonApiCardType.linkStringValue) String stringValue,
  }) = _Link;

  const factory MastodonApiCardType.photo({
    @Default(MastodonApiCardType.photoStringValue) String stringValue,
  }) = _Photo;

  const factory MastodonApiCardType.video({
    @Default(MastodonApiCardType.videoStringValue) String stringValue,
  }) = _Video;

  const factory MastodonApiCardType.rich({
    @Default(MastodonApiCardType.richStringValue) String stringValue,
  }) = _Rich;

  const factory MastodonApiCardType.unknown({
    required String stringValue,
  }) = _Unknown;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static MastodonApiCardType fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: (stringValue) => MastodonApiCardType.unknown(
          stringValue: stringValue,
        ),
      );
}

extension MastodonApiCardTypeStringExtension on String {
  MastodonApiCardType toMastodonApiCardType() =>
      MastodonApiCardType.fromStringValue(this);
}

extension MastodonApiCardTypeStringListExtension on List<String> {
  List<MastodonApiCardType> toMastodonApiCardTypeList() =>
      map((stringValue) => stringValue.toMastodonApiCardType()).toList();
}

import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../mastodon/card/type/unifedi_api_card_type_sealed_mastodon_converter.dart';
import '../../unifedi_api_model.dart';

part 'unifedi_api_card_type_sealed.freezed.dart';

@freezed
class UnifediApiCardType with _$UnifediApiCardType implements IUnifediApiUnion {
  static const linkStringValue = 'link';
  static const photoStringValue = 'photo';
  static const videoStringValue = 'video';
  static const richStringValue = 'rich';

  static const linkValue = UnifediApiCardType.link();
  static const photoValue = UnifediApiCardType.photo();
  static const videoValue = UnifediApiCardType.video();
  static const richValue = UnifediApiCardType.rich();

  static const values = [
    linkValue,
    photoValue,
    videoValue,
    richValue,
  ];

  const factory UnifediApiCardType.link({
    @Default(UnifediApiCardType.linkStringValue) String stringValue,
  }) = _Link;

  const factory UnifediApiCardType.photo({
    @Default(UnifediApiCardType.photoStringValue) String stringValue,
  }) = _Photo;

  const factory UnifediApiCardType.video({
    @Default(UnifediApiCardType.videoStringValue) String stringValue,
  }) = _Video;

  const factory UnifediApiCardType.rich({
    @Default(UnifediApiCardType.richStringValue) String stringValue,
  }) = _Rich;

  const factory UnifediApiCardType.unknown({
    required String stringValue,
  }) = _Unknown;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static UnifediApiCardType fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: (stringValue) => UnifediApiCardType.unknown(
          stringValue: stringValue,
        ),
      );
}

extension UnifediApiCardTypeStringExtension on String {
  UnifediApiCardType toUnifediApiCardType() =>
      UnifediApiCardType.fromStringValue(this);
}

extension UnifediApiCardTypeStringListExtension on List<String> {
  List<UnifediApiCardType> toUnifediApiCardTypeList() =>
      map((stringValue) => stringValue.toUnifediApiCardType()).toList();
}

extension UnifediApiCardTypeStringMastodonExtension
    on List<UnifediApiCardType> {
  List<MastodonApiCardType> toMastodonApiCardTypeList() =>
      map((stringValue) => stringValue.toMastodonApiCardType()).toList();
}

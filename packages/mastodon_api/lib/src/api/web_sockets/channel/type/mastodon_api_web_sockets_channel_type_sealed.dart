import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../mastodon_api_model.dart';

part 'mastodon_api_web_sockets_channel_type_sealed.freezed.dart';

@freezed
class MastodonApiWebSocketsChannelType
    with _$MastodonApiWebSocketsChannelType
    implements IMastodonApiUnion {
  static const publicStringValue = 'public';
  static const directStringValue = 'direct';
  static const userStringValue = 'user';
  static const listStringValue = 'list';
  static const hashtagStringValue = 'hashtag';

  static const publicValue = MastodonApiWebSocketsChannelType.public();
  static const directValue = MastodonApiWebSocketsChannelType.direct();
  static const userValue = MastodonApiWebSocketsChannelType.user();
  static const listValue = MastodonApiWebSocketsChannelType.list();
  static const hashtagValue = MastodonApiWebSocketsChannelType.hashtag();

  static const values = [
    publicValue,
    directValue,
    userValue,
    listValue,
    hashtagValue,
  ];

  const factory MastodonApiWebSocketsChannelType.public({
    @Default(MastodonApiWebSocketsChannelType.publicStringValue)
        String stringValue,
  }) = _Public;

  const factory MastodonApiWebSocketsChannelType.direct({
    @Default(MastodonApiWebSocketsChannelType.directStringValue)
        String stringValue,
  }) = _Direct;

  const factory MastodonApiWebSocketsChannelType.user({
    @Default(MastodonApiWebSocketsChannelType.userStringValue)
        String stringValue,
  }) = _User;

  const factory MastodonApiWebSocketsChannelType.list({
    @Default(MastodonApiWebSocketsChannelType.listStringValue)
        String stringValue,
  }) = _List;

  const factory MastodonApiWebSocketsChannelType.hashtag({
    @Default(MastodonApiWebSocketsChannelType.hashtagStringValue)
        String stringValue,
  }) = _Hashtag;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static MastodonApiWebSocketsChannelType fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: null,
      );
}

extension MastodonApiWebSocketsChannelTypeStringExtension on String {
  MastodonApiWebSocketsChannelType toMastodonApiWebSocketsChannelType() =>
      MastodonApiWebSocketsChannelType.fromStringValue(this);
}

extension MastodonApiWebSocketsChannelTypeStringListExtension on List<String> {
  List<MastodonApiWebSocketsChannelType>
      toMastodonApiWebSocketsChannelTypeList() =>
          map((stringValue) => stringValue.toMastodonApiWebSocketsChannelType())
              .toList();
}

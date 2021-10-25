import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../unifedi_api_model.dart';

part 'unifedi_api_web_sockets_channel_type_sealed.freezed.dart';

@freezed
class UnifediApiWebSocketsChannelType
    with _$UnifediApiWebSocketsChannelType
    implements IUnifediApiUnion {
  static const publicStringValue = 'public';
  static const directStringValue = 'direct';
  static const userStringValue = 'user';
  static const listStringValue = 'list';
  static const hashtagStringValue = 'hashtag';

  static const publicValue = UnifediApiWebSocketsChannelType.public();
  static const directValue = UnifediApiWebSocketsChannelType.direct();
  static const userValue = UnifediApiWebSocketsChannelType.user();
  static const listValue = UnifediApiWebSocketsChannelType.list();
  static const hashtagValue = UnifediApiWebSocketsChannelType.hashtag();

  static const values = [
    publicValue,
    directValue,
    userValue,
    listValue,
    hashtagValue,
  ];

  const factory UnifediApiWebSocketsChannelType.public({
    @Default(UnifediApiWebSocketsChannelType.publicStringValue)
        String stringValue,
  }) = _Public;

  const factory UnifediApiWebSocketsChannelType.direct({
    @Default(UnifediApiWebSocketsChannelType.directStringValue)
        String stringValue,
  }) = _Direct;

  const factory UnifediApiWebSocketsChannelType.user({
    @Default(UnifediApiWebSocketsChannelType.userStringValue)
        String stringValue,
  }) = _User;

  const factory UnifediApiWebSocketsChannelType.list({
    @Default(UnifediApiWebSocketsChannelType.listStringValue)
        String stringValue,
  }) = _List;

  const factory UnifediApiWebSocketsChannelType.hashtag({
    @Default(UnifediApiWebSocketsChannelType.hashtagStringValue)
        String stringValue,
  }) = _Hashtag;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static UnifediApiWebSocketsChannelType fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: null,
      );
}

extension UnifediApiWebSocketsChannelTypeStringExtension on String {
  UnifediApiWebSocketsChannelType toUnifediApiWebSocketsChannelType() =>
      UnifediApiWebSocketsChannelType.fromStringValue(this);
}

extension UnifediApiWebSocketsChannelTypeStringListExtension on List<String> {
  List<UnifediApiWebSocketsChannelType>
      toUnifediApiWebSocketsChannelTypeList() =>
          map((stringValue) => stringValue.toUnifediApiWebSocketsChannelType())
              .toList();
}

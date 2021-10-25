import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../pleroma_api_model.dart';

part 'pleroma_api_web_sockets_channel_type_sealed.freezed.dart';

@freezed
class PleromaApiWebSocketsChannelType
    with _$PleromaApiWebSocketsChannelType
    implements IPleromaApiUnion {
  static const publicStringValue = 'public';
  static const directStringValue = 'direct';
  static const userStringValue = 'user';
  static const listStringValue = 'list';
  static const hashtagStringValue = 'hashtag';

  static const publicValue = PleromaApiWebSocketsChannelType.public();
  static const directValue = PleromaApiWebSocketsChannelType.direct();
  static const userValue = PleromaApiWebSocketsChannelType.user();
  static const listValue = PleromaApiWebSocketsChannelType.list();
  static const hashtagValue = PleromaApiWebSocketsChannelType.hashtag();

  static const values = [
    publicValue,
    directValue,
    userValue,
    listValue,
    hashtagValue,
  ];

  const factory PleromaApiWebSocketsChannelType.public({
    @Default(PleromaApiWebSocketsChannelType.publicStringValue)
        String stringValue,
  }) = _Public;

  const factory PleromaApiWebSocketsChannelType.direct({
    @Default(PleromaApiWebSocketsChannelType.directStringValue)
        String stringValue,
  }) = _Direct;

  const factory PleromaApiWebSocketsChannelType.user({
    @Default(PleromaApiWebSocketsChannelType.userStringValue)
        String stringValue,
  }) = _User;

  const factory PleromaApiWebSocketsChannelType.list({
    @Default(PleromaApiWebSocketsChannelType.listStringValue)
        String stringValue,
  }) = _List;

  const factory PleromaApiWebSocketsChannelType.hashtag({
    @Default(PleromaApiWebSocketsChannelType.hashtagStringValue)
        String stringValue,
  }) = _Hashtag;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static PleromaApiWebSocketsChannelType fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: null,
      );
}

extension PleromaApiWebSocketsChannelTypeStringExtension on String {
  PleromaApiWebSocketsChannelType toPleromaApiWebSocketsChannelType() =>
      PleromaApiWebSocketsChannelType.fromStringValue(this);
}

extension PleromaApiWebSocketsChannelTypeStringListExtension on List<String> {
  List<PleromaApiWebSocketsChannelType>
      toPleromaApiWebSocketsChannelTypeList() =>
          map((stringValue) => stringValue.toPleromaApiWebSocketsChannelType())
              .toList();
}

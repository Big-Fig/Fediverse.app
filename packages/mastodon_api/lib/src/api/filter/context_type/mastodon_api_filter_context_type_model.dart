import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../mastodon_api_model.dart';

part 'mastodon_api_filter_context_type_model.freezed.dart';

@freezed
class MastodonApiFilterContextType
    with _$MastodonApiFilterContextType
    implements IMastodonApiUnion {
  static const homeStringValue = 'home';
  static const notificationsStringValue = 'notifications';
  static const publicStringValue = 'public';
  static const threadStringValue = 'thread';
  static const accountStringValue = 'account';

  static const homeValue = MastodonApiFilterContextType.home();
  static const notificationsValue =
      MastodonApiFilterContextType.notifications();
  static const publicValue = MastodonApiFilterContextType.public();
  static const threadValue = MastodonApiFilterContextType.thread();
  static const accountValue = MastodonApiFilterContextType.account();

  static const values = [
    homeValue,
    notificationsValue,
    publicValue,
    threadValue,
    accountValue,
  ];

  const factory MastodonApiFilterContextType.home({
    @Default(MastodonApiFilterContextType.homeStringValue) String stringValue,
  }) = _Home;

  const factory MastodonApiFilterContextType.notifications({
    @Default(MastodonApiFilterContextType.notificationsStringValue)
        String stringValue,
  }) = _Notifications;

  const factory MastodonApiFilterContextType.public({
    @Default(MastodonApiFilterContextType.publicStringValue) String stringValue,
  }) = _Public;

  const factory MastodonApiFilterContextType.thread({
    @Default(MastodonApiFilterContextType.threadStringValue) String stringValue,
  }) = _Thread;

  const factory MastodonApiFilterContextType.account({
    @Default(MastodonApiFilterContextType.accountStringValue)
        String stringValue,
  }) = _Account;

  const factory MastodonApiFilterContextType.unknown({
    required String stringValue,
  }) = _Unknown;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static MastodonApiFilterContextType fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: (stringValue) =>
            MastodonApiFilterContextType.unknown(
          stringValue: stringValue,
        ),
      );
}

extension MastodonApiFilterContextTypeStringExtension on String {
  MastodonApiFilterContextType toMastodonApiFilterContextType() =>
      MastodonApiFilterContextType.fromStringValue(this);
}

extension MastodonApiFilterContextTypeStringListExtension on List<String> {
  List<MastodonApiFilterContextType> toMastodonApiFilterContextTypeList() =>
      map((stringValue) => stringValue.toMastodonApiFilterContextType())
          .toList();
}

import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../unifedi_api_model.dart';

part 'unifedi_api_filter_context_type_model.freezed.dart';

@freezed
class UnifediApiFilterContextType
    with _$UnifediApiFilterContextType
    implements IUnifediApiUnion {
  static const homeStringValue = 'home';
  static const notificationsStringValue = 'notifications';
  static const publicStringValue = 'public';
  static const threadStringValue = 'thread';
  static const accountStringValue = 'account';

  static const homeValue = UnifediApiFilterContextType.home();
  static const notificationsValue = UnifediApiFilterContextType.notifications();
  static const publicValue = UnifediApiFilterContextType.public();
  static const threadValue = UnifediApiFilterContextType.thread();
  static const accountValue = UnifediApiFilterContextType.account();

  static const values = [
    homeValue,
    notificationsValue,
    publicValue,
    threadValue,
    accountValue,
  ];

  const factory UnifediApiFilterContextType.home({
    @Default(UnifediApiFilterContextType.homeStringValue) String stringValue,
  }) = _Home;

  const factory UnifediApiFilterContextType.notifications({
    @Default(UnifediApiFilterContextType.notificationsStringValue)
        String stringValue,
  }) = _Notifications;

  const factory UnifediApiFilterContextType.public({
    @Default(UnifediApiFilterContextType.publicStringValue) String stringValue,
  }) = _Public;

  const factory UnifediApiFilterContextType.thread({
    @Default(UnifediApiFilterContextType.threadStringValue) String stringValue,
  }) = _Thread;

  const factory UnifediApiFilterContextType.account({
    @Default(UnifediApiFilterContextType.accountStringValue) String stringValue,
  }) = _Account;

  const factory UnifediApiFilterContextType.unknown({
    required String stringValue,
  }) = _Unknown;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static UnifediApiFilterContextType fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: (stringValue) =>
            UnifediApiFilterContextType.unknown(
          stringValue: stringValue,
        ),
      );
}

extension UnifediApiFilterContextTypeStringExtension on String {
  UnifediApiFilterContextType toUnifediApiFilterContextType() =>
      UnifediApiFilterContextType.fromStringValue(this);
}

extension UnifediApiFilterContextTypeStringListExtension on List<String> {
  List<UnifediApiFilterContextType> toUnifediApiFilterContextTypeList() =>
      map((stringValue) => stringValue.toUnifediApiFilterContextType())
          .toList();
}

extension UnifediApiFilterContextTypeMastodonExtension
    on UnifediApiFilterContextType {
  MastodonApiFilterContextType toMastodonApiFilterContextType() =>
      MastodonApiFilterContextType.fromStringValue(stringValue);
}

extension UnifediApiFilterContextTypeStringMastodonExtension
    on List<UnifediApiFilterContextType> {
  List<MastodonApiFilterContextType> toMastodonApiFilterContextTypeList() =>
      map((stringValue) => stringValue.toMastodonApiFilterContextType())
          .toList();
}

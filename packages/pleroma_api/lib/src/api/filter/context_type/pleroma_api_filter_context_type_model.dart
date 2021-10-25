import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../pleroma_api_model.dart';

part 'pleroma_api_filter_context_type_model.freezed.dart';

@freezed
class PleromaApiFilterContextType
    with _$PleromaApiFilterContextType
    implements IPleromaApiUnion {
  static const homeStringValue = MastodonApiFilterContextType.homeStringValue;
  static const notificationsStringValue =
      MastodonApiFilterContextType.notificationsStringValue;
  static const publicStringValue =
      MastodonApiFilterContextType.publicStringValue;
  static const threadStringValue =
      MastodonApiFilterContextType.threadStringValue;
  static const accountStringValue =
      MastodonApiFilterContextType.accountStringValue;

  static const homeValue = PleromaApiFilterContextType.home();
  static const notificationsValue = PleromaApiFilterContextType.notifications();
  static const publicValue = PleromaApiFilterContextType.public();
  static const threadValue = PleromaApiFilterContextType.thread();
  static const accountValue = PleromaApiFilterContextType.account();

  static const values = [
    homeValue,
    notificationsValue,
    publicValue,
    threadValue,
    accountValue,
  ];

  const factory PleromaApiFilterContextType.home({
    @Default(PleromaApiFilterContextType.homeStringValue) String stringValue,
  }) = _Home;

  const factory PleromaApiFilterContextType.notifications({
    @Default(PleromaApiFilterContextType.notificationsStringValue)
        String stringValue,
  }) = _Notifications;

  const factory PleromaApiFilterContextType.public({
    @Default(PleromaApiFilterContextType.publicStringValue) String stringValue,
  }) = _Public;

  const factory PleromaApiFilterContextType.thread({
    @Default(PleromaApiFilterContextType.threadStringValue) String stringValue,
  }) = _Thread;

  const factory PleromaApiFilterContextType.account({
    @Default(PleromaApiFilterContextType.accountStringValue) String stringValue,
  }) = _Account;

  const factory PleromaApiFilterContextType.unknown({
    required String stringValue,
  }) = _Unknown;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static PleromaApiFilterContextType fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: (stringValue) =>
            PleromaApiFilterContextType.unknown(
          stringValue: stringValue,
        ),
      );
}

extension PleromaApiFilterContextTypeStringExtension on String {
  PleromaApiFilterContextType toPleromaApiFilterContextType() =>
      PleromaApiFilterContextType.fromStringValue(this);
}

extension PleromaApiFilterContextTypeStringListExtension on List<String> {
  List<PleromaApiFilterContextType> toPleromaApiFilterContextTypeList() =>
      map((stringValue) => stringValue.toPleromaApiFilterContextType())
          .toList();
}

extension PleromaApiFilterContextTypeMastodonExtension
    on PleromaApiFilterContextType {
  MastodonApiFilterContextType toMastodonApiFilterContextType() =>
      MastodonApiFilterContextType.fromStringValue(stringValue);
}

extension PleromaApiFilterContextTypeStringMastodonExtension
    on List<PleromaApiFilterContextType> {
  List<MastodonApiFilterContextType> toMastodonApiFilterContextTypeList() =>
      map((stringValue) => stringValue.toMastodonApiFilterContextType())
          .toList();
}

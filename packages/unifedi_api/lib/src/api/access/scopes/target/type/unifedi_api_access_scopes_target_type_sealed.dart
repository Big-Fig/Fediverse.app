import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../unifedi_api_model.dart';

part 'unifedi_api_access_scopes_target_type_sealed.freezed.dart';

// ignore_for_file: no-magic-number
@freezed
class UnifediApiAccessScopesTargetType
    with _$UnifediApiAccessScopesTargetType
    implements IUnifediApiUnion {
  static const accountsStringValue = 'accounts';
  static const blocksStringValue = 'blocks';
  static const bookmarksStringValue = 'bookmarks';
  static const conversationsStringValue = 'conversations';
  static const favouritesStringValue = 'favourites';
  static const searchStringValue = 'search';
  static const filtersStringValue = 'filters';
  static const followsStringValue = 'follows';
  static const listsStringValue = 'lists';
  static const mediaStringValue = 'media';
  static const mutesStringValue = 'mutes';
  static const notificationsStringValue = 'notifications';
  static const reportsStringValue = 'reports';
  static const statusesStringValue = 'statuses';

  static const accountsValue = UnifediApiAccessScopesTargetType.accounts();
  static const blocksValue = UnifediApiAccessScopesTargetType.blocks();
  static const bookmarksValue = UnifediApiAccessScopesTargetType.bookmarks();
  static const conversationsValue =
      UnifediApiAccessScopesTargetType.conversations();
  static const favouritesValue = UnifediApiAccessScopesTargetType.favourites();
  static const searchValue = UnifediApiAccessScopesTargetType.search();
  static const filtersValue = UnifediApiAccessScopesTargetType.filters();
  static const followsValue = UnifediApiAccessScopesTargetType.follows();
  static const listsValue = UnifediApiAccessScopesTargetType.lists();
  static const mediaValue = UnifediApiAccessScopesTargetType.media();
  static const mutesValue = UnifediApiAccessScopesTargetType.mutes();
  static const notificationsValue =
      UnifediApiAccessScopesTargetType.notifications();
  static const reportsValue = UnifediApiAccessScopesTargetType.reports();
  static const statusesValue = UnifediApiAccessScopesTargetType.statuses();

  static const values = [
    accountsValue,
    blocksValue,
    bookmarksValue,
    favouritesValue,
    searchValue,
    filtersValue,
    followsValue,
    listsValue,
    mediaValue,
    mutesValue,
    notificationsValue,
    reportsValue,
    statusesValue,
  ];

  const factory UnifediApiAccessScopesTargetType.accounts({
    @Default(UnifediApiAccessScopesTargetType.accountsStringValue)
        String stringValue,
  }) = _Accounts;

  const factory UnifediApiAccessScopesTargetType.blocks({
    @Default(UnifediApiAccessScopesTargetType.blocksStringValue)
        String stringValue,
  }) = _Blocks;

  const factory UnifediApiAccessScopesTargetType.bookmarks({
    @Default(UnifediApiAccessScopesTargetType.bookmarksStringValue)
        String stringValue,
  }) = _Valid;

  const factory UnifediApiAccessScopesTargetType.conversations({
    @Default(UnifediApiAccessScopesTargetType.conversationsStringValue)
        String stringValue,
  }) = _Conversations;

  const factory UnifediApiAccessScopesTargetType.favourites({
    @Default(UnifediApiAccessScopesTargetType.favouritesStringValue)
        String stringValue,
  }) = _Favourites;

  const factory UnifediApiAccessScopesTargetType.search({
    @Default(UnifediApiAccessScopesTargetType.searchStringValue)
        String stringValue,
  }) = _Search;

  const factory UnifediApiAccessScopesTargetType.follows({
    @Default(UnifediApiAccessScopesTargetType.followsStringValue)
        String stringValue,
  }) = _Follows;

  const factory UnifediApiAccessScopesTargetType.filters({
    @Default(UnifediApiAccessScopesTargetType.favouritesStringValue)
        String stringValue,
  }) = _Filters;

  const factory UnifediApiAccessScopesTargetType.lists({
    @Default(UnifediApiAccessScopesTargetType.listsStringValue)
        String stringValue,
  }) = _Lists;

  const factory UnifediApiAccessScopesTargetType.media({
    @Default(UnifediApiAccessScopesTargetType.mediaStringValue)
        String stringValue,
  }) = _Media;

  const factory UnifediApiAccessScopesTargetType.mutes({
    @Default(UnifediApiAccessScopesTargetType.mutesStringValue)
        String stringValue,
  }) = _Mutes;

  const factory UnifediApiAccessScopesTargetType.notifications({
    @Default(UnifediApiAccessScopesTargetType.notificationsStringValue)
        String stringValue,
  }) = _Notifications;

  const factory UnifediApiAccessScopesTargetType.reports({
    @Default(UnifediApiAccessScopesTargetType.reportsStringValue)
        String stringValue,
  }) = _Reports;

  const factory UnifediApiAccessScopesTargetType.statuses({
    @Default(UnifediApiAccessScopesTargetType.statusesStringValue)
        String stringValue,
  }) = _Statuses;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static UnifediApiAccessScopesTargetType fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: null,
      );
}

extension UnifediApiAccessScopesTargetTypeStringExtension on String {
  UnifediApiAccessScopesTargetType toUnifediApiAccessScopesTargetType() =>
      UnifediApiAccessScopesTargetType.fromStringValue(this);
}

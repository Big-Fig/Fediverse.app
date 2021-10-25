import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../../pleroma_api_model.dart';

part 'pleroma_api_access_scopes_target_type_sealed.freezed.dart';

// ignore_for_file: no-magic-number
@freezed
class PleromaApiAccessScopesTargetType
    with _$PleromaApiAccessScopesTargetType
    implements IPleromaApiUnion {
  static const accountsStringValue =
      MastodonApiAccessScopesTargetType.accountsStringValue;
  static const blocksStringValue =
      MastodonApiAccessScopesTargetType.blocksStringValue;
  static const bookmarksStringValue =
      MastodonApiAccessScopesTargetType.bookmarksStringValue;
  static const conversationsStringValue =
      MastodonApiAccessScopesTargetType.conversationsStringValue;
  static const favouritesStringValue =
      MastodonApiAccessScopesTargetType.favouritesStringValue;
  static const searchStringValue =
      MastodonApiAccessScopesTargetType.searchStringValue;
  static const filtersStringValue =
      MastodonApiAccessScopesTargetType.filtersStringValue;
  static const followsStringValue =
      MastodonApiAccessScopesTargetType.followsStringValue;
  static const listsStringValue =
      MastodonApiAccessScopesTargetType.listsStringValue;
  static const mediaStringValue =
      MastodonApiAccessScopesTargetType.mediaStringValue;
  static const mutesStringValue =
      MastodonApiAccessScopesTargetType.mutesStringValue;
  static const notificationsStringValue =
      MastodonApiAccessScopesTargetType.notificationsStringValue;
  static const reportsStringValue =
      MastodonApiAccessScopesTargetType.reportsStringValue;
  static const statusesStringValue =
      MastodonApiAccessScopesTargetType.statusesStringValue;

  static const accountsValue = PleromaApiAccessScopesTargetType.accounts();
  static const blocksValue = PleromaApiAccessScopesTargetType.blocks();
  static const bookmarksValue = PleromaApiAccessScopesTargetType.bookmarks();
  static const conversationsValue =
      PleromaApiAccessScopesTargetType.conversations();
  static const favouritesValue = PleromaApiAccessScopesTargetType.favourites();
  static const searchValue = PleromaApiAccessScopesTargetType.search();
  static const filtersValue = PleromaApiAccessScopesTargetType.filters();
  static const followsValue = PleromaApiAccessScopesTargetType.follows();
  static const listsValue = PleromaApiAccessScopesTargetType.lists();
  static const mediaValue = PleromaApiAccessScopesTargetType.media();
  static const mutesValue = PleromaApiAccessScopesTargetType.mutes();
  static const notificationsValue =
      PleromaApiAccessScopesTargetType.notifications();
  static const reportsValue = PleromaApiAccessScopesTargetType.reports();
  static const statusesValue = PleromaApiAccessScopesTargetType.statuses();

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

  const factory PleromaApiAccessScopesTargetType.accounts({
    @Default(PleromaApiAccessScopesTargetType.accountsStringValue)
        String stringValue,
  }) = _Accounts;

  const factory PleromaApiAccessScopesTargetType.blocks({
    @Default(PleromaApiAccessScopesTargetType.blocksStringValue)
        String stringValue,
  }) = _Blocks;

  const factory PleromaApiAccessScopesTargetType.bookmarks({
    @Default(PleromaApiAccessScopesTargetType.bookmarksStringValue)
        String stringValue,
  }) = _Valid;

  const factory PleromaApiAccessScopesTargetType.conversations({
    @Default(PleromaApiAccessScopesTargetType.conversationsStringValue)
        String stringValue,
  }) = _Conversations;

  const factory PleromaApiAccessScopesTargetType.favourites({
    @Default(PleromaApiAccessScopesTargetType.favouritesStringValue)
        String stringValue,
  }) = _Favourites;
  const factory PleromaApiAccessScopesTargetType.search({
    @Default(PleromaApiAccessScopesTargetType.searchStringValue)
        String stringValue,
  }) = _Search;

  const factory PleromaApiAccessScopesTargetType.follows({
    @Default(PleromaApiAccessScopesTargetType.followsStringValue)
        String stringValue,
  }) = _Follows;

  const factory PleromaApiAccessScopesTargetType.filters({
    @Default(PleromaApiAccessScopesTargetType.favouritesStringValue)
        String stringValue,
  }) = _Filters;

  const factory PleromaApiAccessScopesTargetType.lists({
    @Default(PleromaApiAccessScopesTargetType.listsStringValue)
        String stringValue,
  }) = _Lists;

  const factory PleromaApiAccessScopesTargetType.media({
    @Default(PleromaApiAccessScopesTargetType.mediaStringValue)
        String stringValue,
  }) = _Media;

  const factory PleromaApiAccessScopesTargetType.mutes({
    @Default(PleromaApiAccessScopesTargetType.mutesStringValue)
        String stringValue,
  }) = _Mutes;

  const factory PleromaApiAccessScopesTargetType.notifications({
    @Default(PleromaApiAccessScopesTargetType.notificationsStringValue)
        String stringValue,
  }) = _Notifications;

  const factory PleromaApiAccessScopesTargetType.reports({
    @Default(PleromaApiAccessScopesTargetType.reportsStringValue)
        String stringValue,
  }) = _Reports;

  const factory PleromaApiAccessScopesTargetType.statuses({
    @Default(PleromaApiAccessScopesTargetType.statusesStringValue)
        String stringValue,
  }) = _Statuses;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static PleromaApiAccessScopesTargetType fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: null,
      );
}

extension PleromaApiAccessScopesTargetTypeStringExtension on String {
  PleromaApiAccessScopesTargetType toPleromaApiAccessScopesTargetType() =>
      PleromaApiAccessScopesTargetType.fromStringValue(this);
}

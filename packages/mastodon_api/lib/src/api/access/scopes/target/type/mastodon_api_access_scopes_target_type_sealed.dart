import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../mastodon_api_model.dart';

part 'mastodon_api_access_scopes_target_type_sealed.freezed.dart';

// ignore_for_file: no-magic-number
@freezed
class MastodonApiAccessScopesTargetType
    with _$MastodonApiAccessScopesTargetType
    implements IMastodonApiUnion {
  static const accountsStringValue = 'accounts';
  static const blocksStringValue = 'blocks';
  static const bookmarksStringValue = 'bookmarks';
  static const conversationsStringValue = 'conversations';
  static const favouritesStringValue = 'favourites';
  static const searchStringValue = 'favourites';
  static const filtersStringValue = 'filters';
  static const followsStringValue = 'follows';
  static const listsStringValue = 'lists';
  static const mediaStringValue = 'media';
  static const mutesStringValue = 'mutes';
  static const notificationsStringValue = 'notifications';
  static const reportsStringValue = 'reports';
  static const statusesStringValue = 'statuses';

  static const accountsValue = MastodonApiAccessScopesTargetType.accounts();
  static const blocksValue = MastodonApiAccessScopesTargetType.blocks();
  static const bookmarksValue = MastodonApiAccessScopesTargetType.bookmarks();
  static const conversationsValue =
      MastodonApiAccessScopesTargetType.conversations();
  static const favouritesValue = MastodonApiAccessScopesTargetType.favourites();
  static const searchValue = MastodonApiAccessScopesTargetType.search();
  static const filtersValue = MastodonApiAccessScopesTargetType.filters();
  static const followsValue = MastodonApiAccessScopesTargetType.follows();
  static const listsValue = MastodonApiAccessScopesTargetType.lists();
  static const mediaValue = MastodonApiAccessScopesTargetType.media();
  static const mutesValue = MastodonApiAccessScopesTargetType.mutes();
  static const notificationsValue =
      MastodonApiAccessScopesTargetType.notifications();
  static const reportsValue = MastodonApiAccessScopesTargetType.reports();
  static const statusesValue = MastodonApiAccessScopesTargetType.statuses();

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

  const factory MastodonApiAccessScopesTargetType.accounts({
    @Default(MastodonApiAccessScopesTargetType.accountsStringValue)
        String stringValue,
  }) = _Accounts;

  const factory MastodonApiAccessScopesTargetType.blocks({
    @Default(MastodonApiAccessScopesTargetType.blocksStringValue)
        String stringValue,
  }) = _Blocks;

  const factory MastodonApiAccessScopesTargetType.bookmarks({
    @Default(MastodonApiAccessScopesTargetType.bookmarksStringValue)
        String stringValue,
  }) = _Valid;

  const factory MastodonApiAccessScopesTargetType.conversations({
    @Default(MastodonApiAccessScopesTargetType.conversationsStringValue)
        String stringValue,
  }) = _Conversations;

  const factory MastodonApiAccessScopesTargetType.favourites({
    @Default(MastodonApiAccessScopesTargetType.favouritesStringValue)
        String stringValue,
  }) = _Favourites;

  const factory MastodonApiAccessScopesTargetType.search({
    @Default(MastodonApiAccessScopesTargetType.searchStringValue)
        String stringValue,
  }) = _Search;

  const factory MastodonApiAccessScopesTargetType.follows({
    @Default(MastodonApiAccessScopesTargetType.followsStringValue)
        String stringValue,
  }) = _Follows;

  const factory MastodonApiAccessScopesTargetType.filters({
    @Default(MastodonApiAccessScopesTargetType.favouritesStringValue)
        String stringValue,
  }) = _Filters;

  const factory MastodonApiAccessScopesTargetType.lists({
    @Default(MastodonApiAccessScopesTargetType.listsStringValue)
        String stringValue,
  }) = _Lists;

  const factory MastodonApiAccessScopesTargetType.media({
    @Default(MastodonApiAccessScopesTargetType.mediaStringValue)
        String stringValue,
  }) = _Media;

  const factory MastodonApiAccessScopesTargetType.mutes({
    @Default(MastodonApiAccessScopesTargetType.mutesStringValue)
        String stringValue,
  }) = _Mutes;

  const factory MastodonApiAccessScopesTargetType.notifications({
    @Default(MastodonApiAccessScopesTargetType.notificationsStringValue)
        String stringValue,
  }) = _Notifications;

  const factory MastodonApiAccessScopesTargetType.reports({
    @Default(MastodonApiAccessScopesTargetType.reportsStringValue)
        String stringValue,
  }) = _Reports;

  const factory MastodonApiAccessScopesTargetType.statuses({
    @Default(MastodonApiAccessScopesTargetType.statusesStringValue)
        String stringValue,
  }) = _Statuses;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static MastodonApiAccessScopesTargetType fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: null,
      );
}

extension MastodonApiAccessScopesTargetTypeStringExtension on String {
  MastodonApiAccessScopesTargetType toMastodonApiAccessScopesTargetType() =>
      MastodonApiAccessScopesTargetType.fromStringValue(this);
}

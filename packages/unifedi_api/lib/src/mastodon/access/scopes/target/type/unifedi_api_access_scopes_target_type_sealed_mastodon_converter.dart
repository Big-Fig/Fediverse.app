import 'package:mastodon_api/mastodon_api.dart';
import '../../../../../api/access/scopes/target/type/unifedi_api_access_scopes_target_type_sealed.dart';
import '../../../../../converter/sealed_converter.dart';

const _converter = UnifediApiAccessScopesTargetTypeMastodonConverter();

class UnifediApiAccessScopesTargetTypeMastodonConverter
    implements
        SealedConverter<UnifediApiAccessScopesTargetType,
            MastodonApiAccessScopesTargetType> {
  const UnifediApiAccessScopesTargetTypeMastodonConverter();

  @override
  UnifediApiAccessScopesTargetType convertFrom(
    MastodonApiAccessScopesTargetType item,
  ) =>
      item.map(
        accounts: (_) => UnifediApiAccessScopesTargetType.accountsValue,
        blocks: (_) => UnifediApiAccessScopesTargetType.blocksValue,
        bookmarks: (_) => UnifediApiAccessScopesTargetType.bookmarksValue,
        conversations: (_) =>
            UnifediApiAccessScopesTargetType.conversationsValue,
        favourites: (_) => UnifediApiAccessScopesTargetType.favouritesValue,
        search: (_) => UnifediApiAccessScopesTargetType.searchValue,
        filters: (_) => UnifediApiAccessScopesTargetType.filtersValue,
        follows: (_) => UnifediApiAccessScopesTargetType.followsValue,
        lists: (_) => UnifediApiAccessScopesTargetType.listsValue,
        media: (_) => UnifediApiAccessScopesTargetType.mediaValue,
        mutes: (_) => UnifediApiAccessScopesTargetType.mutesValue,
        notifications: (_) =>
            UnifediApiAccessScopesTargetType.notificationsValue,
        reports: (_) => UnifediApiAccessScopesTargetType.reportsValue,
        statuses: (_) => UnifediApiAccessScopesTargetType.statusesValue,
      );

  @override
  MastodonApiAccessScopesTargetType convertTo(
    UnifediApiAccessScopesTargetType item,
  ) =>
      item.map(
        accounts: (_) => MastodonApiAccessScopesTargetType.accountsValue,
        blocks: (_) => MastodonApiAccessScopesTargetType.blocksValue,
        bookmarks: (_) => MastodonApiAccessScopesTargetType.bookmarksValue,
        conversations: (_) =>
            MastodonApiAccessScopesTargetType.conversationsValue,
        favourites: (_) => MastodonApiAccessScopesTargetType.favouritesValue,
        search: (_) => MastodonApiAccessScopesTargetType.searchValue,
        filters: (_) => MastodonApiAccessScopesTargetType.filtersValue,
        follows: (_) => MastodonApiAccessScopesTargetType.followsValue,
        lists: (_) => MastodonApiAccessScopesTargetType.listsValue,
        media: (_) => MastodonApiAccessScopesTargetType.mediaValue,
        mutes: (_) => MastodonApiAccessScopesTargetType.mutesValue,
        notifications: (_) =>
            MastodonApiAccessScopesTargetType.notificationsValue,
        reports: (_) => MastodonApiAccessScopesTargetType.reportsValue,
        statuses: (_) => MastodonApiAccessScopesTargetType.statusesValue,
      );
}

extension MastodonApiAccessScopesTargetTypeUnifediExtension
    on MastodonApiAccessScopesTargetType {
  UnifediApiAccessScopesTargetType toUnifediApiAccessScopesTargetType() =>
      _converter.convertFrom(this);
}

extension UnifediApiAccessScopesTargetTypeMastodonExtension
    on UnifediApiAccessScopesTargetType {
  MastodonApiAccessScopesTargetType toMastodonApiAccessScopesTargetType() =>
      _converter.convertTo(this);
}

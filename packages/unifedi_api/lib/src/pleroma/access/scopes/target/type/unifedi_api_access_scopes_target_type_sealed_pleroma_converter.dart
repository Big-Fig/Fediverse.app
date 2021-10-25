import 'package:pleroma_api/pleroma_api.dart';
import '../../../../../api/access/scopes/target/type/unifedi_api_access_scopes_target_type_sealed.dart';
import '../../../../../converter/sealed_converter.dart';

const _converter = UnifediApiAccessScopesTargetTypePleromaConverter();

class UnifediApiAccessScopesTargetTypePleromaConverter
    implements
        SealedConverter<UnifediApiAccessScopesTargetType,
            PleromaApiAccessScopesTargetType> {
  const UnifediApiAccessScopesTargetTypePleromaConverter();

  @override
  UnifediApiAccessScopesTargetType convertFrom(
    PleromaApiAccessScopesTargetType item,
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
  PleromaApiAccessScopesTargetType convertTo(
    UnifediApiAccessScopesTargetType item,
  ) =>
      item.map(
        accounts: (_) => PleromaApiAccessScopesTargetType.accountsValue,
        blocks: (_) => PleromaApiAccessScopesTargetType.blocksValue,
        bookmarks: (_) => PleromaApiAccessScopesTargetType.bookmarksValue,
        conversations: (_) =>
            PleromaApiAccessScopesTargetType.conversationsValue,
        favourites: (_) => PleromaApiAccessScopesTargetType.favouritesValue,
        search: (_) => PleromaApiAccessScopesTargetType.searchValue,
        filters: (_) => PleromaApiAccessScopesTargetType.filtersValue,
        follows: (_) => PleromaApiAccessScopesTargetType.followsValue,
        lists: (_) => PleromaApiAccessScopesTargetType.listsValue,
        media: (_) => PleromaApiAccessScopesTargetType.mediaValue,
        mutes: (_) => PleromaApiAccessScopesTargetType.mutesValue,
        notifications: (_) =>
            PleromaApiAccessScopesTargetType.notificationsValue,
        reports: (_) => PleromaApiAccessScopesTargetType.reportsValue,
        statuses: (_) => PleromaApiAccessScopesTargetType.statusesValue,
      );
}

extension PleromaApiAccessScopesTargetTypeUnifediExtension
    on PleromaApiAccessScopesTargetType {
  UnifediApiAccessScopesTargetType toUnifediApiAccessScopesTargetType() =>
      _converter.convertFrom(this);
}

extension UnifediApiAccessScopesTargetTypePleromaExtension
    on UnifediApiAccessScopesTargetType {
  PleromaApiAccessScopesTargetType toPleromaApiAccessScopesTargetType() =>
      _converter.convertTo(this);
}

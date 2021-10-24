import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/unifedi/unifedi_chat_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moor/moor.dart' as moor;

part 'account_repository_model.freezed.dart';

@freezed
class AccountRepositoryFilters with _$AccountRepositoryFilters {
  static final AccountRepositoryFilters empty = AccountRepositoryFilters.only();

  const AccountRepositoryFilters._();

  const factory AccountRepositoryFilters({
    required IConversationChat? onlyInConversation,
    required IUnifediChat? onlyInChat,
    required IStatus? onlyInStatusRebloggedBy,
    required IStatus? onlyInStatusFavouritedBy,
    required IAccount? onlyInAccountFollowers,
    required IAccount? onlyInAccountFollowing,
    required String? searchQuery,
  }) = _AccountRepositoryFilters;

  // ignore: long-parameter-list
  static AccountRepositoryFilters only({
    IConversationChat? onlyInConversation,
    IUnifediChat? onlyInChat,
    IStatus? onlyInStatusRebloggedBy,
    IStatus? onlyInStatusFavouritedBy,
    IAccount? onlyInAccountFollowers,
    IAccount? onlyInAccountFollowing,
    String? searchQuery,
  }) =>
      AccountRepositoryFilters(
        onlyInConversation: onlyInConversation,
        onlyInChat: onlyInChat,
        onlyInStatusRebloggedBy: onlyInStatusRebloggedBy,
        onlyInStatusFavouritedBy: onlyInStatusFavouritedBy,
        onlyInAccountFollowers: onlyInAccountFollowers,
        onlyInAccountFollowing: onlyInAccountFollowing,
        searchQuery: searchQuery,
      );

  static AccountRepositoryFilters createForOnlyInConversation({
    required IConversationChat conversation,
  }) =>
      AccountRepositoryFilters.only(
        onlyInConversation: conversation,
      );

  static AccountRepositoryFilters createForOnlyInChat({
    required IUnifediChat chat,
  }) =>
      AccountRepositoryFilters.only(
        onlyInChat: chat,
      );
}

enum AccountOrderType {
  remoteId,
}

@freezed
class AccountRepositoryOrderingTermData
    with _$AccountRepositoryOrderingTermData
    implements RepositoryOrderingTerm {
  const AccountRepositoryOrderingTermData._();

  const factory AccountRepositoryOrderingTermData({
    required AccountOrderType orderType,
    required moor.OrderingMode orderingMode,
  }) = _AccountRepositoryOrderingTermData;

  static const AccountRepositoryOrderingTermData remoteIdDesc =
      AccountRepositoryOrderingTermData(
    orderingMode: moor.OrderingMode.desc,
    orderType: AccountOrderType.remoteId,
  );
  static const AccountRepositoryOrderingTermData remoteIdAsc =
      AccountRepositoryOrderingTermData(
    orderingMode: moor.OrderingMode.asc,
    orderType: AccountOrderType.remoteId,
  );

  static const List<AccountRepositoryOrderingTermData> defaultTerms = [
    remoteIdDesc,
  ];
}

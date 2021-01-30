import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:moor/moor.dart';

class AccountRepositoryFilters {
  final IConversationChat onlyInConversation;
  final IPleromaChat onlyInChat;
  final IStatus onlyInStatusRebloggedBy;
  final IStatus onlyInStatusFavouritedBy;
  final IAccount onlyInAccountFollowers;
  final IAccount onlyInAccountFollowing;
  final String searchQuery;

  AccountRepositoryFilters({
    this.onlyInConversation,
    this.onlyInChat,
    this.onlyInStatusRebloggedBy,
    this.onlyInStatusFavouritedBy,
    this.onlyInAccountFollowers,
    this.onlyInAccountFollowing,
    this.searchQuery,
  });

  static AccountRepositoryFilters createForOnlyInConversation({
    @required IConversationChat conversation,
  }) =>
      AccountRepositoryFilters(
        onlyInConversation: conversation,
      );

  static AccountRepositoryFilters createForOnlyInChat({
    @required IPleromaChat chat,
  }) =>
      AccountRepositoryFilters(
        onlyInChat: chat,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountRepositoryFilters &&
          runtimeType == other.runtimeType &&
          onlyInConversation == other.onlyInConversation &&
          onlyInChat == other.onlyInChat &&
          onlyInStatusRebloggedBy == other.onlyInStatusRebloggedBy &&
          onlyInStatusFavouritedBy == other.onlyInStatusFavouritedBy &&
          onlyInAccountFollowers == other.onlyInAccountFollowers &&
          onlyInAccountFollowing == other.onlyInAccountFollowing &&
          searchQuery == other.searchQuery;

  @override
  int get hashCode =>
      onlyInConversation.hashCode ^
      onlyInChat.hashCode ^
      onlyInStatusRebloggedBy.hashCode ^
      onlyInStatusFavouritedBy.hashCode ^
      onlyInAccountFollowers.hashCode ^
      onlyInAccountFollowing.hashCode ^
      searchQuery.hashCode;

  @override
  String toString() {
    return 'AccountRepositoryFilters{'
        'onlyInConversation: $onlyInConversation, '
        'onlyInChat: $onlyInChat, '
        'onlyInStatusRebloggedBy: $onlyInStatusRebloggedBy, '
        'onlyInStatusFavouritedBy: $onlyInStatusFavouritedBy, '
        'onlyInAccountFollowers: $onlyInAccountFollowers, '
        'onlyInAccountFollowing: $onlyInAccountFollowing, '
        'searchQuery: $searchQuery'
        '}';
  }
}

enum AccountOrderType {
  remoteId,
}

class AccountRepositoryOrderingTermData {
  final AccountOrderType orderType;
  final OrderingMode orderingMode;

  static const AccountRepositoryOrderingTermData remoteIdDesc =
      AccountRepositoryOrderingTermData(
    orderingMode: OrderingMode.desc,
    orderType: AccountOrderType.remoteId,
  );
  static const AccountRepositoryOrderingTermData remoteIdAsc =
      AccountRepositoryOrderingTermData(
    orderingMode: OrderingMode.asc,
    orderType: AccountOrderType.remoteId,
  );

  const AccountRepositoryOrderingTermData({
    @required this.orderType,
    @required this.orderingMode,
  });

  @override
  String toString() {
    return 'AccountOrderingTermData{'
        'orderByType: $orderType, '
        'orderingMode: $orderingMode'
        '}';
  }
}

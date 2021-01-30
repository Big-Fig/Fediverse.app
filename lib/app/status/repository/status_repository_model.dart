import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:moor/moor.dart';

class StatusRepositoryFilters {
  final String onlyInListWithRemoteId;
  final String onlyWithHashtag;
  final IAccount onlyFromAccountsFollowingByAccount;
  final IAccount onlyFromAccount;
  final IConversationChat onlyInConversation;
  final StatusOnlyLocalCondition onlyLocalCondition;
  final bool onlyWithMedia;
  final bool withMuted;
  final List<PleromaVisibility> excludeVisibilities;
  final bool onlyNoNsfwSensitive;
  final bool onlyNoReplies;
  final bool isFromHomeTimeline;
  final bool onlyFavourited;
  final bool onlyBookmarked;
  final List<StatusTextCondition> excludeTextConditions;
  final bool onlyNotDeleted;
  final bool forceJoinConversation;

  StatusRepositoryFilters({
    this.onlyInListWithRemoteId,
    this.onlyWithHashtag,
    this.onlyFromAccountsFollowingByAccount,
    this.onlyFromAccount,
    this.onlyInConversation,
    this.onlyLocalCondition,
    this.onlyWithMedia,
    this.withMuted,
    this.excludeVisibilities,
    this.onlyNoNsfwSensitive,
    this.onlyNoReplies,
    this.isFromHomeTimeline,
    this.onlyFavourited,
    this.onlyBookmarked,
    this.excludeTextConditions,
    this.onlyNotDeleted = true,
    this.forceJoinConversation = false,
  });

  static StatusRepositoryFilters createForOnlyInConversation({
    @required IConversationChat conversation,
  }) =>
      StatusRepositoryFilters(
        onlyInConversation: conversation,
      );

  static StatusRepositoryFilters createForForceJoinConversations() =>
      StatusRepositoryFilters(
        forceJoinConversation: true,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatusRepositoryFilters &&
          runtimeType == other.runtimeType &&
          onlyInListWithRemoteId == other.onlyInListWithRemoteId &&
          onlyWithHashtag == other.onlyWithHashtag &&
          onlyFromAccountsFollowingByAccount ==
              other.onlyFromAccountsFollowingByAccount &&
          onlyFromAccount == other.onlyFromAccount &&
          onlyInConversation == other.onlyInConversation &&
          onlyLocalCondition == other.onlyLocalCondition &&
          onlyWithMedia == other.onlyWithMedia &&
          withMuted == other.withMuted &&
          excludeVisibilities == other.excludeVisibilities &&
          onlyNoNsfwSensitive == other.onlyNoNsfwSensitive &&
          onlyNoReplies == other.onlyNoReplies &&
          isFromHomeTimeline == other.isFromHomeTimeline &&
          onlyFavourited == other.onlyFavourited &&
          onlyBookmarked == other.onlyBookmarked &&
          excludeTextConditions == other.excludeTextConditions &&
          forceJoinConversation == other.forceJoinConversation &&
          onlyNotDeleted == other.onlyNotDeleted;

  @override
  int get hashCode =>
      onlyInListWithRemoteId.hashCode ^
      onlyWithHashtag.hashCode ^
      onlyFromAccountsFollowingByAccount.hashCode ^
      onlyFromAccount.hashCode ^
      onlyInConversation.hashCode ^
      onlyLocalCondition.hashCode ^
      onlyWithMedia.hashCode ^
      withMuted.hashCode ^
      excludeVisibilities.hashCode ^
      onlyNoNsfwSensitive.hashCode ^
      onlyNoReplies.hashCode ^
      isFromHomeTimeline.hashCode ^
      onlyFavourited.hashCode ^
      onlyBookmarked.hashCode ^
      excludeTextConditions.hashCode ^
      forceJoinConversation.hashCode ^
      onlyNotDeleted.hashCode;

  @override
  String toString() {
    return 'StatusRepositoryFilters{'
        'onlyInListWithRemoteId: $onlyInListWithRemoteId,'
        ' onlyWithHashtag: $onlyWithHashtag,'
        ' onlyFromAccountsFollowingByAccount:'
        ' $onlyFromAccountsFollowingByAccount,'
        ' onlyFromAccount: $onlyFromAccount,'
        ' onlyInConversation: $onlyInConversation,'
        ' onlyLocalCondition: $onlyLocalCondition,'
        ' onlyWithMedia: $onlyWithMedia,'
        ' withMuted: $withMuted,'
        ' excludeVisibilities: $excludeVisibilities,'
        ' onlyNoNsfwSensitive: $onlyNoNsfwSensitive,'
        ' onlyNoReplies: $onlyNoReplies,'
        ' isFromHomeTimeline: $isFromHomeTimeline,'
        ' onlyFavourited: $onlyFavourited,'
        ' onlyBookmarked: $onlyBookmarked,'
        ' forceJoinConversation: $forceJoinConversation,'
        ' excludeTextConditions: $excludeTextConditions,'
        ' onlyNotDeleted: $onlyNotDeleted'
        '}';
  }
}

enum StatusRepositoryOrderType {
  remoteId,
}

class StatusRepositoryOrderingTermData {
  final StatusRepositoryOrderType orderByType;
  final OrderingMode orderingMode;

  static const StatusRepositoryOrderingTermData remoteIdDesc =
      StatusRepositoryOrderingTermData(
    orderingMode: OrderingMode.desc,
    orderByType: StatusRepositoryOrderType.remoteId,
  );
  static const StatusRepositoryOrderingTermData remoteIdAsc =
      StatusRepositoryOrderingTermData(
    orderingMode: OrderingMode.asc,
    orderByType: StatusRepositoryOrderType.remoteId,
  );

  const StatusRepositoryOrderingTermData({
    @required this.orderByType,
    @required this.orderingMode,
  });

  @override
  String toString() {
    return 'StatusRepositoryOrderingTermData{'
        'orderType: $orderByType, '
        'orderingMode: $orderingMode'
        '}';
  }
}

class StatusOnlyLocalCondition {
  final String localUrlHost;

  StatusOnlyLocalCondition(this.localUrlHost);

  @override
  String toString() {
    return 'StatusRepositoryOnlyLocalCondition{localUrlHost: $localUrlHost}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatusOnlyLocalCondition &&
          runtimeType == other.runtimeType &&
          localUrlHost == other.localUrlHost;

  @override
  int get hashCode => localUrlHost.hashCode;
}

class StatusTextCondition {
  final String phrase;
  final bool wholeWord;

  StatusTextCondition({
    @required this.phrase,
    @required this.wholeWord,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatusTextCondition &&
          runtimeType == other.runtimeType &&
          phrase == other.phrase &&
          wholeWord == other.wholeWord;

  @override
  int get hashCode => phrase.hashCode ^ wholeWord.hashCode;

  @override
  String toString() {
    return 'StatusRepositoryTextCondition{phrase: $phrase,'
        ' wholeWord: $wholeWord}';
  }
}

extension FilterStatusTextConditionAdapterExtension on IFilter {
  StatusTextCondition toStatusTextCondition() => StatusTextCondition(
        phrase: phrase,
        wholeWord: wholeWord,
      );
}

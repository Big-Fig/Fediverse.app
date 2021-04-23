import 'package:collection/collection.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/pleroma/api/timeline/pleroma_api_timeline_model.dart';
import 'package:fedi/pleroma/api/visibility/pleroma_api_visibility_model.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:moor/moor.dart';

Function eq = const ListEquality().equals;

class PleromaReplyVisibilityFilterCondition {
  final String? myAccountRemoteId;
  final PleromaApiReplyVisibilityFilter? replyVisibilityFilter;

  PleromaReplyVisibilityFilterCondition({
    required this.myAccountRemoteId,
    required this.replyVisibilityFilter,
  });

  @override
  String toString() => 'PleromaReplyVisibilityFilterCondition{'
      'myAccountRemoteId: $myAccountRemoteId, '
      'replyVisibilityFilter: $replyVisibilityFilter'
      '}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaReplyVisibilityFilterCondition &&
          runtimeType == other.runtimeType &&
          myAccountRemoteId == other.myAccountRemoteId &&
          replyVisibilityFilter == other.replyVisibilityFilter;

  @override
  int get hashCode =>
      myAccountRemoteId.hashCode ^ replyVisibilityFilter.hashCode;
}

class StatusRepositoryFilters {
  final String? onlyInListWithRemoteId;
  final String? onlyWithHashtag;
  final IAccount? onlyFromAccountsFollowingByAccount;
  final IAccount? onlyFromAccount;
  final IConversationChat? onlyInConversation;
  final StatusOnlyLocalCondition? onlyLocalCondition;
  final bool? onlyWithMedia;
  final bool? withMuted;
  final List<PleromaApiVisibility>? excludeVisibilities;
  final bool? onlyNoNsfwSensitive;
  final bool? onlyNoReplies;
  final bool? isFromHomeTimeline;
  final bool? onlyFavourited;
  final bool? onlyBookmarked;
  final List<StatusTextCondition>? excludeTextConditions;
  final bool onlyNotDeleted;
  final bool onlyNotHiddenLocallyOnDevice;
  final StatusOnlyRemoteCondition? onlyRemoteCondition;
  final bool mustBeConversationItem;
  final String? onlyFromInstance;
  final PleromaReplyVisibilityFilterCondition? replyVisibilityFilterCondition;
  final bool onlyPendingStatePublishedOrNull;

  static const StatusRepositoryFilters empty = StatusRepositoryFilters();

  const StatusRepositoryFilters({
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
    this.onlyFromInstance,
    this.replyVisibilityFilterCondition,
    this.onlyRemoteCondition,
    this.onlyNotDeleted = true,
    this.onlyNotHiddenLocallyOnDevice = true,
    this.mustBeConversationItem = false,
    this.onlyPendingStatePublishedOrNull = true,
  });

  static StatusRepositoryFilters createForOnlyInConversation({
    required IConversationChat? conversation,
    bool onlyPendingStatePublishedOrNull = true,
  }) =>
      StatusRepositoryFilters(
        onlyInConversation: conversation,
        onlyPendingStatePublishedOrNull: onlyPendingStatePublishedOrNull,
      );

  static StatusRepositoryFilters createForMustBeConversationItem({
    bool onlyPendingStatePublishedOrNull = true,
  }) =>
      StatusRepositoryFilters(
        mustBeConversationItem: true,
        onlyPendingStatePublishedOrNull: onlyPendingStatePublishedOrNull,
      );

  @override
  // ignore: code-metrics
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
          eq(excludeVisibilities, other.excludeVisibilities) &&
          onlyNoNsfwSensitive == other.onlyNoNsfwSensitive &&
          onlyNoReplies == other.onlyNoReplies &&
          isFromHomeTimeline == other.isFromHomeTimeline &&
          onlyFavourited == other.onlyFavourited &&
          onlyBookmarked == other.onlyBookmarked &&
          eq(excludeTextConditions, other.excludeTextConditions) &&
          mustBeConversationItem == other.mustBeConversationItem &&
          onlyFromInstance == other.onlyFromInstance &&
          replyVisibilityFilterCondition ==
              other.replyVisibilityFilterCondition &&
          onlyRemoteCondition == other.onlyRemoteCondition &&
          onlyNotHiddenLocallyOnDevice == other.onlyNotHiddenLocallyOnDevice &&
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
      onlyFromInstance.hashCode ^
      replyVisibilityFilterCondition.hashCode ^
      mustBeConversationItem.hashCode ^
      onlyRemoteCondition.hashCode ^
      onlyPendingStatePublishedOrNull.hashCode ^
      onlyNotHiddenLocallyOnDevice.hashCode ^
      onlyNotDeleted.hashCode;

  @override
  String toString() => 'StatusRepositoryFilters{'
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
      ' forceJoinConversation: $mustBeConversationItem,'
      ' excludeTextConditions: $excludeTextConditions,'
      ' onlyFromInstance: $onlyFromInstance,'
      ' onlyRemoteCondition: $onlyRemoteCondition,'
      ' replyVisibilityFilterCondition: $replyVisibilityFilterCondition,'
      ' onlyNotDeleted: $onlyNotDeleted'
      ' onlyNotHiddenLocallyOnDevice: $onlyNotHiddenLocallyOnDevice'
      ' onlyPendingStatePublishedOrNull: $onlyPendingStatePublishedOrNull'
      '}';
}

enum StatusRepositoryOrderType {
  remoteId,
  createdAt,
}

class StatusRepositoryOrderingTermData extends RepositoryOrderingTerm {
  final StatusRepositoryOrderType orderByType;
  @override
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

  static const StatusRepositoryOrderingTermData createdAtDesc =
      StatusRepositoryOrderingTermData(
    orderingMode: OrderingMode.desc,
    orderByType: StatusRepositoryOrderType.createdAt,
  );
  static const StatusRepositoryOrderingTermData createdAtAsc =
      StatusRepositoryOrderingTermData(
    orderingMode: OrderingMode.asc,
    orderByType: StatusRepositoryOrderType.createdAt,
  );

  static const List<StatusRepositoryOrderingTermData> defaultTerms = [
    createdAtDesc,
  ];

  const StatusRepositoryOrderingTermData({
    required this.orderByType,
    required this.orderingMode,
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
  final String? localUrlHost;

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

class StatusOnlyRemoteCondition {
  final String? localUrlHost;

  StatusOnlyRemoteCondition(this.localUrlHost);

  @override
  String toString() {
    return 'StatusOnlyRemoteCondition{localUrlHost: $localUrlHost}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatusOnlyRemoteCondition &&
          runtimeType == other.runtimeType &&
          localUrlHost == other.localUrlHost;

  @override
  int get hashCode => localUrlHost.hashCode;
}

class StatusTextCondition {
  final String phrase;
  final bool wholeWord;

  StatusTextCondition({
    required this.phrase,
    required this.wholeWord,
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

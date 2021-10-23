import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moor/moor.dart' as moor;
import 'package:unifedi_api/unifedi_api.dart';

part 'status_repository_model.freezed.dart';

@freezed
class UnifediApiReplyVisibilityFilterCondition
    with _$UnifediApiReplyVisibilityFilterCondition {
  const factory UnifediApiReplyVisibilityFilterCondition({
    required String? myAccountRemoteId,
    required UnifediApiReplyVisibilityFilter? replyVisibilityFilter,
  }) = _UnifediApiReplyVisibilityFilterCondition;
}

@freezed
class StatusRepositoryFilters with _$StatusRepositoryFilters {
  static final StatusRepositoryFilters empty = StatusRepositoryFilters.only();

  const StatusRepositoryFilters._();

  const factory StatusRepositoryFilters({
    required String? onlyInListWithRemoteId,
    required String? onlyWithHashtag,
    required IAccount? onlyFromAccountsFollowingByAccount,
    required IAccount? onlyFromAccount,
    required IConversationChat? onlyInConversation,
    required StatusOnlyLocalCondition? onlyLocalCondition,
    required bool? onlyWithMedia,
    required bool? withMuted,
    required List<UnifediApiVisibility>? excludeVisibilities,
    required bool? onlyNoNsfwSensitive,
    required bool? onlyNoReplies,
    required bool? isFromHomeTimeline,
    required bool? onlyFavourited,
    required bool? onlyBookmarked,
    required List<StatusTextCondition>? excludeTextConditions,
    @Default(true) bool onlyNotDeleted,
    @Default(true) bool onlyNotHiddenLocallyOnDevice,
    required StatusOnlyRemoteCondition? onlyRemoteCondition,
    @Default(false) bool mustBeConversationItem,
    required String? onlyFromInstance,
    required UnifediApiReplyVisibilityFilterCondition?
        replyVisibilityFilterCondition,
    @Default(true) bool onlyPendingStatePublishedOrNull,
  }) = _StatusRepositoryFilters;

  // ignore: long-parameter-list
  static StatusRepositoryFilters only({
    String? onlyInListWithRemoteId,
    String? onlyWithHashtag,
    IAccount? onlyFromAccountsFollowingByAccount,
    IAccount? onlyFromAccount,
    IConversationChat? onlyInConversation,
    StatusOnlyLocalCondition? onlyLocalCondition,
    bool? onlyWithMedia,
    bool? withMuted,
    List<UnifediApiVisibility>? excludeVisibilities,
    bool? onlyNoNsfwSensitive,
    bool? onlyNoReplies,
    bool? isFromHomeTimeline,
    bool? onlyFavourited,
    bool? onlyBookmarked,
    List<StatusTextCondition>? excludeTextConditions,
    bool onlyNotDeleted = true,
    bool onlyNotHiddenLocallyOnDevice = true,
    StatusOnlyRemoteCondition? onlyRemoteCondition,
    bool mustBeConversationItem = false,
    String? onlyFromInstance,
    UnifediApiReplyVisibilityFilterCondition? replyVisibilityFilterCondition,
    bool onlyPendingStatePublishedOrNull = true,
  }) =>
      StatusRepositoryFilters(
        onlyInListWithRemoteId: onlyInListWithRemoteId,
        onlyWithHashtag: onlyWithHashtag,
        onlyFromAccountsFollowingByAccount: onlyFromAccountsFollowingByAccount,
        onlyFromAccount: onlyFromAccount,
        onlyInConversation: onlyInConversation,
        onlyLocalCondition: onlyLocalCondition,
        onlyWithMedia: onlyWithMedia,
        withMuted: withMuted,
        excludeVisibilities: excludeVisibilities,
        onlyNoNsfwSensitive: onlyNoNsfwSensitive,
        onlyNoReplies: onlyNoReplies,
        isFromHomeTimeline: isFromHomeTimeline,
        onlyFavourited: onlyFavourited,
        onlyBookmarked: onlyBookmarked,
        excludeTextConditions: excludeTextConditions,
        onlyRemoteCondition: onlyRemoteCondition,
        onlyFromInstance: onlyFromInstance,
        replyVisibilityFilterCondition: replyVisibilityFilterCondition,
        onlyNotDeleted: onlyNotDeleted,
        onlyNotHiddenLocallyOnDevice: onlyNotHiddenLocallyOnDevice,
        mustBeConversationItem: mustBeConversationItem,
        onlyPendingStatePublishedOrNull: onlyPendingStatePublishedOrNull,
      );

  static StatusRepositoryFilters createForOnlyInConversation({
    required IConversationChat? conversation,
    bool onlyPendingStatePublishedOrNull = true,
  }) =>
      StatusRepositoryFilters.only(
        onlyInConversation: conversation,
        onlyPendingStatePublishedOrNull: onlyPendingStatePublishedOrNull,
      );

  static StatusRepositoryFilters createForMustBeConversationItem({
    bool onlyPendingStatePublishedOrNull = true,
  }) =>
      StatusRepositoryFilters.only(
        mustBeConversationItem: true,
        onlyPendingStatePublishedOrNull: onlyPendingStatePublishedOrNull,
      );
}

enum StatusRepositoryOrderType {
  remoteId,
  createdAt,
}

@freezed
class StatusRepositoryOrderingTermData
    with _$StatusRepositoryOrderingTermData
    implements RepositoryOrderingTerm {
  const factory StatusRepositoryOrderingTermData({
    required StatusRepositoryOrderType orderByType,
    required moor.OrderingMode orderingMode,
  }) = _StatusRepositoryOrderingTermData;

  static const List<StatusRepositoryOrderingTermData> defaultTerms = [
    createdAtDesc,
  ];

  static const StatusRepositoryOrderingTermData remoteIdDesc =
      StatusRepositoryOrderingTermData(
    orderingMode: moor.OrderingMode.desc,
    orderByType: StatusRepositoryOrderType.remoteId,
  );
  static const StatusRepositoryOrderingTermData remoteIdAsc =
      StatusRepositoryOrderingTermData(
    orderingMode: moor.OrderingMode.asc,
    orderByType: StatusRepositoryOrderType.remoteId,
  );

  static const StatusRepositoryOrderingTermData createdAtDesc =
      StatusRepositoryOrderingTermData(
    orderingMode: moor.OrderingMode.desc,
    orderByType: StatusRepositoryOrderType.createdAt,
  );
  static const StatusRepositoryOrderingTermData createdAtAsc =
      StatusRepositoryOrderingTermData(
    orderingMode: moor.OrderingMode.asc,
    orderByType: StatusRepositoryOrderType.createdAt,
  );
}

@freezed
class StatusOnlyLocalCondition with _$StatusOnlyLocalCondition {
  const factory StatusOnlyLocalCondition({
    required String? localUrlHost,
  }) = _StatusOnlyLocalCondition;
}

@freezed
class StatusOnlyRemoteCondition with _$StatusOnlyRemoteCondition {
  const factory StatusOnlyRemoteCondition({
    required String? localUrlHost,
  }) = _StatusOnlyRemoteCondition;
}

@freezed
class StatusTextCondition with _$StatusTextCondition {
  const factory StatusTextCondition({
    required String phrase,
    required bool wholeWord,
  }) = _StatusTextCondition;
}

extension FilterStatusTextConditionAdapterExtension on IFilter {
  StatusTextCondition toStatusTextCondition() => StatusTextCondition(
        phrase: phrase,
        wholeWord: wholeWord,
      );
}

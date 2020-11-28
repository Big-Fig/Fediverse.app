import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/statuses/account_statuses_cached_list_bloc_impl.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/repository/status_repository_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/web_sockets/settings/web_sockets_settings_bloc.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/web_sockets/pleroma_web_sockets_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("account_statuses_media_only_cached_list_bloc_impl.dart");

class AccountStatusesMediaOnlyCachedListBloc
    extends AccountStatusesCachedListBloc {
  AccountStatusesMediaOnlyCachedListBloc({
    @required IAccount account,
    @required IPleromaAccountService pleromaAccountService,
    @required IStatusRepository statusRepository,
    @required INotificationRepository notificationRepository,
    @required IConversationChatRepository conversationRepository,
    @required IPleromaWebSocketsService pleromaWebSocketsService,
    @required bool listenWebSocketsChanges,
    @required IPleromaChatNewMessagesHandlerBloc chatNewMessagesHandlerBloc,
    @required
        IConversationChatNewMessagesHandlerBloc
            conversationChatNewMessagesHandlerBloc,
  }) : super(
          account: account,
          pleromaAccountService: pleromaAccountService,
          statusRepository: statusRepository,
          notificationRepository: notificationRepository,
          conversationRepository: conversationRepository,
          pleromaWebSocketsService: pleromaWebSocketsService,
          listenWebSocketsChanges: listenWebSocketsChanges,
          chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc,
          conversationChatNewMessagesHandlerBloc:
              conversationChatNewMessagesHandlerBloc,
        );

  @override
  IPleromaApi get pleromaApi => pleromaAccountService;

  static AccountStatusesMediaOnlyCachedListBloc createFromContext(
      BuildContext context,
      {@required IAccount account}) {
    return AccountStatusesMediaOnlyCachedListBloc(
      account: account,
      pleromaAccountService: IPleromaAccountService.of(context, listen: false),
      statusRepository: IStatusRepository.of(context, listen: false),
      conversationRepository:
          IConversationChatRepository.of(context, listen: false),
      listenWebSocketsChanges: IWebSocketsSettingsBloc.of(context, listen: false)
          .isRealtimeWebSocketsEnabled,
      notificationRepository:
          INotificationRepository.of(context, listen: false),
      pleromaWebSocketsService:
          IPleromaWebSocketsService.of(context, listen: false),
      chatNewMessagesHandlerBloc:
          IPleromaChatNewMessagesHandlerBloc.of(context, listen: false),
      conversationChatNewMessagesHandlerBloc:
          IConversationChatNewMessagesHandlerBloc.of(context, listen: false),
    );
  }

  @override
  Future<List<IStatus>> loadLocalItems(
      {@required int limit,
      @required IStatus newerThan,
      @required IStatus olderThan}) async {
    var statuses = await statusRepository.getStatuses(
      onlyInListWithRemoteId: null,
      onlyWithHashtag: null,
      onlyFromAccountsFollowingByAccount: null,
      onlyLocal: null,
      onlyWithMedia: true,
      withMuted: false,
      excludeVisibilities: null,
      olderThanStatus: olderThan,
      newerThanStatus: newerThan,
      onlyNoNsfwSensitive: false,
      onlyNoReplies: false,
      onlyFromAccount: account,
      limit: limit,
      offset: null,
      orderingTermData: StatusOrderingTermData(
          orderingMode: OrderingMode.desc,
          orderByType: StatusOrderByType.remoteId),
      onlyInConversation: null,
      isFromHomeTimeline: null,
      onlyBookmarked: null,
      onlyFavourited: null,
    );

    return statuses;
  }

  @override
  Stream<List<IStatus>> watchLocalItemsNewerThanItem(IStatus item) {
    return statusRepository.watchStatuses(
      onlyInListWithRemoteId: null,
      onlyWithHashtag: null,
      onlyFromAccountsFollowingByAccount: null,
      onlyLocal: null,
      onlyWithMedia: true,
      withMuted: false,
      excludeVisibilities: null,
      olderThanStatus: null,
      newerThanStatus: item,
      onlyNoNsfwSensitive: false,
      onlyNoReplies: false,
      onlyFromAccount: account,
      limit: null,
      offset: null,
      orderingTermData: StatusOrderingTermData(
          orderingMode: OrderingMode.desc,
          orderByType: StatusOrderByType.remoteId),
      onlyInConversation: null,
      isFromHomeTimeline: null,
      onlyBookmarked: null,
      onlyFavourited: null,
    );
  }

  @override
  Future<bool> refreshItemsFromRemoteForPage(
      {@required int limit,
      @required IStatus newerThan,
      @required IStatus olderThan}) async {
    _logger.finest(() => "refreshItemsFromRemoteForPage \n"
        "\t limit=$limit"
        "\t newerThan=$newerThan"
        "\t olderThan=$olderThan");

    var remoteStatuses = await pleromaAccountService.getAccountStatuses(
        onlyWithMedia: true,
        accountRemoteId: account.remoteId,
        limit: limit,
        sinceId: newerThan?.remoteId,
        maxId: olderThan?.remoteId);

    if (remoteStatuses != null) {
      await statusRepository.upsertRemoteStatuses(remoteStatuses,
          listRemoteId: null, conversationRemoteId: null);

      return true;
    } else {
      _logger.severe(() => "error during refreshItemsFromRemoteForPage: "
          "statuses is null");
      return false;
    }
  }

  @override
  Stream<bool> get settingsChangedStream => Stream.empty();

  static Widget provideToContext(BuildContext context,
      {@required IAccount account, @required Widget child}) {
    return DisposableProvider<IStatusCachedListBloc>(
      create: (context) =>
          AccountStatusesMediaOnlyCachedListBloc.createFromContext(context,
              account: account),
      child: child,
    );
  }
}

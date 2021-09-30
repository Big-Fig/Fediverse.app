import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_rxdart/easy_dispose_rxdart.dart';
import 'package:fedi/app/access/current/context/init/current_access_context_init_bloc.dart';
import 'package:fedi/app/access/current/context/init/current_access_context_init_model.dart';
import 'package:fedi/app/access/current/current_access_bloc.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository.dart';
import 'package:fedi/app/filter/repository/filter_repository.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/notification/repository/notification_repository_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unifedi_api/unifedi_api.dart';

var _logger = Logger('current_access_context_init_bloc_impl.dart');

class CurrentUnifediApiAccessContextInitBloc extends AsyncInitLoadingBloc
    implements ICurrentUnifediApiAccessContextInitBloc {
  final IMyAccountBloc myAccountBloc;
  final IUnifediApiInstanceService unifediApiInstanceService;
  final IUnifediApiNotificationService pleromaNotificationService;
  final IUnifediApiChatService pleromaApiChatService;
  final IUnifediApiConversationService pleromaConversationService;
  final IUnifediApiFilterService unifediApiFilterService;
  final IFilterRepository filterRepository;
  final INotificationRepository notificationRepository;
  final IConversationChatRepository conversationChatRepository;
  final IPleromaChatRepository pleromaChatRepository;
  final ICurrentUnifediApiAccessBloc currentUnifediApiAccessBloc;
  final IConnectionService connectionService;

  CurrentUnifediApiAccessContextInitBloc({
    required this.myAccountBloc,
    required this.unifediApiInstanceService,
    required this.currentUnifediApiAccessBloc,
    required this.unifediApiFilterService,
    required this.pleromaConversationService,
    required this.pleromaApiChatService,
    required this.pleromaNotificationService,
    required this.filterRepository,
    required this.notificationRepository,
    required this.conversationChatRepository,
    required this.pleromaChatRepository,
    required this.connectionService,
  }) {
    stateSubject.disposeWith(this);

    unifediApiInstanceService.restService.unifediApiErrorStream
        .listen((apiError) {
      var statusCode = apiError.restResponseError.statusCode;
      var restResponseCodeType =
          RestResponseCodeType.detectByStatusCode(statusCode);

      if (restResponseCodeType == RestResponseCodeType.clientErrorValue) {
        var clientErrorCodeType =
            RestResponseClientErrorCodeType.detectByStatusCode(statusCode);

        if (clientErrorCodeType ==
            RestResponseClientErrorCodeType.unauthorizedValue) {
          _logger.finest(() =>
              ' stateSubject.add(CurrentUnifediApiAccessContextInitState.invalidCredentials)');
          stateSubject
              .add(CurrentUnifediApiAccessContextInitState.invalidCredentials);
        }
      }
    }).disposeWith(this);
  }

  bool instanceInfoUpdatedDuringRequiredDataUpdate = false;

  @override
  // ignore: long-method
  Future refreshFromNetwork({
    required bool isNeedWaitForOptionalData,
  }) async {
    instanceInfoUpdatedDuringRequiredDataUpdate = false;
    stateSubject.add(CurrentUnifediApiAccessContextInitState.loading);
    var isConnected = connectionService.isConnected;
    _logger.finest(() => 'refresh isApiReadyToUse $isConnected');

    bool? requiredDataRefreshSuccess;

    if (isConnected) {
      try {
        await myAccountBloc.refreshFromNetwork(
          isNeedPreFetchRelationship: false,
        );

        if (currentUnifediApiAccessBloc.currentInstance == null) {
          await updateInstanceInformation();
          instanceInfoUpdatedDuringRequiredDataUpdate = true;
        }

        if (myAccountBloc.isLocalCacheExist) {
          stateSubject.add(
            CurrentUnifediApiAccessContextInitState.localCacheExist,
          );
        } else {
          stateSubject.add(
            CurrentUnifediApiAccessContextInitState
                .cantFetchAndLocalCacheNotExist,
          );
        }
        requiredDataRefreshSuccess = true;
      } catch (e, stackTrace) {
        _logger.warning(() => 'failed to update instance info', e, stackTrace);
        if (e is IUnifediApiRestErrorException) {
          if (e.unifediError.restResponseError.statusCode ==
              RestResponseClientErrorCodeType.forbiddenIntValue) {
            stateSubject.add(
              CurrentUnifediApiAccessContextInitState.invalidCredentials,
            );
            rethrow;
          } else {
            if (myAccountBloc.isLocalCacheExist) {
              stateSubject.add(
                CurrentUnifediApiAccessContextInitState.localCacheExist,
              );
            } else {
              stateSubject.add(
                CurrentUnifediApiAccessContextInitState
                    .cantFetchAndLocalCacheNotExist,
              );
            }
          }
        } else {
          if (myAccountBloc.isLocalCacheExist) {
            stateSubject.add(
              CurrentUnifediApiAccessContextInitState.localCacheExist,
            );
          } else {
            stateSubject.add(
              CurrentUnifediApiAccessContextInitState
                  .cantFetchAndLocalCacheNotExist,
            );
          }
        }
      }
    } else {
      if (myAccountBloc.isLocalCacheExist) {
        stateSubject.add(
          CurrentUnifediApiAccessContextInitState.localCacheExist,
        );
      } else {
        stateSubject.add(
          CurrentUnifediApiAccessContextInitState
              .cantFetchAndLocalCacheNotExist,
        );
      }
    }

    if (isConnected && requiredDataRefreshSuccess == true) {
      var optionalRefreshFuture = refreshOptionalData();
      if (isNeedWaitForOptionalData) {
        await optionalRefreshFuture;
      }
    }
  }

  Future refreshOptionalData() async {
    var isPleroma = currentUnifediApiAccessBloc.currentInstance!.isPleroma;
    var isMastodon = currentUnifediApiAccessBloc.currentInstance!.isMastodon;

    var actualNotificationUnreadCount =
        await notificationRepository.calculateCount(
      filters: NotificationRepositoryFilters(onlyUnread: true),
    );
    var actualConversationChatUnreadCount =
        await conversationChatRepository.getTotalUnreadCount();
    var actualPleromaChatUnreadCount =
        await pleromaChatRepository.getTotalUnreadCount();

    var myAccountUnreadNotificationsCount = 0;
    var myAccountUnreadConversationCount = 0;

    if (isPleroma) {
      myAccountUnreadConversationCount =
          myAccountBloc.myAccount!.unreadConversationCount ?? 0;
      myAccountUnreadNotificationsCount =
          myAccountBloc.myAccount!.unreadNotificationsCount ?? 0;
    }

    var isNeedUpdateChats = isPleroma && (actualPleromaChatUnreadCount == 0);
    var isNeedUpdateConversations =
        (isMastodon && actualConversationChatUnreadCount == 0) ||
            (isPleroma &&
                myAccountUnreadConversationCount > 0 &&
                actualConversationChatUnreadCount == 0);
    var isNeedUpdateNotifications =
        (isMastodon && actualNotificationUnreadCount == 0) ||
            (isPleroma &&
                myAccountUnreadNotificationsCount > 0 &&
                actualNotificationUnreadCount == 0);

    var futures = [
      updateFilters(),
      if (isNeedUpdateNotifications) updateNotifications(),
      if (isNeedUpdateConversations) updateConversations(),
      if (isNeedUpdateChats) updateChats(),
      if (!instanceInfoUpdatedDuringRequiredDataUpdate)
        updateInstanceInformation(),
    ];

    return Future.wait(futures);
  }

  Future updateFilters() async {
    var remoteFilters = await unifediApiFilterService.getFilters(
      pagination: null,
    );

    await filterRepository.batch((batch) {
      filterRepository.clear(batchTransaction: batch);
      filterRepository.upsertAllInRemoteType(
        remoteFilters,
        batchTransaction: batch,
      );
    });
  }

  Future updateInstanceInformation() async {
    var info = await unifediApiInstanceService.getInstance();
    var currentInstance = currentUnifediApiAccessBloc.currentInstance!;
    currentInstance =
        currentInstance.copyWith(instance: info.toUnifediApiInstance());
    await currentUnifediApiAccessBloc.changeCurrentInstance(currentInstance);
  }

  // ignore: close_sinks
  BehaviorSubject<CurrentUnifediApiAccessContextInitState> stateSubject =
      BehaviorSubject.seeded(CurrentUnifediApiAccessContextInitState.loading);

  @override
  CurrentUnifediApiAccessContextInitState? get state =>
      stateSubject.valueOrNull;

  @override
  Stream<CurrentUnifediApiAccessContextInitState> get stateStream =>
      stateSubject.stream;

  @override
  Future internalAsyncInit() async {
    await refreshFromNetwork(
      isNeedWaitForOptionalData: false,
    );
  }

  Future updateNotifications() async {
    var remoteNotifications = await pleromaNotificationService.getNotifications(
      pagination: null,
      excludeTypes: null,
      onlyFromAccountId: null,
      includeTypes: null,
      excludeVisibilities: null,
    );
    await notificationRepository.upsertAllInRemoteType(
      remoteNotifications,
      batchTransaction: null,
    );
  }

  Future updateChats() async {
    var remoteChats = await pleromaApiChatService.getChats(
      pagination: null,
    );
    await pleromaChatRepository.upsertAllInRemoteType(
      remoteChats,
      batchTransaction: null,
    );
  }

  Future updateConversations() async {
    var remoteConversations = await pleromaConversationService.getConversations(
      pagination: null,
      recipientsIds: null,
    );
    await conversationChatRepository.upsertAllInRemoteType(
      remoteConversations,
      batchTransaction: null,
    );
  }

  static CurrentUnifediApiAccessContextInitBloc createFromContext(
    BuildContext context,
  ) =>
      CurrentUnifediApiAccessContextInitBloc(
        connectionService: Provider.of<IConnectionService>(
          context,
          listen: false,
        ),
        pleromaChatRepository: IPleromaChatRepository.of(
          context,
          listen: false,
        ),
        conversationChatRepository: IConversationChatRepository.of(
          context,
          listen: false,
        ),
        notificationRepository: INotificationRepository.of(
          context,
          listen: false,
        ),
        pleromaApiChatService: Provider.of<IUnifediApiChatService>(
          context,
          listen: false,
        ),
        pleromaNotificationService: Provider.of<IUnifediApiNotificationService>(
          context,
          listen: false,
        ),
        pleromaConversationService: Provider.of<IUnifediApiConversationService>(
          context,
          listen: false,
        ),
        myAccountBloc: IMyAccountBloc.of(
          context,
          listen: false,
        ),
        unifediApiInstanceService: Provider.of<IUnifediApiInstanceService>(
          context,
          listen: false,
        ),
        currentUnifediApiAccessBloc: ICurrentUnifediApiAccessBloc.of(
          context,
          listen: false,
        ),
        filterRepository: IFilterRepository.of(
          context,
          listen: false,
        ),
        unifediApiFilterService: Provider.of<IUnifediApiFilterService>(
          context,
          listen: false,
        ),
      );
}

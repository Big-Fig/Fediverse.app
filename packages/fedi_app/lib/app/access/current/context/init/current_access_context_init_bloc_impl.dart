import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_rxdart/easy_dispose_rxdart.dart';
import 'package:fedi_app/app/access/current/context/init/current_access_context_init_bloc.dart';
import 'package:fedi_app/app/access/current/context/init/current_access_context_init_model.dart';
import 'package:fedi_app/app/access/current/current_access_bloc.dart';
import 'package:fedi_app/app/account/my/my_account_bloc.dart';
import 'package:fedi_app/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi_app/app/chat/unifedi/repository/unifedi_chat_repository.dart';
import 'package:fedi_app/app/filter/repository/filter_repository.dart';
import 'package:fedi_app/app/instance/announcement/repository/instance_announcement_repository.dart';
import 'package:fedi_app/app/notification/repository/notification_repository.dart';
import 'package:fedi_app/app/notification/repository/notification_repository_model.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi_app/connection/connection_service.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unifedi_api/unifedi_api.dart';

class CurrentAccessContextInitBloc extends AsyncInitLoadingBloc
    implements ICurrentAccessContextInitBloc {
  final IMyAccountBloc myAccountBloc;
  final IUnifediApiInstanceService unifediApiInstanceService;
  final IUnifediApiNotificationService unifediNotificationService;
  final IUnifediApiChatService unifediApiChatService;
  final IUnifediApiConversationService unifediConversationService;
  final IUnifediApiFilterService unifediApiFilterService;
  final IUnifediApiAnnouncementService unifediApiAnnouncementService;
  final IFilterRepository filterRepository;
  final INotificationRepository notificationRepository;
  final IConversationChatRepository conversationChatRepository;
  final IUnifediChatRepository unifediChatRepository;
  final IInstanceAnnouncementRepository announcementRepository;
  final ICurrentAccessBloc currentUnifediApiAccessBloc;
  final IConnectionService connectionService;

  CurrentAccessContextInitBloc({
    required this.myAccountBloc,
    required this.unifediApiInstanceService,
    required this.currentUnifediApiAccessBloc,
    required this.unifediApiFilterService,
    required this.unifediConversationService,
    required this.unifediApiChatService,
    required this.unifediNotificationService,
    required this.filterRepository,
    required this.notificationRepository,
    required this.conversationChatRepository,
    required this.unifediChatRepository,
    required this.connectionService,
    required this.announcementRepository,
    required this.unifediApiAnnouncementService,
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
          _logger.finest(
            () =>
                ' stateSubject.add(CurrentUnifediApiAccessContextInitState.invalidCredentials)',
          );
          stateSubject.add(CurrentAccessContextInitState.invalidCredentials);
        }
      }
    }).disposeWith(this);
  }

  bool instanceInfoUpdatedDuringRequiredDataUpdate = false;

  @override
  // ignore: long-method
  Future<void> refreshFromNetwork({
    required bool isNeedWaitForOptionalData,
  }) async {
    instanceInfoUpdatedDuringRequiredDataUpdate = false;
    stateSubject.add(CurrentAccessContextInitState.loading);
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
            CurrentAccessContextInitState.localCacheExist,
          );
        } else {
          stateSubject.add(
            CurrentAccessContextInitState.cantFetchAndLocalCacheNotExist,
          );
        }
        requiredDataRefreshSuccess = true;
        // ignore: avoid_catches_without_on_clauses
      } catch (e, stackTrace) {
        _logger.warning(() => 'failed to update instance info', e, stackTrace);
        if (e is IUnifediApiRestErrorException) {
          if (e.unifediError.restResponseError.statusCode ==
              RestResponseClientErrorCodeType.forbiddenIntValue) {
            stateSubject.add(
              CurrentAccessContextInitState.invalidCredentials,
            );
            rethrow;
          } else {
            if (myAccountBloc.isLocalCacheExist) {
              stateSubject.add(
                CurrentAccessContextInitState.localCacheExist,
              );
            } else {
              stateSubject.add(
                CurrentAccessContextInitState.cantFetchAndLocalCacheNotExist,
              );
            }
          }
        } else {
          if (myAccountBloc.isLocalCacheExist) {
            stateSubject.add(
              CurrentAccessContextInitState.localCacheExist,
            );
          } else {
            stateSubject.add(
              CurrentAccessContextInitState.cantFetchAndLocalCacheNotExist,
            );
          }
        }
      }
    } else {
      if (myAccountBloc.isLocalCacheExist) {
        stateSubject.add(
          CurrentAccessContextInitState.localCacheExist,
        );
      } else {
        stateSubject.add(
          CurrentAccessContextInitState.cantFetchAndLocalCacheNotExist,
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

  Future<void> refreshOptionalData() async {
    var actualNotificationUnreadCount =
        await notificationRepository.calculateCount(
      filters: NotificationRepositoryFilters.only(onlyUnread: true),
    );
    var actualConversationChatUnreadCount =
        await conversationChatRepository.getTotalUnreadCount();
    var actualUnifediChatUnreadCount =
        await unifediChatRepository.getTotalUnreadCount();
    var actualAnnouncementCount = await announcementRepository.countAll();

    var myAccountUnreadNotificationsCount =
        myAccountBloc.myAccount!.unreadNotificationsCount ?? 0;
    var myAccountUnreadConversationCount =
        myAccountBloc.myAccount!.unreadConversationCount ?? 0;

    var isAnnouncementsSupported =
        unifediApiAnnouncementService.isFeatureSupported(
      unifediApiAnnouncementService.getAnnouncementsFeature,
    );
    var isChatSupported = unifediApiChatService.isFeatureSupported(
      unifediApiChatService.getChatsFeature,
    );
    var markConversationAsReadSupported =
        unifediConversationService.isFeatureSupported(
      unifediConversationService.markConversationAsReadFeature,
    );
    var markNotificationAsReadSupported =
        unifediNotificationService.isFeatureSupported(
      unifediNotificationService.markAsReadSingleFeature,
    );

    var isNeedUpdateAnnouncement =
        isAnnouncementsSupported && actualAnnouncementCount == 0;
    var isNeedUpdateChats =
        isChatSupported && (actualUnifediChatUnreadCount == 0);
    var isNeedUpdateConversations = (!markConversationAsReadSupported &&
            actualConversationChatUnreadCount == 0) ||
        (markConversationAsReadSupported &&
            myAccountUnreadConversationCount > 0 &&
            actualConversationChatUnreadCount == 0);
    var isNeedUpdateNotifications = (!markNotificationAsReadSupported &&
            actualNotificationUnreadCount == 0) ||
        (markNotificationAsReadSupported &&
            myAccountUnreadNotificationsCount > 0 &&
            actualNotificationUnreadCount == 0);

    if (isNeedUpdateAnnouncement) {
      await updateAnnouncements();
    }

    var futures = [
      updateFilters(),
      if (isNeedUpdateNotifications) updateNotifications(),
      if (isNeedUpdateConversations) updateConversations(),
      if (isNeedUpdateChats) updateChats(),
      if (!instanceInfoUpdatedDuringRequiredDataUpdate)
        updateInstanceInformation(),
    ];

    // ignore: avoid-ignoring-return-values
    await Future.wait<dynamic>(futures);
  }

  Future<void> updateFilters() async {
    var remoteFilters = await unifediApiFilterService.getFilters(
      pagination: null,
    );

    await filterRepository.batch((batch) {
      filterRepository
        ..clear(batchTransaction: batch)
        ..upsertAllInRemoteType(
          remoteFilters,
          batchTransaction: batch,
        );
    });
  }

  Future<void> updateInstanceInformation() async {
    var info = await unifediApiInstanceService.getInstance();
    var currentInstance = currentUnifediApiAccessBloc.currentInstance!;
    currentInstance =
        currentInstance.copyWith(instance: info.toUnifediApiInstance());
    await currentUnifediApiAccessBloc.changeCurrentInstance(currentInstance);
  }

  // ignore: close_sinks
  BehaviorSubject<CurrentAccessContextInitState> stateSubject =
      BehaviorSubject.seeded(CurrentAccessContextInitState.loading);

  @override
  CurrentAccessContextInitState? get state => stateSubject.valueOrNull;

  @override
  Stream<CurrentAccessContextInitState> get stateStream => stateSubject.stream;

  @override
  Future<void> internalAsyncInit() async {
    await refreshFromNetwork(
      isNeedWaitForOptionalData: false,
    );
  }

  Future<void> updateNotifications() async {
    var remoteNotifications = await unifediNotificationService.getNotifications(
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

  Future<void> updateAnnouncements() async {
    var featureSupported = unifediApiAnnouncementService.isFeatureSupported(
      unifediApiAnnouncementService.getAnnouncementsFeature,
    );

    if (featureSupported) {
      var remoteAnnouncements =
          await unifediApiAnnouncementService.getAnnouncements(
        withDismissed: null,
      );
      await announcementRepository.upsertAllInRemoteType(
        remoteAnnouncements,
        batchTransaction: null,
      );
    }
  }

  Future<void> updateChats() async {
    var remoteChats = await unifediApiChatService.getChats(
      pagination: null,
    );
    await unifediChatRepository.upsertAllInRemoteType(
      remoteChats,
      batchTransaction: null,
    );
  }

  Future<void> updateConversations() async {
    var remoteConversations = await unifediConversationService.getConversations(
      pagination: null,
      recipientsIds: null,
    );
    await conversationChatRepository.upsertAllInRemoteType(
      remoteConversations,
      batchTransaction: null,
    );
  }

  static CurrentAccessContextInitBloc createFromContext(
    BuildContext context,
  ) =>
      CurrentAccessContextInitBloc(
        connectionService: Provider.of<IConnectionService>(
          context,
          listen: false,
        ),
        unifediChatRepository: IUnifediChatRepository.of(
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
        unifediApiChatService: Provider.of<IUnifediApiChatService>(
          context,
          listen: false,
        ),
        unifediNotificationService: Provider.of<IUnifediApiNotificationService>(
          context,
          listen: false,
        ),
        unifediConversationService: Provider.of<IUnifediApiConversationService>(
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
        currentUnifediApiAccessBloc: ICurrentAccessBloc.of(
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
        announcementRepository: IInstanceAnnouncementRepository.of(
          context,
          listen: false,
        ),
        unifediApiAnnouncementService:
            Provider.of<IUnifediApiAnnouncementService>(
          context,
          listen: false,
        ),
      );
}

var _logger = Logger('current_access_context_init_bloc_impl.dart');

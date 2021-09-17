import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_rxdart/easy_dispose_rxdart.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/auth/instance/current/context/init/current_auth_instance_context_init_bloc.dart';
import 'package:fedi/app/auth/instance/current/context/init/current_auth_instance_context_init_model.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository.dart';
import 'package:fedi/app/filter/repository/filter_repository.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/notification/repository/notification_repository_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unifedi_api/unifedi_api.dart';

var _logger = Logger('current_auth_instance_context_init_bloc_impl.dart');

class CurrentAuthInstanceContextInitBloc extends AsyncInitLoadingBloc
    implements ICurrentAuthInstanceContextInitBloc {
  final IMyAccountBloc myAccountBloc;
  final IUnifediApiInstanceService pleromaInstanceService;
  final IUnifediApiNotificationService pleromaNotificationService;
  final IUnifediApiChatService pleromaChatService;
  final IUnifediApiConversationService pleromaConversationService;
  final IUnifediApiFilterService unifediApiFilterService;
  final IFilterRepository filterRepository;
  final INotificationRepository notificationRepository;
  final IConversationChatRepository conversationChatRepository;
  final IPleromaChatRepository pleromaChatRepository;
  final ICurrentAuthInstanceBloc currentAuthInstanceBloc;
  final IUnifediApiAuthRestService pleromaAuthRestService;

  CurrentAuthInstanceContextInitBloc({
    required this.myAccountBloc,
    required this.pleromaInstanceService,
    required this.currentAuthInstanceBloc,
    required this.pleromaAuthRestService,
    required this.unifediApiFilterService,
    required this.pleromaConversationService,
    required this.pleromaChatService,
    required this.pleromaNotificationService,
    required this.filterRepository,
    required this.notificationRepository,
    required this.conversationChatRepository,
    required this.pleromaChatRepository,
  }) {
    stateSubject.disposeWith(this);

    pleromaAuthRestService.unifediApiStateStream.listen(
      (unifediApiState) {
        _logger.finest(() => 'unifediApiState $unifediApiState');
        if (unifediApiState == UnifediApiState.brokenAuth) {
          _logger.finest(() =>
              ' stateSubject.add(CurrentAuthInstanceContextInitState.invalidCredentials)');
          stateSubject
              .add(CurrentAuthInstanceContextInitState.invalidCredentials);
        }
      },
    ).disposeWith(this);
  }

  bool instanceInfoUpdatedDuringRequiredDataUpdate = false;

  @override
  Future refreshFromNetwork({
    required bool isNeedWaitForOptionalData,
  }) async {
    instanceInfoUpdatedDuringRequiredDataUpdate = false;
    stateSubject.add(CurrentAuthInstanceContextInitState.loading);
    var isConnected = pleromaInstanceService.isConnected;
    _logger.finest(() => 'refresh isApiReadyToUse $isConnected');

    bool? requiredDataRefreshSuccess;

    if (isConnected) {
      try {
        await myAccountBloc.refreshFromNetwork(
          isNeedPreFetchRelationship: false,
        );

        if (currentAuthInstanceBloc.currentInstance == null) {
          await updateInstanceInformation();
          instanceInfoUpdatedDuringRequiredDataUpdate = true;
        }

        if (myAccountBloc.isLocalCacheExist) {
          stateSubject.add(
            CurrentAuthInstanceContextInitState.localCacheExist,
          );
        } else {
          stateSubject.add(
            CurrentAuthInstanceContextInitState.cantFetchAndLocalCacheNotExist,
          );
        }
        requiredDataRefreshSuccess = true;
      } catch (e, stackTrace) {
        _logger.warning(() => 'failed to update instance info', e, stackTrace);
        if (e is UnifediApiInvalidCredentialsForbiddenRestException) {
          stateSubject.add(
            CurrentAuthInstanceContextInitState.invalidCredentials,
          );
          rethrow;
        } else {
          if (myAccountBloc.isLocalCacheExist) {
            stateSubject.add(
              CurrentAuthInstanceContextInitState.localCacheExist,
            );
          } else {
            stateSubject.add(
              CurrentAuthInstanceContextInitState
                  .cantFetchAndLocalCacheNotExist,
            );
          }
        }
      }
    } else {
      if (myAccountBloc.isLocalCacheExist) {
        stateSubject.add(
          CurrentAuthInstanceContextInitState.localCacheExist,
        );
      } else {
        stateSubject.add(
          CurrentAuthInstanceContextInitState.cantFetchAndLocalCacheNotExist,
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
    var isPleroma = currentAuthInstanceBloc.currentInstance!.isPleroma;
    var isMastodon = currentAuthInstanceBloc.currentInstance!.isMastodon;

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
    var info = await pleromaInstanceService.getInstance();
    var currentInstance = currentAuthInstanceBloc.currentInstance!;
    currentInstance = currentInstance.copyWith(info: info);
    await currentAuthInstanceBloc.changeCurrentInstance(currentInstance);
  }

  // ignore: close_sinks
  BehaviorSubject<CurrentAuthInstanceContextInitState> stateSubject =
      BehaviorSubject.seeded(CurrentAuthInstanceContextInitState.loading);

  @override
  CurrentAuthInstanceContextInitState? get state => stateSubject.valueOrNull;

  @override
  Stream<CurrentAuthInstanceContextInitState> get stateStream =>
      stateSubject.stream;

  @override
  Future internalAsyncInit() async {
    await refreshFromNetwork(
      isNeedWaitForOptionalData: false,
    );
  }

  Future updateNotifications() async {
    var remoteNotifications =
        await pleromaNotificationService.getNotifications();
    await notificationRepository.upsertAllInRemoteType(
      remoteNotifications,
      batchTransaction: null,
    );
  }

  Future updateChats() async {
    var remoteChats = await pleromaChatService.getChats();
    await pleromaChatRepository.upsertAllInRemoteType(
      remoteChats,
      batchTransaction: null,
    );
  }

  Future updateConversations() async {
    var remoteConversations =
        await pleromaConversationService.getConversations();
    await conversationChatRepository.upsertAllInRemoteType(
      remoteConversations,
      batchTransaction: null,
    );
  }

  static CurrentAuthInstanceContextInitBloc createFromContext(
    BuildContext context,
  ) =>
      CurrentAuthInstanceContextInitBloc(
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
        pleromaChatService: Provider.of<IUnifediApiChatService>(
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
        pleromaInstanceService: Provider.of<IUnifediApiInstanceService>(
          context,
          listen: false,
        ),
        currentAuthInstanceBloc: ICurrentAuthInstanceBloc.of(
          context,
          listen: false,
        ),
        pleromaAuthRestService: Provider.of<IUnifediApiAuthRestService>(
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

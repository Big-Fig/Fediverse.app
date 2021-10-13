import 'package:collection/collection.dart' show IterableExtension;
import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/status/status_bloc_impl.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

final _logger = Logger('local_status_bloc_impl.dart');

class LocalStatusBloc extends StatusBloc {
  final IStatusRepository statusRepository;
  final IAccountRepository accountRepository;
  final bool isNeedWatchLocalRepositoryForUpdates;
  final IConnectionService connectionService;

  LocalStatusBloc({
    required this.connectionService,
    required this.statusRepository,
    required this.accountRepository,
    required this.isNeedWatchLocalRepositoryForUpdates,
    required IUnifediApiStatusService unifediApiStatusService,
    required IUnifediApiAccountService unifediApiAccountService,
    required IUnifediApiPollService unifediApiPollService,
    required IStatus status,
    required bool isNeedRefreshFromNetworkOnInit,
    required bool delayInit,
  }) : super(
          unifediApiStatusService: unifediApiStatusService,
          unifediApiAccountService: unifediApiAccountService,
          unifediApiPollService: unifediApiPollService,
          status: status,
          isNeedRefreshFromNetworkOnInit: isNeedRefreshFromNetworkOnInit,
          delayInit: delayInit,
        );

  static LocalStatusBloc createFromContext(
    BuildContext context, {
    required IStatus
        status, // for better performance we dont update account too
    // often
    bool isNeedRefreshFromNetworkOnInit = false,
    //  improve performance in timeline unnecessary recreations
    bool delayInit = true,
    bool isNeedWatchLocalRepositoryForUpdates = true,
  }) =>
      LocalStatusBloc(
        status: status,
        isNeedRefreshFromNetworkOnInit: isNeedRefreshFromNetworkOnInit,
        delayInit: delayInit,
        connectionService: Provider.of<IConnectionService>(
          context,
          listen: false,
        ),
        isNeedWatchLocalRepositoryForUpdates:
            isNeedWatchLocalRepositoryForUpdates,
        unifediApiStatusService: Provider.of<IUnifediApiStatusService>(
          context,
          listen: false,
        ),
        unifediApiAccountService: Provider.of<IUnifediApiAccountService>(
          context,
          listen: false,
        ),
        unifediApiPollService: Provider.of<IUnifediApiPollService>(
          context,
          listen: false,
        ),
        accountRepository: IAccountRepository.of(
          context,
          listen: false,
        ),
        statusRepository: IStatusRepository.of(
          context,
          listen: false,
        ),
      );

  static Widget provideToContext(
    BuildContext context, {
    required IStatus
        status, // for better performance we dont update account too
    // often
    bool isNeedRefreshFromNetworkOnInit = false,
    //  improve performance in timeline unnecessary recreations
    bool delayInit = true,
    bool isNeedWatchLocalRepositoryForUpdates = true,
    required Widget child,
  }) =>
      DisposableProvider<IStatusBloc>(
        create: (context) => LocalStatusBloc.createFromContext(
          context,
          status: status,
          isNeedRefreshFromNetworkOnInit: isNeedRefreshFromNetworkOnInit,
          delayInit: delayInit,
          isNeedWatchLocalRepositoryForUpdates:
              isNeedWatchLocalRepositoryForUpdates,
        ),
        child: child,
      );

  @override
  Future<IAccount?> loadAccountByMentionUrl({
    required String url,
  }) async {
    var foundMention = reblogOrOriginalMentions?.firstWhereOrNull(
      (mention) => mention.url == url,
    );

    IAccount? account;
    if (foundMention != null) {
      var accountRemoteId = foundMention.id;

      account = await accountRepository.findByRemoteIdInAppType(
        accountRemoteId,
      );
      if (account == null) {
        if (connectionService.isConnected) {
          var remoteAccount = await unifediApiAccountService.getAccount(
            accountId: accountRemoteId,
            withRelationship: false,
          );
          await accountRepository.upsertInRemoteType(
            remoteAccount,
          );
        }
        account = await accountRepository.findByRemoteIdInAppType(
          accountRemoteId,
        );
      }
    }

    return account;
  }

  @override
  Future<IAccount?> getInReplyToAccount() async {
    var inReplyToAccountRemoteId = status.inReplyToAccountRemoteId;
    if (inReplyToAccountRemoteId != null) {
      return accountRepository.findByRemoteIdInAppType(
        inReplyToAccountRemoteId,
      );
    } else {
      return null;
    }
  }

  @override
  Stream<IAccount?> watchInReplyToAccount() {
    var inReplyToAccountRemoteId = status.inReplyToAccountRemoteId;
    if (inReplyToAccountRemoteId != null) {
      return accountRepository.watchByRemoteIdInAppType(
        inReplyToAccountRemoteId,
      );
    } else {
      return Stream.value(null);
    }
  }

  @override
  Future<IStatus?> getInReplyToStatus() async {
    var inReplyToStatus = status.inReplyToStatus;
    if (inReplyToStatus != null) {
      return inReplyToStatus;
    } else {
      var inReplyToRemoteId = status.inReplyToRemoteId;
      if (inReplyToRemoteId != null) {
        return statusRepository.findByRemoteIdInAppType(
          inReplyToRemoteId,
        );
      } else {
        return null;
      }
    }
  }

  @override
  Stream<IStatus?> watchInReplyToStatus() {
    var inReplyToRemoteId = status.inReplyToRemoteId;
    if (inReplyToRemoteId != null) {
      return statusRepository.watchByRemoteIdInAppType(
        inReplyToRemoteId,
      );
    } else {
      return Stream.value(null);
    }
  }

  @override
  Future<IStatus> onPollUpdated(IUnifediApiPoll? poll) async {
    var updatedLocalStatus = await super.onPollUpdated(poll);

    await statusRepository.updateByDbIdInDbType(
      dbId: status.localId!,
      dbItem: updatedLocalStatus.toDbStatus(),
      batchTransaction: null,
    );

    return updatedLocalStatus;
  }

  @override
  Future actualInit({
    required IStatus status,
    required bool isNeedRefreshFromNetworkOnInit,
  }) async {
    if (isNeedWatchLocalRepositoryForUpdates) {
      var remoteId = status.remoteId;
      if (remoteId != null) {
        statusRepository.watchByRemoteIdInAppType(remoteId).listen(
          (updatedStatus) {
            if (updatedStatus != null) {
              statusSubject.add(updatedStatus);
            }
          },
        ).disposeWith(this);
      }
    }
    if (isNeedRefreshFromNetworkOnInit) {
      await refreshFromNetwork();
    }
  }

  @override
  Future<IStatus> toggleFavourite() async {
    IUnifediApiStatus remoteStatus;
    if (reblogOrOriginal.favourited) {
      remoteStatus = await unifediApiStatusService.unFavouriteStatus(
        statusId: reblogOrOriginal.remoteId!,
      );
    } else {
      remoteStatus = await unifediApiStatusService.favouriteStatus(
        statusId: reblogOrOriginal.remoteId!,
      );
    }

    await statusRepository.updateAppTypeByRemoteType(
      appItem: reblogOrOriginal,
      remoteItem: remoteStatus,
      batchTransaction: null,
    );

    var result = await statusRepository.findByRemoteIdInAppType(
      remoteStatus.id,
    );

    return result!;
  }

  @override
  Future<IStatus> toggleReblog() async {
    _logger.finest(
      () =>
          'requestToggleReblog status.reblogged=${reblogOrOriginal.reblogged}',
    );
    IUnifediApiStatus remoteStatus;
    if (reblogOrOriginal.reblogged) {
      remoteStatus = await unifediApiStatusService.unReblogStatus(
        statusId: reblogOrOriginal.remoteId!,
      );
    } else {
      remoteStatus = await unifediApiStatusService.reblogStatus(
        statusId: reblogOrOriginal.remoteId!,
        visibility: null,
      );
    }

    await statusRepository.upsertInRemoteType(
      remoteStatus,
    );

    var result = await statusRepository.findByRemoteIdInAppType(
      remoteStatus.id,
    );

    return result!;
  }

  @override
  Future<IStatus> mute({
    required Duration? duration,
  }) async {
    if (duration != null) {
      assert(
        unifediApiStatusService.isPleroma,
        'Muting with duration supported only on pleroma',
      );
    }

    return _actualMuteUnmute(
      expiresIn: duration,
    );
  }

  @override
  Future<IStatus> toggleMute({
    required Duration? duration,
  }) async =>
      _actualMuteUnmute(
        expiresIn: duration,
      );

  Future<IStatus> _actualMuteUnmute({
    required Duration? expiresIn,
  }) async {
    IUnifediApiStatus remoteStatus;

    if (reblogOrOriginal.muted) {
      remoteStatus = await unifediApiStatusService.unMuteStatus(
        statusId: reblogOrOriginal.remoteId!,
      );
    } else {
      remoteStatus = await unifediApiStatusService.muteStatus(
        statusId: reblogOrOriginal.remoteId!,
        expiresIn: expiresIn,
      );
    }

    await statusRepository.updateAppTypeByRemoteType(
      appItem: reblogOrOriginal,
      remoteItem: remoteStatus,
      batchTransaction: null,
    );

    var result = await statusRepository.findByRemoteIdInAppType(
      reblogOrOriginal.remoteId!,
    );

    return result!;
  }

  @override
  Future<IStatus> toggleBookmark() async {
    IUnifediApiStatus remoteStatus;
    if (reblogOrOriginal.bookmarked) {
      remoteStatus = await unifediApiStatusService.unBookmarkStatus(
        statusId: reblogOrOriginal.remoteId!,
      );
    } else {
      remoteStatus = await unifediApiStatusService.bookmarkStatus(
        statusId: reblogOrOriginal.remoteId!,
      );
    }

    await statusRepository.updateAppTypeByRemoteType(
      appItem: reblogOrOriginal,
      remoteItem: remoteStatus,
      batchTransaction: null,
    );

    var result = await statusRepository.findByRemoteIdInAppType(
      reblogOrOriginal.remoteId!,
    );

    return result!;
  }

  @override
  Future<IStatus> togglePin() async {
    IUnifediApiStatus remoteStatus;
    if (reblogOrOriginal.pinned) {
      remoteStatus = await unifediApiStatusService.unPinStatus(
        statusId: reblogOrOriginal.remoteId!,
      );
    } else {
      // reblogged dont support pin
      if (reblogOrOriginal.reblogged) {
        remoteStatus = await unifediApiStatusService.pinStatus(
          statusId: reblog!.remoteId!,
        );
      } else {
        remoteStatus = await unifediApiStatusService.pinStatus(
          statusId: status.remoteId!,
        );
      }
    }

    await statusRepository.updateAppTypeByRemoteType(
      appItem: reblogOrOriginal,
      remoteItem: remoteStatus,
      batchTransaction: null,
    );

    var result = await statusRepository.findByRemoteIdInAppType(
      reblogOrOriginal.remoteId!,
    );

    return result!;
  }

  @override
  Future delete() async {
    await unifediApiStatusService.deleteStatus(
      statusId: status.remoteId!,
    );

    await statusRepository.markStatusAsDeleted(
      statusRemoteId: status.remoteId!,
    );
  }

  @override
  Future<IUnifediApiStatus> toggleEmojiReaction({
    required String emoji,
  }) async {
    bool alreadyAdded;
    var foundEmojiReaction = emojiReactions?.firstWhereOrNull(
      (emojiReaction) => emojiReaction.name == emoji,
    );

    if (foundEmojiReaction != null) {
      alreadyAdded = foundEmojiReaction.me;
    } else {
      alreadyAdded = false;
    }

    IUnifediApiStatus? remoteStatus;
    if (alreadyAdded) {
      remoteStatus = await unifediApiStatusService.removeEmojiReaction(
        statusId: status.remoteId!,
        emoji: emoji,
      );
    } else {
      remoteStatus = await unifediApiStatusService.addEmojiReaction(
        statusId: status.remoteId!,
        emoji: emoji,
      );
    }

    await statusRepository.upsertInRemoteType(
      remoteStatus,
    );

    return remoteStatus;
  }

  Future _updateByRemoteStatus(
    IUnifediApiStatus remoteStatus, {
    Batch? batchTransaction,
  }) =>
      statusRepository.updateAppTypeByRemoteType(
        appItem: status,
        remoteItem: remoteStatus,
        batchTransaction: batchTransaction,
      );

  @override
  Future refreshFromNetwork() async {
    var remoteStatus = await loadRemoteStatus();

    return _updateByRemoteStatus(remoteStatus);
  }

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;

  @override
  bool get isPleroma => unifediApiStatusService.isPleroma;
}

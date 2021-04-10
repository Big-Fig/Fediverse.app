import 'package:collection/collection.dart' show IterableExtension;
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/status/status_bloc_impl.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/duration/duration_extension.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/poll/pleroma_poll_model.dart';
import 'package:fedi/pleroma/poll/pleroma_poll_service.dart';
import 'package:fedi/pleroma/status/auth/pleroma_auth_status_service.dart';
import 'package:fedi/pleroma/status/emoji_reaction/pleroma_status_emoji_reaction_service.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

final _logger = Logger("local_status_bloc_impl.dart");

class LocalStatusBloc extends StatusBloc {
  final IStatusRepository statusRepository;
  final IAccountRepository accountRepository;
  final bool isNeedWatchLocalRepositoryForUpdates;
  final IPleromaAuthStatusService pleromaAuthStatusService;

  LocalStatusBloc({
    required this.statusRepository,
    required this.accountRepository,
    required this.isNeedWatchLocalRepositoryForUpdates,
    required this.pleromaAuthStatusService,
    required IPleromaAccountService pleromaAccountService,
    required IPleromaStatusEmojiReactionService
        pleromaStatusEmojiReactionService,
    required IPleromaPollService pleromaPollService,
    required IStatus status,
    required bool isNeedRefreshFromNetworkOnInit,
    required bool delayInit,
  }) : super(
          pleromaStatusService: pleromaAuthStatusService,
          pleromaAccountService: pleromaAccountService,
          pleromaStatusEmojiReactionService: pleromaStatusEmojiReactionService,
          pleromaPollService: pleromaPollService,
          status: status,
          isNeedRefreshFromNetworkOnInit: isNeedRefreshFromNetworkOnInit,
          delayInit: delayInit,
        );

  static LocalStatusBloc createFromContext(
    BuildContext context, {
    required IStatus
        status, // for better performance we don't update account too
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
        isNeedWatchLocalRepositoryForUpdates:
            isNeedWatchLocalRepositoryForUpdates,
        pleromaAuthStatusService: IPleromaAuthStatusService.of(
          context,
          listen: false,
        ),
        pleromaAccountService: IPleromaAccountService.of(
          context,
          listen: false,
        ),
        pleromaStatusEmojiReactionService:
            IPleromaStatusEmojiReactionService.of(
          context,
          listen: false,
        ),
        pleromaPollService: IPleromaPollService.of(
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
        status, // for better performance we don't update account too
    // often
    bool isNeedRefreshFromNetworkOnInit = false,
    //  improve performance in timeline unnecessary recreations
    bool delayInit = true,
    bool isNeedWatchLocalRepositoryForUpdates = true,
    required Widget child,
  }) {
    return DisposableProvider<IStatusBloc>(
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
  }

  @override
  Future<IAccount?> loadAccountByMentionUrl({
    required String url,
  }) async {
    var foundMention = reblogOrOriginalMentions?.firstWhereOrNull(
      (mention) => mention.url == url,
    );

    var account;
    if (foundMention != null) {
      var accountRemoteId = foundMention.id;
      if (pleromaAccountService.isApiReadyToUse) {
        var remoteAccount = await pleromaAccountService.getAccount(
          accountRemoteId: accountRemoteId,
        );
        await accountRepository.upsertInRemoteType(
          remoteAccount,
        );
      }
      account = await accountRepository.findByRemoteIdInAppType(
        accountRemoteId,
      );
    }

    return account;
  }

  @override
  Future<IAccount?> getInReplyToAccount() async {
    var inReplyToAccountRemoteId = status.inReplyToAccountRemoteId;
    if (inReplyToAccountRemoteId != null) {
      return await accountRepository.findByRemoteIdInAppType(
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
        return await statusRepository.findByRemoteIdInAppType(
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
  Future<IStatus> onPollUpdated(IPleromaPoll? poll) async {
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
        addDisposable(
          streamSubscription:
              statusRepository.watchByRemoteIdInAppType(remoteId).listen(
            (updatedStatus) {
              if (updatedStatus != null) {
                statusSubject.add(updatedStatus);
              }
            },
          ),
        );
      }
    }
    if (isNeedRefreshFromNetworkOnInit) {
      await refreshFromNetwork();
    }
  }

  @override
  Future<IStatus> toggleFavourite() async {
    IPleromaStatus remoteStatus;
    if (reblogOrOriginal.favourited == true) {
      remoteStatus = await pleromaAuthStatusService.unFavouriteStatus(
        statusRemoteId: reblogOrOriginal.remoteId!,
      );
    } else {
      remoteStatus = await pleromaAuthStatusService.favouriteStatus(
        statusRemoteId: reblogOrOriginal.remoteId!,
      );
    }

    await statusRepository.updateAppTypeByRemoteType(
      appItem: reblogOrOriginal,
      remoteItem: remoteStatus,
    );

    var result = await statusRepository.findByRemoteIdInAppType(
      remoteStatus.id,
    );

    return result!;
  }

  @override
  Future<IStatus> toggleReblog() async {
    _logger.finest(() =>
        "requestToggleReblog status.reblogged=${reblogOrOriginal.reblogged}");
    IPleromaStatus remoteStatus;
    if (reblogOrOriginal.reblogged == true) {
      remoteStatus = await pleromaAuthStatusService.unReblogStatus(
        statusRemoteId: reblogOrOriginal.remoteId!,
      );
    } else {
      remoteStatus = await pleromaAuthStatusService.reblogStatus(
        statusRemoteId: reblogOrOriginal.remoteId!,
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
        pleromaAuthStatusService.isPleroma,
        "Muting with duration supported only on pleroma",
      );
    }

    return await _actualMuteUnmute(
      expireDurationInSeconds: duration?.totalSeconds,
    );
  }

  @override
  Future<IStatus> toggleMute({
    required Duration? duration,
  }) async {
    return await _actualMuteUnmute(
      expireDurationInSeconds: duration?.totalSeconds,
    );
  }

  Future<IStatus> _actualMuteUnmute({
    required int? expireDurationInSeconds,
  }) async {
    IPleromaStatus remoteStatus;

    if (reblogOrOriginal.muted == true) {
      remoteStatus = await pleromaAuthStatusService.unMuteStatus(
        statusRemoteId: reblogOrOriginal.remoteId!,
      );
    } else {
      remoteStatus = await pleromaAuthStatusService.muteStatus(
        statusRemoteId: reblogOrOriginal.remoteId!,
        expireDurationInSeconds: expireDurationInSeconds,
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
    IPleromaStatus remoteStatus;
    if (reblogOrOriginal.bookmarked == true) {
      remoteStatus = await pleromaAuthStatusService.unBookmarkStatus(
        statusRemoteId: reblogOrOriginal.remoteId!,
      );
    } else {
      remoteStatus = await pleromaAuthStatusService.bookmarkStatus(
        statusRemoteId: reblogOrOriginal.remoteId!,
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
    IPleromaStatus remoteStatus;
    if (reblogOrOriginal.pinned == true) {
      remoteStatus = await pleromaAuthStatusService.unPinStatus(
        statusRemoteId: reblogOrOriginal.remoteId!,
      );
    } else {
      // reblogged don't support pin
      if (reblogOrOriginal.reblogged) {
        remoteStatus = await pleromaAuthStatusService.pinStatus(
          statusRemoteId: reblogOrOriginal.remoteId!,
        );
      } else {
        remoteStatus = await pleromaAuthStatusService.pinStatus(
          statusRemoteId: reblogOrOriginal.remoteId!,
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
    await pleromaAuthStatusService.deleteStatus(
      statusRemoteId: status.remoteId!,
    );

    await statusRepository.markStatusAsDeleted(
      statusRemoteId: status.remoteId!,
    );
  }

  @override
  Future<IPleromaStatus> toggleEmojiReaction({
    required String emoji,
  }) async {
    var alreadyAdded;
    var foundEmojiReaction = pleromaEmojiReactions?.firstWhereOrNull(
      (emojiReaction) => emojiReaction.name == emoji,
    );

    if (foundEmojiReaction != null) {
      alreadyAdded = foundEmojiReaction.me;
    } else {
      alreadyAdded = false;
    }

    IPleromaStatus? remoteStatus;
    if (alreadyAdded) {
      remoteStatus = await pleromaStatusEmojiReactionService!.removeReaction(
        statusRemoteId: status.remoteId!,
        emoji: emoji,
      );
    } else {
      remoteStatus = await pleromaStatusEmojiReactionService!.addReaction(
        statusRemoteId: status.remoteId!,
        emoji: emoji,
      );
    }

    await statusRepository.upsertInRemoteType(
      remoteStatus,
    );

    return remoteStatus;
  }

  Future _updateByRemoteStatus(
    IPleromaStatus remoteStatus, {
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

    return await _updateByRemoteStatus(remoteStatus);
  }

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;

  @override
  bool get isPleroma => pleromaAuthStatusService.isPleroma;
}

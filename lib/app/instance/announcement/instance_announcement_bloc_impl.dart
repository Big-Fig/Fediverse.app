import 'package:collection/collection.dart';
import 'package:fedi/app/instance/announcement/instance_announcement_bloc.dart';
import 'package:fedi/app/instance/announcement/instance_announcement_model.dart';
import 'package:fedi/app/instance/announcement/repository/instance_announcement_repository.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/announcement/pleroma_api_announcement_model.dart';
import 'package:fedi/pleroma/api/announcement/pleroma_api_announcement_service.dart';
import 'package:fedi/pleroma/api/mention/pleroma_api_mention_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:fedi/pleroma/api/tag/pleroma_api_tag_model.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class InstanceAnnouncementBloc extends DisposableOwner
    implements IInstanceAnnouncementBloc {
  @override
  IInstanceAnnouncement get instanceAnnouncement =>
      _instanceAnnouncementSubject.value!;

  @override
  Stream<IInstanceAnnouncement> get instanceAnnouncementStream =>
      _instanceAnnouncementSubject.stream.distinct();

  static InstanceAnnouncementBloc createFromContext(
    BuildContext context,
    IInstanceAnnouncement instanceAnnouncement, {
    bool isNeedWatchLocalRepositoryForUpdates = true,
  }) =>
      InstanceAnnouncementBloc(
        pleromaApiAnnouncementService:
            IPleromaApiAnnouncementService.of(context, listen: false),
        instanceAnnouncementRepository:
            IInstanceAnnouncementRepository.of(context, listen: false),
        instanceAnnouncement: instanceAnnouncement,
        isNeedWatchLocalRepositoryForUpdates:
            isNeedWatchLocalRepositoryForUpdates,
      );

  final BehaviorSubject<IInstanceAnnouncement> _instanceAnnouncementSubject;

  final IPleromaApiAnnouncementService pleromaApiAnnouncementService;
  final IInstanceAnnouncementRepository instanceAnnouncementRepository;
  final bool isNeedWatchLocalRepositoryForUpdates;

  InstanceAnnouncementBloc({
    required this.pleromaApiAnnouncementService,
    required this.instanceAnnouncementRepository,
    required IInstanceAnnouncement instanceAnnouncement,
    this.isNeedWatchLocalRepositoryForUpdates = true,
    // todo: remove hack. Dont init when bloc quickly disposed. Help
    bool delayInit = true,
  }) : _instanceAnnouncementSubject =
            BehaviorSubject.seeded(instanceAnnouncement) {
    addDisposable(subject: _instanceAnnouncementSubject);
    if (delayInit) {
      Future.delayed(Duration(seconds: 1), () {
        _init(instanceAnnouncement);
      });
    } else {
      _init(instanceAnnouncement);
    }
  }

  void _init(IInstanceAnnouncement instanceAnnouncement) {
    if (!isDisposed) {
      if (isNeedWatchLocalRepositoryForUpdates) {
        addDisposable(
          streamSubscription: instanceAnnouncementRepository
              .watchByRemoteIdInAppType(instanceAnnouncement.remoteId)
              .listen(
            (updatedInstanceAnnouncement) {
              if (updatedInstanceAnnouncement != null) {
                _instanceAnnouncementSubject.add(updatedInstanceAnnouncement);
              }
            },
          ),
        );
      }
    }
  }

  @override
  String get remoteId => instanceAnnouncement.remoteId;

  @override
  bool get allDay => instanceAnnouncement.allDay;

  @override
  DateTime? get endsAt => instanceAnnouncement.endsAt;

  @override
  List<IPleromaApiAnnouncementReaction>? get reactions =>
      instanceAnnouncement.reactions;

  @override
  bool get read => instanceAnnouncement.read;

  @override
  DateTime? get scheduledAt => instanceAnnouncement.scheduledAt;

  @override
  DateTime? get startsAt => instanceAnnouncement.startsAt;

  @override
  String get content => instanceAnnouncement.content;

  @override
  DateTime get updatedAt => instanceAnnouncement.updatedAt;

  @override
  Future addEmojiReaction({
    required String emojiName,
  }) async {
    var foundReaction = reactions?.firstWhereOrNull(
      (reaction) => reaction.name == emojiName,
    );

    assert(foundReaction == null || !foundReaction.me);

    await pleromaApiAnnouncementService
        .addAnnouncementReaction(
      announcementId: instanceAnnouncement.remoteId,
      name: emojiName,
    )
        .then((_) {
      if (foundReaction != null) {
        foundReaction = foundReaction!.copyWith(
          count: foundReaction!.count + 1,
        );
      } else {
        foundReaction = PleromaApiAnnouncementReaction(
          name: emojiName,
          count: 1,
          me: true,
          url: null,
          staticUrl: null,
        );
      }

      var newReactionsList = reactions
              ?.where(
                (reaction) => reaction.name == foundReaction!.name,
              )
              .toList() ??
          [];

      newReactionsList.add(foundReaction!);

      updateReactions(newReactionsList);
    });
  }

  @override
  Future removeEmojiReaction({required String emojiName}) async {
    var foundReaction = reactions?.firstWhereOrNull(
      (reaction) => reaction.name == emojiName,
    );

    assert(foundReaction?.me == true);

    await pleromaApiAnnouncementService
        .removeAnnouncementReaction(
      announcementId: instanceAnnouncement.remoteId,
      name: emojiName,
    )
        .then((_) {
      // ignore: no-magic-number
      if (foundReaction!.count > 2) {
        foundReaction = foundReaction!.copyWith(
          count: foundReaction!.count - 1,
        );
      } else {
        foundReaction = null;
      }

      var newReactionsList = reactions
              ?.where(
                (reaction) => reaction.name == foundReaction!.name,
              )
              .toList() ??
          [];

      if (foundReaction != null) {
        newReactionsList.add(foundReaction!);
      }

      updateReactions(newReactionsList);
    });
  }

  @override
  Future dismiss() async {
    await pleromaApiAnnouncementService
        .dismissAnnouncement(
      announcementId: instanceAnnouncement.remoteId,
    )
        .then((_) {
      updateDismissed(true);
    });
  }

  @override
  Stream<List<IPleromaApiAnnouncementReaction>?> get reactionsStream =>
      instanceAnnouncementStream.map(
        (instanceAnnouncement) => instanceAnnouncement.reactions,
      );

  @override
  Stream<bool> get readStream => instanceAnnouncementStream.map(
        (instanceAnnouncement) => instanceAnnouncement.read,
      );

  Future updateReactions(
    List<IPleromaApiAnnouncementReaction> newReactionsList,
  ) async {
    var updatedInstanceAnnouncements = instanceAnnouncement.copyWith(
      reactions: newReactionsList,
    );
    _updateAnnouncement(updatedInstanceAnnouncements);
  }

  Future updateDismissed(
    bool dismissed,
  ) async {
    var updatedInstanceAnnouncements = instanceAnnouncement.copyWith(
      read: dismissed,
    );
    _updateAnnouncement(updatedInstanceAnnouncements);
  }

  void _updateAnnouncement(IInstanceAnnouncement updatedInstanceAnnouncements) {
    _instanceAnnouncementSubject.add(
      updatedInstanceAnnouncements,
    );
  }

  @override
  int? get localId => instanceAnnouncement.localId;

  @override
  List<IPleromaApiMention>? get mentions => instanceAnnouncement.mentions;

  @override
  DateTime get publishedAt => instanceAnnouncement.publishedAt;

  @override
  List<IPleromaApiStatus>? get statuses => instanceAnnouncement.statuses;

  @override
  List<IPleromaApiTag>? get tags => instanceAnnouncement.tags;
}

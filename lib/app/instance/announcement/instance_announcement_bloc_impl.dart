import 'package:collection/collection.dart';
import 'package:fedi/app/instance/announcement/instance_announcement_bloc.dart';
import 'package:fedi/app/instance/announcement/instance_announcement_model.dart';
import 'package:fedi/app/instance/announcement/repository/instance_announcement_repository.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/announcement/pleroma_api_announcement_model.dart';
import 'package:fedi/pleroma/api/announcement/pleroma_api_announcement_service.dart';
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

  final BehaviorSubject<bool> dismissedSubject;

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
    this.isNeedWatchLocalRepositoryForUpdates =
        true,
    // todo: remove hack. Dont init when bloc quickly disposed. Help
    bool delayInit = true,
    bool initialDismissed = false,
  })  : _instanceAnnouncementSubject =
            BehaviorSubject.seeded(instanceAnnouncement),
        dismissedSubject = BehaviorSubject.seeded(initialDismissed) {
    addDisposable(subject: _instanceAnnouncementSubject);
    addDisposable(subject: dismissedSubject);
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
  DateTime get createdAt => instanceAnnouncement.createdAt;

  @override
  DateTime? get endsAt => instanceAnnouncement.endsAt;

  @override
  bool get published => instanceAnnouncement.published;

  @override
  List<IPleromaApiAnnouncementReaction> get reactions =>
      instanceAnnouncement.reactions;

  @override
  bool get read => instanceAnnouncement.published;

  @override
  DateTime? get scheduledAt => instanceAnnouncement.scheduledAt;

  @override
  DateTime? get startsAt => instanceAnnouncement.startsAt;

  @override
  String get text => instanceAnnouncement.text;

  @override
  DateTime get updatedAt => instanceAnnouncement.updatedAt;

  @override
  Future addEmojiReaction({
    required String emojiName,
  }) async {
    var foundReaction = reactions.firstWhereOrNull(
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
          .where(
            (reaction) => reaction.name == foundReaction!.name,
          )
          .toList();

      newReactionsList.add(foundReaction!);

      updateReactions(newReactionsList);
    });
  }

  @override
  Future removeEmojiReaction({required String emojiName}) async {
    var foundReaction = reactions.firstWhereOrNull(
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
          .where(
            (reaction) => reaction.name == foundReaction!.name,
          )
          .toList();

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
      dismissedSubject.add(true);
    });
  }

  @override
  bool get dismissed => dismissedSubject.value!;

  @override
  Stream<bool> get dismissedStream => dismissedSubject.stream;

  @override
  Stream<bool> get publishedStream => instanceAnnouncementStream.map(
        (instanceAnnouncement) => instanceAnnouncement.published,
      );

  @override
  Stream<List<IPleromaApiAnnouncementReaction>> get reactionsStream =>
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
    _instanceAnnouncementSubject.add(
      instanceAnnouncement.copyWith(
        reactions: newReactionsList,
      ),
    );
  }

  @override
  int? get localId => instanceAnnouncement.localId;
}

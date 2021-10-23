import 'package:collection/collection.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/instance/announcement/instance_announcement_bloc.dart';
import 'package:fedi/app/instance/announcement/instance_announcement_model.dart';
import 'package:fedi/app/instance/announcement/repository/instance_announcement_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unifedi_api/unifedi_api.dart';

class InstanceAnnouncementBloc extends DisposableOwner
    implements IInstanceAnnouncementBloc {
  @override
  IInstanceAnnouncement get instanceAnnouncement =>
      _instanceAnnouncementSubject.value;

  @override
  Stream<IInstanceAnnouncement> get instanceAnnouncementStream =>
      _instanceAnnouncementSubject.stream.distinct();

  static InstanceAnnouncementBloc createFromContext(
    BuildContext context,
    IInstanceAnnouncement instanceAnnouncement, {
    bool isNeedWatchLocalRepositoryForUpdates = true,
  }) =>
      InstanceAnnouncementBloc(
        unifediApiAnnouncementService:
            Provider.of<IUnifediApiAnnouncementService>(context, listen: false),
        instanceAnnouncementRepository:
            IInstanceAnnouncementRepository.of(context, listen: false),
        instanceAnnouncement: instanceAnnouncement,
        isNeedWatchLocalRepositoryForUpdates:
            isNeedWatchLocalRepositoryForUpdates,
      );

  final BehaviorSubject<IInstanceAnnouncement> _instanceAnnouncementSubject;

  final IUnifediApiAnnouncementService unifediApiAnnouncementService;
  final IInstanceAnnouncementRepository instanceAnnouncementRepository;
  final bool isNeedWatchLocalRepositoryForUpdates;

  InstanceAnnouncementBloc({
    required this.unifediApiAnnouncementService,
    required this.instanceAnnouncementRepository,
    required IInstanceAnnouncement instanceAnnouncement,
    this.isNeedWatchLocalRepositoryForUpdates = true,
    // todo: remove hack. Dont init when bloc quickly disposed. Help
    bool delayInit = true,
  }) : _instanceAnnouncementSubject =
            BehaviorSubject.seeded(instanceAnnouncement) {
    _instanceAnnouncementSubject.disposeWith(this);
    if (delayInit) {
      Future.delayed(const Duration(seconds: 1), () {
        _init(instanceAnnouncement);
      });
    } else {
      _init(instanceAnnouncement);
    }
  }

  void _init(IInstanceAnnouncement instanceAnnouncement) {
    if (!isDisposed) {
      if (isNeedWatchLocalRepositoryForUpdates) {
        instanceAnnouncementRepository
            .watchByRemoteIdInAppType(instanceAnnouncement.remoteId)
            .listen(
          (updatedInstanceAnnouncement) {
            if (updatedInstanceAnnouncement != null) {
              _instanceAnnouncementSubject.add(updatedInstanceAnnouncement);
            }
          },
        ).disposeWith(this);
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
  List<IUnifediApiEmojiReaction>? get reactions =>
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
  Future<void> addEmojiReaction({
    required String emojiName,
  }) async {
    var foundReaction = reactions?.firstWhereOrNull(
      (reaction) => reaction.name == emojiName,
    );

    assert(
      foundReaction == null || !foundReaction.me,
      'cant add emoji if it is already added',
    );

    await unifediApiAnnouncementService.addAnnouncementReaction(
      announcementId: instanceAnnouncement.remoteId,
      name: emojiName,
    );
    if (foundReaction != null) {
      foundReaction = foundReaction.toUnifediApiEmojiReaction().copyWith(
            count: foundReaction.count + 1,
          );
    } else {
      foundReaction = UnifediApiEmojiReaction(
        name: emojiName,
        count: 1,
        me: true,
        url: null,
        staticUrl: null,
        accounts: null,
      );
    }

    var newReactionsList = reactions
            ?.where(
              (reaction) => reaction.name != foundReaction!.name,
            )
            .toList() ??
        []
      ..add(foundReaction);

    await updateReactions(newReactionsList);
  }

  @override
  Future<void> removeEmojiReaction({
    required String emojiName,
  }) async {
    var foundReaction = reactions?.firstWhereOrNull(
      (reaction) => reaction.name == emojiName,
    );

    assert(foundReaction?.me == true, 'cant remove when not added yet');

    await unifediApiAnnouncementService.removeAnnouncementReaction(
      announcementId: instanceAnnouncement.remoteId,
      name: emojiName,
    );

    var newReactionsList = reactions!.toList();

    // ignore: cascade_invocations, avoid-ignoring-return-values
    newReactionsList.remove(foundReaction);

    // ignore: no-magic-number
    if (foundReaction!.count > 2) {
      var newReaction = foundReaction.toUnifediApiEmojiReaction().copyWith(
            count: foundReaction.count - 1,
          );

      newReactionsList.add(newReaction);
    }

    await updateReactions(newReactionsList);
  }

  @override
  Future<void> dismiss() async {
    await unifediApiAnnouncementService.dismissAnnouncement(
      announcementId: instanceAnnouncement.remoteId,
    );
    await updateDismissed(true);
  }

  @override
  Stream<DateTime> get updatedAtStream => instanceAnnouncementStream.map(
        (instanceAnnouncement) => instanceAnnouncement.updatedAt,
      );

  @override
  Stream<List<IUnifediApiEmojiReaction>?> get reactionsStream =>
      instanceAnnouncementStream.map(
        (instanceAnnouncement) => instanceAnnouncement.reactions,
      );

  @override
  Stream<bool> get readStream => instanceAnnouncementStream.map(
        (instanceAnnouncement) => instanceAnnouncement.read,
      );

  Future<void> updateReactions(
    List<IUnifediApiEmojiReaction> newReactionsList,
  ) async {
    var dbInstanceAnnouncementPopulatedWrapper =
        instanceAnnouncement.toDbInstanceAnnouncementPopulatedWrapper();

    // todo: rework copy with
    var updatedInstanceAnnouncements =
        dbInstanceAnnouncementPopulatedWrapper.copyWith(
      dbInstanceAnnouncementPopulated: dbInstanceAnnouncementPopulatedWrapper
          .dbInstanceAnnouncementPopulated
          .copyWith(
        dbInstanceAnnouncement: dbInstanceAnnouncementPopulatedWrapper
            .dbInstanceAnnouncementPopulated.dbInstanceAnnouncement
            .copyWith(
          reactions: newReactionsList.toUnifediApiEmojiReactionList(),
        ),
      ),
    );
    await _updateAnnouncement(updatedInstanceAnnouncements);
  }

  // ignore: avoid_positional_boolean_parameters
  Future<void> updateDismissed(bool dismissed) async {
    var dbInstanceAnnouncementPopulatedWrapper =
        instanceAnnouncement.toDbInstanceAnnouncementPopulatedWrapper();

    // todo: rework copy with
    var updatedInstanceAnnouncements =
        dbInstanceAnnouncementPopulatedWrapper.copyWith(
      dbInstanceAnnouncementPopulated: dbInstanceAnnouncementPopulatedWrapper
          .dbInstanceAnnouncementPopulated
          .copyWith(
        dbInstanceAnnouncement: dbInstanceAnnouncementPopulatedWrapper
            .dbInstanceAnnouncementPopulated.dbInstanceAnnouncement
            .copyWith(
          read: dismissed,
        ),
      ),
    );
    await _updateAnnouncement(updatedInstanceAnnouncements);
  }

  Future<void> _updateAnnouncement(
    IInstanceAnnouncement updatedInstanceAnnouncements,
  ) async {
    await instanceAnnouncementRepository.updateByDbIdInDbType(
      dbId: updatedInstanceAnnouncements.localId!,
      dbItem: updatedInstanceAnnouncements.toDbInstanceAnnouncement(),
      batchTransaction: null,
    );
  }

  @override
  int? get localId => instanceAnnouncement.localId;

  @override
  List<IUnifediApiMention>? get mentions => instanceAnnouncement.mentions;

  @override
  DateTime get publishedAt => instanceAnnouncement.publishedAt;

  @override
  List<IUnifediApiStatus>? get statuses => instanceAnnouncement.statuses;

  @override
  List<IUnifediApiTag>? get tags => instanceAnnouncement.tags;

  @override
  Future<void> toggleEmojiReaction({
    required String emojiName,
  }) async {
    var found =
        reactions?.firstWhereOrNull((reaction) => reaction.name == emojiName);

    if (found != null) {
      await removeEmojiReaction(emojiName: emojiName);
    } else {
      await addEmojiReaction(emojiName: emojiName);
    }
  }
}

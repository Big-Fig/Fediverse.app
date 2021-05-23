import 'package:fedi/app/instance/announcement/instance_announcement_model.dart';
import 'package:fedi/app/instance/announcement/list/cached/instance_announcement_cached_list_bloc.dart';
import 'package:fedi/app/instance/announcement/repository/instance_announcement_repository.dart';
import 'package:fedi/app/instance/announcement/repository/instance_announcement_repository_model.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/api/announcement/pleroma_api_announcement_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:flutter/widgets.dart';

class InstanceAnnouncementCachedListBloc
    extends IInstanceAnnouncementCachedListBloc {
  final IPleromaApiAnnouncementService pleromaApiAnnouncementService;
  final IInstanceAnnouncementRepository instanceAnnouncementRepository;

  @override
  IPleromaApi get pleromaApi => pleromaApiAnnouncementService;

  InstanceAnnouncementCachedListBloc({
    required this.pleromaApiAnnouncementService,
    required this.instanceAnnouncementRepository,
  });

  @override
  Future<List<IInstanceAnnouncement>> loadLocalItems({
    required int? limit,
    required IInstanceAnnouncement? newerThan,
    required IInstanceAnnouncement? olderThan,
  }) {
    return instanceAnnouncementRepository.findAllInAppType(
      pagination: RepositoryPagination(
        olderThanItem: olderThan,
        newerThanItem: newerThan,
        limit: limit,
      ),
      filters: InstanceAnnouncementRepositoryFilters(
          // notExpired: false,
          ),
      orderingTerms: [
        InstanceAnnouncementOrderingTermData.updatedAtDesc,
      ],
    );
  }

  @override
  Future refreshItemsFromRemoteForPage({
    required int? limit,
    required IInstanceAnnouncement? newerThan,
    required IInstanceAnnouncement? olderThan,
  }) async {
    if (newerThan == null && olderThan == null) {
      // todo: don't exclude pleroma types on mastodon instances
      var remoteInstanceAnnouncements =
          await pleromaApiAnnouncementService.getAnnouncements(
              // pagination: PleromaApiPaginationRequest(
              // maxId: olderThan?.remoteId,
              // sinceId: newerThan?.remoteId,
              //   limit: limit,
              // ),
              );

      await instanceAnnouncementRepository.upsertAllInRemoteType(
        remoteInstanceAnnouncements,
        batchTransaction: null,
      );
      // ignore: no-empty-block
    } else {
      // nothing we don't support pagination
    }
  }

  static InstanceAnnouncementCachedListBloc createFromContext(
    BuildContext context,
  ) =>
      InstanceAnnouncementCachedListBloc(
        pleromaApiAnnouncementService: IPleromaApiAnnouncementService.of(
          context,
          listen: false,
        ),
        instanceAnnouncementRepository: IInstanceAnnouncementRepository.of(
          context,
          listen: false,
        ),
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) {
    return DisposableProvider<IInstanceAnnouncementCachedListBloc>(
      create: (context) => InstanceAnnouncementCachedListBloc.createFromContext(
        context,
      ),
      child: child,
    );
  }

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;
}

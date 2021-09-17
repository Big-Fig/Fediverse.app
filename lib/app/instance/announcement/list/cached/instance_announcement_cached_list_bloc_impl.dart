import 'package:fedi/app/instance/announcement/instance_announcement_model.dart';
import 'package:fedi/app/instance/announcement/list/cached/instance_announcement_cached_list_bloc.dart';
import 'package:fedi/app/instance/announcement/repository/instance_announcement_repository.dart';
import 'package:fedi/app/instance/announcement/repository/instance_announcement_repository_model.dart';
import 'package:fedi/app/instance/announcement/settings/instance_announcement_settings_model.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:easy_dispose/easy_dispose.dart';

class InstanceAnnouncementCachedListBloc
    extends IInstanceAnnouncementCachedListBloc {
  final IUnifediApiAnnouncementService unifediApiAnnouncementService;
  final IInstanceAnnouncementRepository instanceAnnouncementRepository;
  final BehaviorSubject<InstanceAnnouncementSettings>
      instanceAnnouncementSettingsSubject;

  @override
  InstanceAnnouncementSettings get instanceAnnouncementSettings =>
      instanceAnnouncementSettingsSubject.value;

  @override
  Stream<InstanceAnnouncementSettings> get instanceAnnouncementSettingsStream =>
      instanceAnnouncementSettingsSubject.stream;

  @override
  IUnifediApiService get unifediApi => unifediApiAnnouncementService;

  InstanceAnnouncementCachedListBloc({
    required this.unifediApiAnnouncementService,
    required this.instanceAnnouncementRepository,
    required InstanceAnnouncementSettings instanceAnnouncementSettings,
  }) : instanceAnnouncementSettingsSubject =
            BehaviorSubject.seeded(instanceAnnouncementSettings) {
    instanceAnnouncementSettingsSubject.disposeWith(this);
  }

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
        withDismissed: instanceAnnouncementSettings.withDismissed,
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
      var remoteInstanceAnnouncements =
          await unifediApiAnnouncementService.getAnnouncements(
        withDismissed: instanceAnnouncementSettings.withDismissed,
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
    BuildContext context, {
    required InstanceAnnouncementSettings instanceAnnouncementSettings,
  }) =>
      InstanceAnnouncementCachedListBloc(
        unifediApiAnnouncementService:
            Provider.of<IUnifediApiAnnouncementService>(
          context,
          listen: false,
        ),
        instanceAnnouncementRepository: IInstanceAnnouncementRepository.of(
          context,
          listen: false,
        ),
        instanceAnnouncementSettings: instanceAnnouncementSettings,
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
    required InstanceAnnouncementSettings instanceAnnouncementSettings,
  }) {
    return DisposableProvider<IInstanceAnnouncementCachedListBloc>(
      create: (context) => InstanceAnnouncementCachedListBloc.createFromContext(
        context,
        instanceAnnouncementSettings: instanceAnnouncementSettings,
      ),
      child: child,
    );
  }

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;

  @override
  Future changeInstanceAnnouncementSettings(
    InstanceAnnouncementSettings settings,
  ) async {
    if (instanceAnnouncementSettings != settings) {
      instanceAnnouncementSettingsSubject.add(settings);
    }
  }
}

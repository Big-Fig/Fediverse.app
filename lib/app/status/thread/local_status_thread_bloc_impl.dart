import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/app/filter/repository/filter_repository.dart';
import 'package:fedi/app/filter/repository/filter_repository_model.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/thread/status_thread_bloc_impl.dart';
import 'package:fedi/mastodon/api/filter/mastodon_api_filter_model.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_service.dart';
import 'package:flutter/widgets.dart';
import 'package:pedantic/pedantic.dart';

class LocalStatusThreadBloc extends StatusThreadBloc {
  final IStatusRepository statusRepository;
  final IFilterRepository filterRepository;

  LocalStatusThreadBloc({
    required this.statusRepository,
    required this.filterRepository,
    required IStatus initialStatusToFetchThread,
    required IPleromaApiMediaAttachment? initialMediaAttachment,
    required IPleromaApiStatusService pleromaStatusService,
  }) : super(
    pleromaStatusService: pleromaStatusService,
    initialStatusToFetchThread: initialStatusToFetchThread,
    initialMediaAttachment: initialMediaAttachment,
  );

  static LocalStatusThreadBloc createFromContext(
      BuildContext context, {
        required IStatus initialStatusToFetchThread,
        required IPleromaApiMediaAttachment? initialMediaAttachment,
      }) =>
      LocalStatusThreadBloc(
        initialStatusToFetchThread: initialStatusToFetchThread,
        initialMediaAttachment: initialMediaAttachment,
        pleromaStatusService: IPleromaApiStatusService.of(
          context,
          listen: false,
        ),
        statusRepository: IStatusRepository.of(
          context,
          listen: false,
        ),
        filterRepository: IFilterRepository.of(
          context,
          listen: false,
        ),
      );

  FilterRepositoryFilters get filterRepositoryFilters =>
      FilterRepositoryFilters(
        onlyWithContextTypes: [
          MastodonApiFilterContextType.thread,
        ],
        notExpired: true,
      );

  @override
  Future<List<IFilter>> loadFilters() async {
    var filters = await filterRepository.findAllInAppType(
      filters: filterRepositoryFilters,
      pagination: null,
      orderingTerms: null,
    );

    return filters;
  }

  @override
  Stream<List<IFilter>> watchFilters() =>
      filterRepository.watchFindAllInAppType(
        filters: filterRepositoryFilters,
        pagination: null,
        orderingTerms: null,
      );

  @override
  void onInitialStatusUpdated(IPleromaApiStatus updatedStartRemoteStatus) {
    unawaited(
      statusRepository.updateAppTypeByRemoteType(
        appItem: initialStatusToFetchThread,
        remoteItem: updatedStartRemoteStatus,
        batchTransaction: null,
      ),
    );
  }

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
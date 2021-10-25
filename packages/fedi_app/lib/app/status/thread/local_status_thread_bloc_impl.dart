import 'package:fedi_app/app/filter/filter_model.dart';
import 'package:fedi_app/app/filter/repository/filter_repository.dart';
import 'package:fedi_app/app/filter/repository/filter_repository_model.dart';
import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:fedi_app/app/status/repository/status_repository.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/app/status/thread/status_thread_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class LocalStatusThreadBloc extends StatusThreadBloc {
  final IStatusRepository statusRepository;
  final IFilterRepository filterRepository;

  LocalStatusThreadBloc({
    required this.statusRepository,
    required this.filterRepository,
    required IStatus initialStatusToFetchThread,
    required IUnifediApiMediaAttachment? initialMediaAttachment,
    required IUnifediApiStatusService unifediApiStatusService,
  }) : super(
          unifediApiStatusService: unifediApiStatusService,
          initialStatusToFetchThread: initialStatusToFetchThread,
          initialMediaAttachment: initialMediaAttachment,
        );

  static LocalStatusThreadBloc createFromContext(
    BuildContext context, {
    required IStatus initialStatusToFetchThread,
    required IUnifediApiMediaAttachment? initialMediaAttachment,
  }) =>
      LocalStatusThreadBloc(
        initialStatusToFetchThread: initialStatusToFetchThread,
        initialMediaAttachment: initialMediaAttachment,
        unifediApiStatusService: Provider.of<IUnifediApiStatusService>(
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
      const FilterRepositoryFilters(
        onlyWithContextTypes: [
          UnifediApiFilterContextType.threadValue,
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
  void onInitialStatusUpdated(IUnifediApiStatus updatedStartRemoteStatus) {
    // ignore: unawaited_futures
    statusRepository.updateAppTypeByRemoteType(
      appItem: initialStatusToFetchThread,
      remoteItem: updatedStartRemoteStatus,
      batchTransaction: null,
    );
  }

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;
}

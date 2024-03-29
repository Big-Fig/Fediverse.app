import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/access/current/current_access_bloc.dart';
import 'package:fedi_app/app/filter/create/create_filter_bloc.dart';
import 'package:fedi_app/app/filter/edit/edit_filter_bloc.dart';
import 'package:fedi_app/app/filter/edit/edit_filter_bloc_impl.dart';
import 'package:fedi_app/app/filter/edit/edit_filter_bloc_proxy_provider.dart';
import 'package:fedi_app/app/filter/filter_model.dart';
import 'package:fedi_app/app/home/tab/timelines/storage/timelines_home_tab_storage_bloc.dart';
import 'package:fedi_app/app/status/repository/status_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class CreateFilterBloc extends EditFilterBloc implements ICreateFilterBloc {
  static CreateFilterBloc createFromContext(
    BuildContext context, {
    required Function(IFilter)? onSubmit,
  }) {
    var createFilterBloc = CreateFilterBloc(
      unifediApiFilterService: Provider.of<IUnifediApiFilterService>(
        context,
        listen: false,
      ),
      statusRepository: IStatusRepository.of(context, listen: false),
      timelinesHomeTabStorageBloc: ITimelinesHomeTabStorageBloc.of(
        context,
        listen: false,
      ),
      currentInstance: ICurrentAccessBloc.of(
        context,
        listen: false,
      ).currentInstance!,
    );

    if (onSubmit != null) {
      createFilterBloc.submittedStream
          .listen(onSubmit)
          .disposeWith(createFilterBloc);
    }

    return createFilterBloc;
  }

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
    required Function(IFilter) onSubmit,
  }) =>
      DisposableProvider<ICreateFilterBloc>(
        create: (context) => CreateFilterBloc.createFromContext(
          context,
          onSubmit: onSubmit,
        ),
        child: ProxyProvider<ICreateFilterBloc, IEditFilterBloc>(
          update: (context, value, previous) => value,
          child: EditFilterBlocProxyProvider(
            child: child,
          ),
        ),
      );

  @override
  Future<IUnifediApiFilter> actuallySubmitFilter(
    String? filterRemoteId,
    IUnifediApiPostFilter postFilter,
  ) async {
    var remoteFilter = await unifediApiFilterService.createFilter(
      postFilter: postFilter,
    );

    return remoteFilter;
  }

  CreateFilterBloc({
    required IUnifediApiFilterService unifediApiFilterService,
    required IStatusRepository statusRepository,
    required ITimelinesHomeTabStorageBloc timelinesHomeTabStorageBloc,
    required UnifediApiAccess currentInstance,
  }) : super(
          isPossibleToDelete: false,
          unifediApiFilterService: unifediApiFilterService,
          statusRepository: statusRepository,
          filter: null,
          timelinesHomeTabStorageBloc: timelinesHomeTabStorageBloc,
          currentInstance: currentInstance,
        );
}

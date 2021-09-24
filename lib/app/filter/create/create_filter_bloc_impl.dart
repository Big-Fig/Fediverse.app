import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';

import 'package:fedi/app/access/current/current_access_bloc.dart';
import 'package:fedi/app/filter/create/create_filter_bloc.dart';
import 'package:fedi/app/filter/edit/edit_filter_bloc.dart';
import 'package:fedi/app/filter/edit/edit_filter_bloc_impl.dart';
import 'package:fedi/app/filter/edit/edit_filter_bloc_proxy_provider.dart';
import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_bloc.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:easy_dispose/easy_dispose.dart';

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
      unifediApiAccountService: Provider.of<IUnifediApiAccountService>(
        context,
        listen: false,
      ),
      myAccountBloc: IMyAccountBloc.of(
        context,
        listen: false,
      ),
      accountRepository: IAccountRepository.of(
        context,
        listen: false,
      ),
      timelinesHomeTabStorageBloc: ITimelinesHomeTabStorageBloc.of(
        context,
        listen: false,
      ),
      currentInstance: ICurrentUnifediApiAccessBloc.of(
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
  }) {
    return DisposableProvider<ICreateFilterBloc>(
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
  }

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
    required IMyAccountBloc myAccountBloc,
    required IAccountRepository accountRepository,
    required IUnifediApiAccountService unifediApiAccountService,
    required ITimelinesHomeTabStorageBloc timelinesHomeTabStorageBloc,
    required UnifediApiAccess currentInstance,
  }) : super(
          isPossibleToDelete: false,
          unifediApiFilterService: unifediApiFilterService,
          statusRepository: statusRepository,
          filter: null,
          myAccountBloc: myAccountBloc,
          accountRepository: accountRepository,
          unifediApiAccountService: unifediApiAccountService,
          timelinesHomeTabStorageBloc: timelinesHomeTabStorageBloc,
          currentInstance: currentInstance,
        );
}

import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/filter/create/create_filter_bloc.dart';
import 'package:fedi/app/filter/edit/edit_filter_bloc.dart';
import 'package:fedi/app/filter/edit/edit_filter_bloc_impl.dart';
import 'package:fedi/app/filter/edit/edit_filter_bloc_proxy_provider.dart';
import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_bloc.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/filter/pleroma_filter_model.dart';
import 'package:fedi/pleroma/filter/pleroma_filter_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CreateFilterBloc extends EditFilterBloc implements ICreateFilterBloc {
  static CreateFilterBloc createFromContext(
    BuildContext context, {
    required Function(IFilter)? onSubmit,
  }) {
    var createFilterBloc = CreateFilterBloc(
      pleromaFilterService: IPleromaFilterService.of(
        context,
        listen: false,
      ),
      statusRepository: IStatusRepository.of(context, listen: false),
      pleromaAccountService: IPleromaAccountService.of(
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
      currentInstance: ICurrentAuthInstanceBloc.of(
        context,
        listen: false,
      ).currentInstance!,
    );

    if (onSubmit != null) {
      createFilterBloc.addDisposable(
        streamSubscription: createFilterBloc.submittedStream.listen(onSubmit),
      );
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
  Future<IPleromaFilter> actuallySubmitFilter(
    String? listRemoteId,
    IPostPleromaFilter postPleromaFilter,
  ) async {
    var remoteFilter = await pleromaFilterService.createFilter(
      postPleromaFilter: postPleromaFilter,
    );

    return remoteFilter;
  }

  CreateFilterBloc({
    required IPleromaFilterService pleromaFilterService,
    required IStatusRepository statusRepository,
    required IMyAccountBloc myAccountBloc,
    required IAccountRepository accountRepository,
    required IPleromaAccountService pleromaAccountService,
    required ITimelinesHomeTabStorageBloc timelinesHomeTabStorageBloc,
    required AuthInstance currentInstance,
  }) : super(
          isPossibleToDelete: false,
          pleromaFilterService: pleromaFilterService,
          statusRepository: statusRepository,
          filter: null,
          myAccountBloc: myAccountBloc,
          accountRepository: accountRepository,
          pleromaAccountService: pleromaAccountService,
          timelinesHomeTabStorageBloc: timelinesHomeTabStorageBloc,
          currentInstance: currentInstance,
        );
}

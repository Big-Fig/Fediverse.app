import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/custom_list/create/create_custom_list_bloc.dart';
import 'package:fedi/app/custom_list/custom_list_model.dart';
import 'package:fedi/app/custom_list/custom_list_model_adapter.dart';
import 'package:fedi/app/custom_list/edit/edit_custom_list_bloc.dart';
import 'package:fedi/app/custom_list/edit/edit_custom_list_bloc_impl.dart';
import 'package:fedi/app/custom_list/edit/edit_custom_list_bloc_proxy_provider.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_bloc.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class CreateCustomListBloc extends EditCustomListBloc
    implements ICreateCustomListBloc {
  static CreateCustomListBloc createFromContext(
    BuildContext context, {
    required Function(ICustomList)? onSubmit,
  }) {
    var createCustomListBloc = CreateCustomListBloc(
      connectionService: Provider.of<IConnectionService>(
        context,
        listen: false,
      ),
      unifediListService: Provider.of<IUnifediApiListService>(
        context,
        listen: false,
      ),
      statusRepository: IStatusRepository.of(context, listen: false),
      unifediAuthAccountService: Provider.of<IUnifediApiAccountService>(
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
      paginationSettingsBloc: IPaginationSettingsBloc.of(
        context,
        listen: false,
      ),
    );

    if (onSubmit != null) {
      createCustomListBloc.submittedStream
          .listen(onSubmit)
          .disposeWith(createCustomListBloc);
    }

    return createCustomListBloc;
  }

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
    required Function(ICustomList) onSubmit,
  }) =>
      DisposableProvider<ICreateCustomListBloc>(
        create: (context) => CreateCustomListBloc.createFromContext(
          context,
          onSubmit: onSubmit,
        ),
        child: ProxyProvider<ICreateCustomListBloc, IEditCustomListBloc>(
          update: (context, value, previous) => value,
          child: EditCustomListBlocProxyProvider(
            child: child,
          ),
        ),
      );

  @override
  Future<ICustomList> submit() async {
    var unifediList = await unifediListService.createList(
      title: customListFormBloc.titleField.currentValue,
      repliesPolicy: null,
    );
    var localCustomList = unifediList.toCustomList();
    submittedStreamController.add(localCustomList);

    return localCustomList;
  }

  CreateCustomListBloc({
    required IUnifediApiListService unifediListService,
    required IStatusRepository statusRepository,
    required IMyAccountBloc myAccountBloc,
    required IAccountRepository accountRepository,
    required IUnifediApiAccountService unifediAuthAccountService,
    required ITimelinesHomeTabStorageBloc timelinesHomeTabStorageBloc,
    required IPaginationSettingsBloc paginationSettingsBloc,
    required IConnectionService connectionService,
  }) : super(
          connectionService: connectionService,
          isPossibleToDelete: false,
          unifediListService: unifediListService,
          statusRepository: statusRepository,
          customList: null,
          myAccountBloc: myAccountBloc,
          accountRepository: accountRepository,
          unifediAuthAccountService: unifediAuthAccountService,
          timelinesHomeTabStorageBloc: timelinesHomeTabStorageBloc,
          paginationSettingsBloc: paginationSettingsBloc,
        );
}

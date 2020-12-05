import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/custom_list/create/create_custom_list_bloc.dart';
import 'package:fedi/app/custom_list/custom_list_model.dart';
import 'package:fedi/app/custom_list/custom_list_model_adapter.dart';
import 'package:fedi/app/custom_list/edit/edit_custom_list_bloc.dart';
import 'package:fedi/app/custom_list/edit/edit_custom_list_bloc_impl.dart';
import 'package:fedi/app/custom_list/edit/edit_custom_list_bloc_proxy_provider.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_bloc.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/list/pleroma_list_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CreateCustomListBloc extends EditCustomListBloc
    implements ICreateCustomListBloc {
  static CreateCustomListBloc createFromContext(
    BuildContext context, {
    @required Function(ICustomList) onSubmit,
  }) {
    var createCustomListBloc = CreateCustomListBloc(
        pleromaListService: IPleromaListService.of(
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
        ));

    if (onSubmit != null) {
      createCustomListBloc.addDisposable(
        streamSubscription:
            createCustomListBloc.submittedStream.listen(onSubmit),
      );
    }

    return createCustomListBloc;
  }

  static Widget provideToContext(
    BuildContext context, {
    @required Widget child,
    @required Function(ICustomList) onSubmit,
  }) {
    return DisposableProvider<ICreateCustomListBloc>(
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
  }

  @override
  Future<ICustomList> submit() async {
    var remoteList = await pleromaListService.createList(
        title: customListFormBloc.titleField.currentValue);
    var localCustomList = mapRemoteListToLocalCustomList(remoteList);
    submittedStreamController.add(localCustomList);
    return localCustomList;
  }

  CreateCustomListBloc({
    @required IPleromaListService pleromaListService,
    @required IStatusRepository statusRepository,
    @required IMyAccountBloc myAccountBloc,
    @required IAccountRepository accountRepository,
    @required IPleromaAccountService pleromaAccountService,
    @required ITimelinesHomeTabStorageBloc timelinesHomeTabStorageBloc,
  }) : super(
          isPossibleToDelete: false,
          pleromaListService: pleromaListService,
          statusRepository: statusRepository,
          customList: null,
          myAccountBloc: myAccountBloc,
          accountRepository: accountRepository,
          pleromaAccountService: pleromaAccountService,
          timelinesHomeTabStorageBloc: timelinesHomeTabStorageBloc,
        );
}

import 'package:fedi/app/custom_list/create/create_custom_list_bloc.dart';
import 'package:fedi/app/custom_list/custom_list_model.dart';
import 'package:fedi/app/custom_list/custom_list_model_adapter.dart';
import 'package:fedi/app/custom_list/edit/edit_custom_list_bloc.dart';
import 'package:fedi/app/custom_list/edit/edit_custom_list_bloc_impl.dart';
import 'package:fedi/app/custom_list/edit/edit_custom_list_bloc_proxy_provider.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/list/pleroma_list_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CreateCustomListBloc extends EditCustomListBloc
    implements ICreateCustomListBloc {
  static CreateCustomListBloc createFromContext(BuildContext context,
          {@required VoidCallback successCallback}) =>
      CreateCustomListBloc(
        pleromaListService: IPleromaListService.of(
          context,
          listen: false,
        ),
        statusRepository: IStatusRepository.of(context, listen: false),
        successCallback: successCallback,
      );

  static Widget provideToContext(BuildContext context,
      {@required Widget child, @required VoidCallback successCallback}) {
    return DisposableProvider<ICreateCustomListBloc>(
      create: (context) => CreateCustomListBloc.createFromContext(
        context,
        successCallback: successCallback,
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
    successCallback();
    return localCustomList;
  }

  CreateCustomListBloc({
    @required IPleromaListService pleromaListService,
    @required IStatusRepository statusRepository,
    @required VoidCallback successCallback,
  }) : super(
          pleromaListService: pleromaListService,
          statusRepository: statusRepository,
          initialValue: null,
          successCallback: successCallback,
        );
}

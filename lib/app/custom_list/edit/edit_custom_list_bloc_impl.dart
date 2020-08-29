import 'package:fedi/app/custom_list/accounts/custom_list_account_network_only_list_bloc.dart';
import 'package:fedi/app/custom_list/accounts/custom_list_account_network_only_list_bloc_impl.dart';
import 'package:fedi/app/custom_list/custom_list_model.dart';
import 'package:fedi/app/custom_list/custom_list_model_adapter.dart';
import 'package:fedi/app/custom_list/edit/edit_custom_list_bloc.dart';
import 'package:fedi/app/custom_list/edit/edit_custom_list_bloc_proxy_provider.dart';
import 'package:fedi/app/custom_list/form/custom_list_form_bloc.dart';
import 'package:fedi/app/custom_list/form/custom_list_form_bloc_impl.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/list/pleroma_list_service.dart';
import 'package:flutter/widgets.dart';

class EditCustomListBloc extends DisposableOwner
    implements IEditCustomListBloc {

  final VoidCallback successCallback;

  static EditCustomListBloc createFromContext(
    BuildContext context, {
    @required ICustomList initialValue,
        @required VoidCallback successCallback,
  }) =>
      EditCustomListBloc(
        initialValue: initialValue,
        statusRepository: IStatusRepository.of(context, listen: false),
        pleromaListService: IPleromaListService.of(
          context,
          listen: false,
        ),
          successCallback:successCallback,
      );

  static Widget provideToContext(
    BuildContext context, {
    @required Widget child,
    @required ICustomList initialValue,
    @required VoidCallback successCallback,
  }) {
    return DisposableProvider<IEditCustomListBloc>(
      create: (context) => EditCustomListBloc.createFromContext(
        context,
        initialValue: initialValue,
        successCallback:successCallback,
      ),
      child: EditCustomListBlocProxyProvider(child: child),
    );
  }

  final ICustomList initialValue;

  final IPleromaListService pleromaListService;

  @override
  final ICustomListAccountNetworkOnlyListBloc customListAccountListBloc;

  @override
  final ICustomListFormBloc customListFormBloc;

  EditCustomListBloc({
    @required this.initialValue,
    @required this.pleromaListService,
    @required this.successCallback,
    @required IStatusRepository statusRepository,
  })  : customListAccountListBloc = CustomListAccountNetworkOnlyListBloc(
          pleromaListService: pleromaListService,
          customList: initialValue,
          statusRepository: statusRepository,
        ),
        customListFormBloc =
            CustomListFormBloc(initialTitleValue: initialValue?.title);

  @override
  bool get isReadyToSubmit => customListFormBloc.isReadyToSubmit;

  @override
  Stream<bool> get isReadyToSubmitStream =>
      customListFormBloc.isReadyToSubmitStream;

  @override
  Future<ICustomList> submit() async {
    var remoteList = await pleromaListService.updateList(
        listRemoteId: initialValue.remoteId,
        title: customListFormBloc.titleField.currentValue);

    var localCustomList = mapRemoteListToLocalCustomList(remoteList);
    successCallback();
    return localCustomList;
  }
}

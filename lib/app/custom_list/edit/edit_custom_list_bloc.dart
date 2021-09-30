import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/account/pagination/network_only/account_network_only_pagination_bloc.dart';
import 'package:fedi/app/account/select/select_account_list_bloc.dart';
import 'package:fedi/app/custom_list/account_list/network_only/custom_list_account_list_network_only_list_bloc.dart';
import 'package:fedi/app/custom_list/custom_list_model.dart';
import 'package:fedi/app/custom_list/edit/account_list/edit_custom_list_account_list_pagination_list_bloc.dart';
import 'package:fedi/app/custom_list/form/custom_list_form_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditCustomListBloc extends IDisposable {
  static IEditCustomListBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IEditCustomListBloc>(context, listen: listen);

  bool get isListContainsAccounts;

  Stream<bool> get isListContainsAccountsStream;

  ICustomListAccountListNetworkOnlyListBloc
      get customListAccountListNetworkOnlyListBloc;

  IAccountNetworkOnlyPaginationBloc
      get customListAccountListNetworkOnlyPaginationBloc;

  IEditCustomListAccountListPaginationListBloc
      get editCustomListAccountListPaginationListBloc;

  ISelectAccountListBloc get selectAccountListBloc;

  ICustomListFormBloc get customListFormBloc;

  bool get isReadyToSubmit;

  Stream<bool> get isReadyToSubmitStream;

  Future<ICustomList> submit();

  Future deleteList();

  Stream<ICustomList> get submittedStream;

  Stream get deletedStream;

  bool get isPossibleToDelete;
}

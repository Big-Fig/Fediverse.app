import 'package:fedi/app/custom_list/accounts/custom_list_account_network_only_list_bloc.dart';
import 'package:fedi/app/custom_list/custom_list_model.dart';
import 'package:fedi/app/custom_list/form/custom_list_form_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditCustomListBloc extends IDisposable {
  static IEditCustomListBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IEditCustomListBloc>(context, listen: listen);

  ICustomListAccountNetworkOnlyListBloc get customListAccountListBloc;

  ICustomListFormBloc get customListFormBloc;

  bool get isReadyToSubmit;
  Stream<bool> get isReadyToSubmitStream;

  Future<ICustomList> submit();
}

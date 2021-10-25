import 'package:fedi_app/app/account/statuses/account_statuses_tab_model.dart';
import 'package:fedi_app/app/home/tab/home_tab_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

abstract class IAccountHomeTabBloc extends IHomeTabBloc {
  static IAccountHomeTabBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IAccountHomeTabBloc>(context, listen: listen);

  List<AccountStatusesTab> get tabs;
}

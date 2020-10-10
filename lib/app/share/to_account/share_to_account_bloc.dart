import 'package:fedi/app/share/select/share_select_account_bloc.dart';
import 'package:fedi/app/share/share_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IShareToAccountBloc extends IShareBloc {
  static IShareToAccountBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IShareToAccountBloc>(context, listen: listen);

  IShareSelectAccountBloc get shareSelectAccountBloc;
}
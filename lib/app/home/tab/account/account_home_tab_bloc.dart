import 'package:fedi/app/home/tab/home_tab_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

abstract class IAccountHomeTabBloc extends IHomeTabBloc {
  static IAccountHomeTabBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IAccountHomeTabBloc>(context, listen: listen);
}

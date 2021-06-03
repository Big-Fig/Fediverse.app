import 'package:fedi/app/home/tab/home_tab_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

abstract class INotificationsHomeTabBloc implements IHomeTabBloc {
  static INotificationsHomeTabBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<INotificationsHomeTabBloc>(context, listen: listen);

  Future dismissAll();

  Future markAllAsRead();
}

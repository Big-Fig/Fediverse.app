import 'package:fedi/refactored/app/home/home_model.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAppHomeBloc implements Disposable {
  static IAppHomeBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IAppHomeBloc>(context, listen: listen);

  AppHomeTab get selectedTab;

  Stream<AppHomeTab> get selectedTabStream;

  void selectTab(AppHomeTab tab);
}

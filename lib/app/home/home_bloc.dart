import 'package:fedi/app/home/home_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IHomeBloc implements Disposable {
  static IHomeBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IHomeBloc>(context, listen: listen);

  HomeTab get selectedTab;
  List<HomeTab> get tabs;

  Stream<HomeTab> get selectedTabStream;

  void selectTab(HomeTab tab);
}

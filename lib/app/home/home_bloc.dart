import 'package:fedi/app/home/home_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IHomeBloc implements IDisposable {
  static IHomeBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IHomeBloc>(context, listen: listen);

  List<HomeTab> get tabs;

  HomeTab get selectedTab;

  Stream<HomeTab> get selectedTabStream;

  Stream<HomeTab> get reselectedTabStream;
  Stream<bool> get selectedTabReselectedStream;

  bool get isTimelinesUnread;
  Stream<bool> get isTimelinesUnreadStream;

  void selectTab(HomeTab tab);

  void updateTimelinesUnread(bool bool);
}

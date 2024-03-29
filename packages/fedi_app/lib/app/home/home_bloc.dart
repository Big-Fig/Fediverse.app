import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/home/home_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IHomeBloc implements IDisposable {
  static IHomeBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IHomeBloc>(context, listen: listen);

  List<HomeTab> get tabs;

  HomeTab? get selectedTab;

  Stream<HomeTab?> get selectedTabStream;

  Stream<HomeTab?> get reselectedTabStream;

  Stream<bool> get selectedTabReselectedStream;

  bool? get isTimelinesUnread;

  Stream<bool> get isTimelinesUnreadStream;

  void selectTab(HomeTab tab);

  void updateIsAnyTimelinesUnread({
    required bool anyTimelineUnread,
  });
}

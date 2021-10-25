import 'package:fedi_app/app/home/tab/home_tab_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ITimelinesHomeTabBloc extends IHomeTabBloc {
  static ITimelinesHomeTabBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ITimelinesHomeTabBloc>(context, listen: listen);
}

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ITimelinePaginationBloc {
  static ITimelinePaginationBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ITimelinePaginationBloc>(context, listen: listen);
}
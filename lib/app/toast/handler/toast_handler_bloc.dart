import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IToastHandlerBloc implements IDisposable {
  static IToastHandlerBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IToastHandlerBloc>(context, listen: listen);

}

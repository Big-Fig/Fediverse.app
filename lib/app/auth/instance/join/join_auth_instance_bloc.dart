import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IJoinAuthInstanceBloc implements IDisposable {
  static IJoinAuthInstanceBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IJoinAuthInstanceBloc>(context, listen: listen);

  TextEditingController get hostTextController;
}

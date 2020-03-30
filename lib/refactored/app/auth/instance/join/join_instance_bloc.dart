import 'package:fedi/refactored/app/auth/instance/instance_model.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IJoinInstanceBloc implements Disposable {
  static IJoinInstanceBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IJoinInstanceBloc>(context, listen: listen);

  TextEditingController get hostTextController;


}

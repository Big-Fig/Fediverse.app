import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICustomSwitchBloc extends Disposable {

  static ICustomSwitchBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ICustomSwitchBloc>(context, listen: listen);


  bool get currentValue;

  Stream<bool> get currentValueStream;

  void changeValue(bool value);
}

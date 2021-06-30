import 'package:easy_dispose/easy_dispose.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICustomSwitchBloc extends IDisposable {

  static ICustomSwitchBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ICustomSwitchBloc>(context, listen: listen);


  bool? get currentValue;

  Stream<bool> get currentValueStream;

  void changeValue(bool value);
}

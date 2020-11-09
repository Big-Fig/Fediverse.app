import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

abstract class IAccountHeaderBloc implements IDisposable {
  static IAccountHeaderBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IAccountHeaderBloc>(context, listen: listen);

  Brightness get brightness;
}

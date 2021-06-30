import 'package:easy_dispose/easy_dispose.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IFediBoolBadgeBloc implements IDisposable {
  static IFediBoolBadgeBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IFediBoolBadgeBloc>(context, listen: listen);

  Stream<bool> get badgeStream;
}

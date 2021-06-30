import 'package:easy_dispose/easy_dispose.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IFediIntBadgeBloc implements IDisposable {
  static IFediIntBadgeBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IFediIntBadgeBloc>(context, listen: listen);

  Stream<int> get badgeStream;
}

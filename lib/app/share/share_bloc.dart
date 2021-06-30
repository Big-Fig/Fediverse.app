import 'package:easy_dispose/easy_dispose.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IShareBloc extends IDisposable {
  static IShareBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IShareBloc>(context, listen: listen);

  Future share();

  bool get isPossibleToShare;

  Stream<bool> get isPossibleToShareStream;
}

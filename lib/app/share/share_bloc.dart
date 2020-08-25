import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IShareBloc extends Disposable {
  static IShareBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IShareBloc>(context, listen: listen);
  Future share();

  bool get isPossibleToShare;
  Stream<bool> get isPossibleToShareStream;
}

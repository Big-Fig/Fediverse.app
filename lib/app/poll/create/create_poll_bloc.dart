import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICreatePollBloc implements Disposable {

  static ICreatePollBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ICreatePollBloc>(context, listen: listen);
}

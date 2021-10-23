import 'package:easy_dispose/easy_dispose.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IInstanceBloc implements IDisposable {
  static IInstanceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IInstanceBloc>(
        context,
        listen: listen,
      );

  bool get isPleroma;

  bool get isMastodon;

  Uri get instanceUri;

  IUnifediApiInstance? get instance;

  Stream<IUnifediApiInstance?> get instanceStream;
}

extension IInstanceBlocExtension on IInstanceBloc {
  String get instanceUriDomain => instanceUri.host;
}

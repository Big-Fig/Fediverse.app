import 'package:easy_dispose/easy_dispose.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IInstanceBloc implements IDisposable {
  static IInstanceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IInstanceBloc>(context, listen: listen);

  bool get isPleroma;

  bool get isMastodon;

  Uri get instanceUri;

  IPleromaApiInstance? get instance;

  Stream<IPleromaApiInstance?> get instanceStream;
}

extension IInstanceBlocExtension on IInstanceBloc {
  String get instanceUriDomain => instanceUri.host;
}

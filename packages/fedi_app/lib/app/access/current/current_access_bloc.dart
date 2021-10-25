import 'package:easy_dispose/easy_dispose.dart';

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class ICurrentAccessBloc implements IDisposable {
  bool get isSupportChats;

  static ICurrentAccessBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<ICurrentAccessBloc>(
        context,
        listen: listen,
      );

  UnifediApiAccess? get currentInstance;

  Stream<UnifediApiAccess?> get currentInstanceStream;

  Future<void> changeCurrentInstance(UnifediApiAccess instance);

  bool isCurrentInstance(UnifediApiAccess instance);

  Future<void> logoutCurrentInstance();

  String createHashtagUrl({
    required String hashtag,
  });
}

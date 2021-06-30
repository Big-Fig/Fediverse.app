import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICurrentAuthInstanceBloc implements IDisposable {
  static ICurrentAuthInstanceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<ICurrentAuthInstanceBloc>(
        context,
        listen: listen,
      );

  AuthInstance? get currentInstance;

  Stream<AuthInstance?> get currentInstanceStream;

  Future changeCurrentInstance(AuthInstance instance);

  bool isCurrentInstance(AuthInstance instance);

  Future logoutCurrentInstance();

  String createHashtagUrl({
    required String hashtag,
  });
}

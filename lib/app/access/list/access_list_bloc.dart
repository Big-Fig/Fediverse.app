import 'package:easy_dispose/easy_dispose.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IUnifediApiAccessListBloc implements IDisposable {
  static IUnifediApiAccessListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IUnifediApiAccessListBloc>(context, listen: listen);

  List<UnifediApiAccess> get availableInstances;

  Stream<List<UnifediApiAccess>> get availableInstancesStream;

  Stream<UnifediApiAccess> get instanceRemovedStream;

  bool get isHaveInstances;

  Stream<bool> get isHaveInstancesStream;

  Future addInstance(UnifediApiAccess instance);

  Future removeInstance(UnifediApiAccess instance);

  UnifediApiAccess? findInstanceByCredentials({
    required String host,
    required String acct,
  });
}

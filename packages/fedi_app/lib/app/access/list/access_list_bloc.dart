import 'package:easy_dispose/easy_dispose.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IAccessListBloc implements IDisposable {
  static IAccessListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IAccessListBloc>(context, listen: listen);

  List<UnifediApiAccess> get availableInstances;

  Stream<List<UnifediApiAccess>> get availableInstancesStream;

  Stream<UnifediApiAccess> get instanceRemovedStream;

  bool get isHaveInstances;

  Stream<bool> get isHaveInstancesStream;

  Future<void> addInstance(UnifediApiAccess instance);

  Future<void> removeInstance(UnifediApiAccess instance);

  UnifediApiAccess? findInstanceByCredentials({
    required String host,
    required String acct,
  });
}

import 'package:easy_dispose/easy_dispose.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IAccessChooserBloc implements IDisposable {
  static IAccessChooserBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IAccessChooserBloc>(context, listen: listen);

  UnifediApiAccess? get selectedInstance;

  Stream<UnifediApiAccess?> get selectedInstanceStream;

  List<UnifediApiAccess> get instancesAvailableToChoose;

  Stream<List<UnifediApiAccess>> get instancesAvailableToChooseStream;

  Future<void> chooseInstance(UnifediApiAccess instance);

  Future<void> removeInstance(UnifediApiAccess instance);
}

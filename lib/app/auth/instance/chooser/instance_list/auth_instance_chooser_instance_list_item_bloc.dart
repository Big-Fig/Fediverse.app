import 'package:easy_dispose/easy_dispose.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IUnifediApiAccessChooserInstanceListItemBloc
    implements IDisposable {
  static IUnifediApiAccessChooserInstanceListItemBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IUnifediApiAccessChooserInstanceListItemBloc>(
        context,
        listen: listen,
      );

  bool get isSelected;

  UnifediApiAccess get instance;
}

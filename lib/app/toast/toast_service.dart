import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IToastService implements IDisposable {
  static IToastService of(BuildContext context, {bool listen = true}) =>
      Provider.of<IToastService>(context, listen: listen);

  void showErrorToast({
    @required BuildContext context,
    @required String title,
    bool titleAutoFontSize = true,
    String content,
    VoidCallback onClick,
    Duration duration = const Duration(seconds: 2, milliseconds: 500),
  });

  void showInfoToast({
    @required BuildContext context,
    @required String title,
    bool titleAutoFontSize = true,
    String content,
    VoidCallback onClick,
    Duration duration = const Duration(seconds: 1, milliseconds: 500),
  });
}

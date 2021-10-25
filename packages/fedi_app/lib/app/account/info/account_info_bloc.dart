import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/ui/callback/on_click_ui_callback.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

abstract class IAccountInfoBloc implements IDisposable {
  static IAccountInfoBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IAccountInfoBloc>(context, listen: listen);

  Brightness get brightness;

  OnClickUiCallback? get onStatusesTapCallback;
}

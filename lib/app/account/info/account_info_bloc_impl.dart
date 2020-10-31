import 'package:fedi/app/account/info/account_info_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/ui/callback/on_click_ui_callback.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class AccountInfoBloc extends DisposableOwner implements IAccountInfoBloc {
  @override
  final Brightness brightness;
  @override
  final OnClickUiCallback onStatusesTapCallback;

  AccountInfoBloc({
    @required this.brightness,
    @required this.onStatusesTapCallback,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountInfoBloc &&
          runtimeType == other.runtimeType &&
          brightness == other.brightness &&
          onStatusesTapCallback == other.onStatusesTapCallback;

  @override
  int get hashCode => brightness.hashCode ^ onStatusesTapCallback.hashCode;
}

import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/account/info/account_info_bloc.dart';
import 'package:fedi/ui/callback/on_click_ui_callback.dart';
import 'package:flutter/services.dart';

class AccountInfoBloc extends DisposableOwner implements IAccountInfoBloc {
  @override
  final Brightness brightness;
  @override
  final OnClickUiCallback? onStatusesTapCallback;

  AccountInfoBloc({
    required this.brightness,
    required this.onStatusesTapCallback,
  });
}

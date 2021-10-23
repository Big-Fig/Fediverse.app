import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/account/header/account_header_bloc.dart';
import 'package:flutter/services.dart';

class AccountHeaderBloc extends DisposableOwner implements IAccountHeaderBloc {
  @override
  final Brightness brightness;

  AccountHeaderBloc({
    required this.brightness,
  });
}

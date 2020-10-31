import 'package:fedi/app/account/header/account_header_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class AccountHeaderBloc extends DisposableOwner implements IAccountHeaderBloc {
  @override
  final Brightness brightness;

  AccountHeaderBloc({
    @required this.brightness,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountHeaderBloc &&
          runtimeType == other.runtimeType &&
          brightness == other.brightness;

  @override
  int get hashCode => brightness.hashCode;
}

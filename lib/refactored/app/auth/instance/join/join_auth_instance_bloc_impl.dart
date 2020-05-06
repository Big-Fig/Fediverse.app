import 'package:fedi/refactored/app/auth/instance/join/join_auth_instance_bloc.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:flutter/cupertino.dart';

class JoinAuthInstanceBloc extends DisposableOwner
    implements IJoinAuthInstanceBloc {
  @override
  final TextEditingController hostTextController = TextEditingController();

  JoinAuthInstanceBloc() {
    addDisposable(textEditingController: hostTextController);
  }
}

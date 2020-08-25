import 'package:fedi/app/auth/instance/join/join_auth_instance_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/cupertino.dart';

class JoinAuthInstanceBloc extends DisposableOwner
    implements IJoinAuthInstanceBloc {
  @override
  final TextEditingController hostTextController =
      TextEditingController(text: "Fedi.app");

  JoinAuthInstanceBloc() {
    addDisposable(textEditingController: hostTextController);
  }
}

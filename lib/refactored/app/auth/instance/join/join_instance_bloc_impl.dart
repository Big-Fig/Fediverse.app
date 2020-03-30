import 'package:fedi/refactored/pleroma/oauth/pleroma_oauth_model.dart';
import 'package:fedi/refactored/pleroma/oauth/pleroma_oauth_service.dart';
import 'package:fedi/refactored/app/auth/host/auth_host_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/instance_model.dart';
import 'package:fedi/refactored/app/auth/instance/join/join_instance_bloc.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:flutter/cupertino.dart';

class JoinInstanceBloc extends DisposableOwner implements IJoinInstanceBloc {
  final TextEditingController hostTextController = TextEditingController();


  JoinInstanceBloc() {
    addDisposable(textEditingController: hostTextController);
  }


}

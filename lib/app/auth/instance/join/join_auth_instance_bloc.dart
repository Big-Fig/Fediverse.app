import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/server_list/server_list_auto_complete_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IJoinAuthInstanceBloc implements IDisposable {
  static IJoinAuthInstanceBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IJoinAuthInstanceBloc>(context, listen: listen);

  bool get isFromScratch;

  IServerListAutoCompleteBloc get serverListAutoCompleteBloc;

  TextEditingController get hostTextController;

  FocusNode get hostFocusNode;

  Uri extractCurrentUri();
}

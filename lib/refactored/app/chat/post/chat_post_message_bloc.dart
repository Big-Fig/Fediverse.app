import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IChatPostMessageBloc implements Disposable {
  static IChatPostMessageBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IChatPostMessageBloc>(context, listen: listen);

  TextEditingController get inputTextController;

  bool get isReadyToPost;

  Stream<bool> get isReadyToPostStream;

  String get inputText;

  Stream<String> get inputTextStream;

  Future<bool> postMessage();
}

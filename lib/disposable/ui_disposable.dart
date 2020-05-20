import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';

class TextEditingControllerDisposable extends CustomDisposable {
  final TextEditingController textEditingController;

  TextEditingControllerDisposable(this.textEditingController)
      : super(() => textEditingController.dispose());
}

class FocusNodeDisposable extends CustomDisposable {
  final FocusNode focusNode;

  FocusNodeDisposable(this.focusNode) : super(() => focusNode.dispose());
}

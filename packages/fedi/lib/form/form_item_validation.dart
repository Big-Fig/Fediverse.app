import 'package:flutter/widgets.dart';

abstract class FormItemValidationError {
  String createErrorDescription(BuildContext context);

  const FormItemValidationError();
}

import 'package:fedi_app/form/form_item_validation.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/widgets.dart';

enum PostMessageSelectedAction {
  attach,
  emoji,
  poll,
}

class PostMessagePollEmptyInputTextError extends FormItemValidationError {
  const PostMessagePollEmptyInputTextError();

  @override
  String createErrorDescription(BuildContext context) =>
      S.of(context).app_status_post_error_pollBodyIsEmpty_desc;
}

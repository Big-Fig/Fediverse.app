import 'package:fedi/error/error_data_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/src/widgets/framework.dart';

class AuthInstancePleromaRestErrorData extends ErrorData {
  AuthInstancePleromaRestErrorData({
    @required dynamic error,
    @required StackTrace stackTrace,
    @required String titleText,
    @required String contentText,
  }) : super(
          error: error,
          stackTrace: stackTrace,
          titleText: titleText,
          contentText: contentText,
        );

  static AuthInstancePleromaRestErrorData createFromContext({
    @required BuildContext context,
    @required dynamic error,
    @required StackTrace stackTrace,
  }) {
    return AuthInstancePleromaRestErrorData(
        error: error,
        stackTrace: stackTrace,
        titleText: S.of(context).app_auth_instance_register_fail_dialog_title,
        contentText:
            S.of(context).app_auth_instance_register_fail_dialog_content(
                  error.toString(),
                ));
  }
}

import 'package:fedi/error/error_data_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/src/widgets/framework.dart';

class AuthInstancePleromaRestErrorData extends ErrorData {
  AuthInstancePleromaRestErrorData({
    required dynamic error,
    required StackTrace stackTrace,
    required ErrorDataTitleCreator titleCreator,
    required ErrorDataContentCreator contentCreator,
  }) : super(
          error: error,
          stackTrace: stackTrace,
          titleCreator: titleCreator,
          contentCreator: contentCreator,
        );

  static AuthInstancePleromaRestErrorData createFromContext({
    required BuildContext? context,
    required dynamic error,
    required StackTrace stackTrace,
  }) {
    return AuthInstancePleromaRestErrorData(
      error: error,
      stackTrace: stackTrace,
      titleCreator: (context) =>
          S.of(context).app_auth_instance_join_fail_dialog_title,
      contentCreator: (context) =>
          S.of(context).app_auth_instance_join_fail_dialog_content(
                error.toString(),
              ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/error/error_data_model.dart';

class AuthInstancePleromaRestErrorData extends ErrorData {
  AuthInstancePleromaRestErrorData({
    dynamic error,
    StackTrace stackTrace,
  }) : super(
          error: error,
          stackTrace: stackTrace,
          titleText: tr("app.auth.instance.register.fail.dialog.title"),
          contentText: tr(
            "app.auth.instance.register.fail.dialog.content",
            args: [
              error.toString(),
            ],
          ),
        );
}

import 'package:fedi/error/error_data_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/src/widgets/framework.dart';

class UnifediApiAccessUnifediApiRestErrorData extends ErrorData {
  UnifediApiAccessUnifediApiRestErrorData({
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

  static UnifediApiAccessUnifediApiRestErrorData createFromContext({
    required BuildContext? context,
    required dynamic error,
    required StackTrace stackTrace,
  }) {
    return UnifediApiAccessUnifediApiRestErrorData(
      error: error,
      stackTrace: stackTrace,
      titleCreator: (context) =>
          S.of(context).app_access_join_fail_dialog_title,
      contentCreator: (context) =>
          S.of(context).app_access_join_fail_dialog_content(
                error.toString(),
              ),
    );
  }
}

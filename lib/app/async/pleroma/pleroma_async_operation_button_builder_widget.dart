import 'package:fedi/app/async/async_operation_button_builder_widget.dart';
import 'package:fedi/app/async/pleroma/pleroma_async_operation_helper.dart';
import 'package:fedi/dialog/async/async_dialog.dart';
import 'package:fedi/dialog/async/async_dialog_model.dart';
import 'package:flutter/widgets.dart';

class PleromaAsyncOperationButtonBuilderWidget<T>
    extends AsyncOperationButtonBuilderWidget<T> {
  PleromaAsyncOperationButtonBuilderWidget({
    required ButtonBuilder builder,
    required AsyncButtonAction<T> asyncButtonAction,
    String? progressContentMessage,
    String? successToastMessage,
    bool showProgressDialog = true,
    List<ErrorDataBuilder> errorAlertDialogBuilders = const [],
    ErrorCallback? errorCallback,
  }) : super(
          builder: builder,
          asyncButtonAction: asyncButtonAction,
          showProgressDialog: showProgressDialog,
          progressContentMessage: progressContentMessage,
          successToastMessage: successToastMessage,
          errorCallback: errorCallback,
          errorDataBuilders: [
            // top priority for passed to constructor handlers
            ...(errorAlertDialogBuilders),
            // low priority for base Pleroma handler
            ...PleromaAsyncOperationHelper.pleromaErrorDataBuilders,
          ],
        );

  @override
  Future<AsyncDialogResult<T?>> performAsyncOperation({
    required BuildContext context,
  }) {
    return PleromaAsyncOperationHelper.performPleromaAsyncOperation(
      context: context,
      errorCallback: errorCallback,
      contentMessage: progressContentMessage,
      errorDataBuilders: errorDataBuilders,
      showProgressDialog: showProgressDialog,
      asyncCode: asyncButtonAction,
    );
  }
}

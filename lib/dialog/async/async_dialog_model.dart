import 'package:freezed_annotation/freezed_annotation.dart';

part 'async_dialog_model.freezed.dart';

@freezed
class AsyncDialogResult<T> with _$AsyncDialogResult<T> {
  const factory AsyncDialogResult({
    required T? result,
    required bool success,
    required bool canceled,
    required dynamic handledError,
  }) = _AsyncDialogResult<T>;

  static AsyncDialogResult<T> withResult<T>(T? result) => AsyncDialogResult(
        result: result,
        success: true,
        canceled: false,
        handledError: null,
      );

  static AsyncDialogResult<T> withError<T>(dynamic handledError) =>
      AsyncDialogResult(
        result: null,
        success: false,
        canceled: false,
        handledError: handledError,
      );

  static AsyncDialogResult<T> withCancel<T>() => const AsyncDialogResult(
        result: null,
        success: false,
        canceled: true,
        handledError: null,
      );
}

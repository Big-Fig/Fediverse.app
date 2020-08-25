class AsyncDialogResult<T> {
  final T result;
  final bool success;
  final bool canceled;
  final dynamic handledError;

  AsyncDialogResult.success(this.result)
      : success = true,
        canceled = false,
        handledError = null;

  AsyncDialogResult.withError(this.handledError)
      : success = false,
        canceled = false,
        result = null;

  AsyncDialogResult.canceled()
      : success = false,
        canceled = false,
        result = null,
        handledError = null;

  @override
  String toString() {
    return 'AsyncDialogResult{result: $result, success: $success,'
        ' canceled: $canceled, handledError: $handledError}';
  }
}

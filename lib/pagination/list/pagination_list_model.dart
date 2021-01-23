import 'package:flutter/widgets.dart';

class CantUpdateFromNetworkException implements Exception {}

class PaginationListLoadingError {
  final dynamic error;
  final StackTrace stackTrace;

  PaginationListLoadingError({
    @required this.error,
    @required this.stackTrace,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaginationListLoadingError &&
          runtimeType == other.runtimeType &&
          error == other.error &&
          stackTrace == other.stackTrace;

  @override
  int get hashCode => error.hashCode ^ stackTrace.hashCode;

  @override
  String toString() {
    return 'PaginationListLoadingError{error: $error, stackTrace: $stackTrace}';
  }
}

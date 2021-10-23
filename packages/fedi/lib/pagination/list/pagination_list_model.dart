import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_list_model.freezed.dart';

class CantUpdateFromNetworkException implements Exception {}

@freezed
class PaginationListLoadingError with _$PaginationListLoadingError {
  const factory PaginationListLoadingError({
    required dynamic error,
    required StackTrace? stackTrace,
  }) = _PaginationListLoadingError;
}

import 'package:flutter/widgets.dart';

class UploadMediaAttachmentState {
  final UploadMediaAttachmentStateType type;
  final dynamic error;
  final StackTrace stackTrace;

  UploadMediaAttachmentState({
    @required this.type,
    this.error,
    this.stackTrace,
  });

  @override
  String toString() {
    return 'UploadMediaAttachmentState{type: $type,'
        ' error: $error, stackTrace: $stackTrace}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UploadMediaAttachmentState &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          error == other.error &&
          stackTrace == other.stackTrace;

  @override
  int get hashCode => type.hashCode ^ error.hashCode ^ stackTrace.hashCode;
}

enum UploadMediaAttachmentStateType {
  notUploaded,
  uploading,
  uploaded,
  failed,
}

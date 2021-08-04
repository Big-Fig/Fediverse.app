class UploadMediaAttachmentMetadata {
  final String? description;

  UploadMediaAttachmentMetadata({
    required this.description,
  });

  bool get isAnyDataExist => description?.isNotEmpty == true;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UploadMediaAttachmentMetadata &&
          runtimeType == other.runtimeType &&
          description == other.description;

  @override
  int get hashCode => description.hashCode;

  @override
  String toString() => 'UploadMediaAttachmentMetadata{'
      'description: $description'
      '}';
}

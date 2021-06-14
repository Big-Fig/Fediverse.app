
class ShareEntitySettings {
  final bool appendFromAccountDetails;
  final bool withCreatedAt;
  final bool withMedia;
  final bool withLink;
  final bool asLink;
  final String? withMessage;

  ShareEntitySettings({
    required this.appendFromAccountDetails,
    required this.withCreatedAt,
    required this.withMedia,
    required this.withLink,
    required this.asLink,
    required this.withMessage,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ShareEntitySettings &&
              runtimeType == other.runtimeType &&
              appendFromAccountDetails == other.appendFromAccountDetails &&
              withCreatedAt == other.withCreatedAt &&
              withMedia == other.withMedia &&
              withLink == other.withLink &&
              asLink == other.asLink &&
              withMessage == other.withMessage;

  @override
  int get hashCode =>
      appendFromAccountDetails.hashCode ^
      withCreatedAt.hashCode ^
      withMedia.hashCode ^
      withLink.hashCode ^
      asLink.hashCode ^
      withMessage.hashCode;

  @override
  String toString() => 'ShareEntitySettings{'
      'appendFromAccountDetails: $appendFromAccountDetails, '
      'withCreatedAt: $withCreatedAt, '
      'withMedia: $withMedia, '
      'withLink: $withLink, '
      'asLink: $asLink, '
      'withMessage: $withMessage'
      '}';
}

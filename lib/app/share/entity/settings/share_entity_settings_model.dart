class ShareEntitySettings {
  final bool appendFromAccount;
  final bool withCreatedAt;
  final bool withMedia;
  final bool withText;
  final bool withLink;
  final bool wholeAsLink;
  final bool mediaAsLink;
  final String? withMessage;

  ShareEntitySettings({
    required this.appendFromAccount,
    required this.withCreatedAt,
    required this.withMedia,
    required this.withText,
    required this.withLink,
    required this.wholeAsLink,
    required this.mediaAsLink,
    required this.withMessage,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShareEntitySettings &&
          runtimeType == other.runtimeType &&
          appendFromAccount == other.appendFromAccount &&
          withCreatedAt == other.withCreatedAt &&
          withMedia == other.withMedia &&
          withText == other.withText &&
          withLink == other.withLink &&
          wholeAsLink == other.wholeAsLink &&
          mediaAsLink == other.mediaAsLink &&
          withMessage == other.withMessage;

  @override
  int get hashCode =>
      appendFromAccount.hashCode ^
      withCreatedAt.hashCode ^
      withMedia.hashCode ^
      withText.hashCode ^
      withLink.hashCode ^
      wholeAsLink.hashCode ^
      mediaAsLink.hashCode ^
      withMessage.hashCode;

  @override
  String toString() => 'ShareEntitySettings{'
      'appendFromAccount: $appendFromAccount, '
      'withCreatedAt: $withCreatedAt, '
      'withMedia: $withMedia, '
      'withText: $withText, '
      'withLink: $withLink, '
      'wholeAsLink: $wholeAsLink, '
      'mediaAsLink: $mediaAsLink, '
      'withMessage: $withMessage'
      '}';
}

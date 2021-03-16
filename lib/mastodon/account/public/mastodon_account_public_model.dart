abstract class IMastodonAccountRegister {
  /// Text that will be reviewed by moderators if registrations require manual approval.
  String? get reason;

  String? get username;

  String? get email;

  String? get password;

  /// Whether the user agrees to the local rules, terms, and policies
  /// . These should be presented to the user in order to allow them to consent
  /// before setting this parameter to TRUE.
  bool? get agreement;

  /// The language of the confirmation email that will be sent
  String? get locale;
}

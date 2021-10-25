abstract class IMastodonApiMention {
  String get acct;

  String get id;

  String get url;

  String? get username;
}

extension IMastodonApiMentionListExtension on List<IMastodonApiMention> {
  List<String> toAccts() => map((mention) => mention.acct).toList();
}

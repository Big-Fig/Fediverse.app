abstract class IAccountFeaturedHashtag {
  String get remoteId;

  String get name;

  int get statusesCount;

  DateTime? get lastStatusAt;
}

class AccountFeaturedHashtag extends IAccountFeaturedHashtag {
  @override
  final String remoteId;

  @override
  final String name;

  @override
  final int statusesCount;

  @override
  final DateTime? lastStatusAt;

  AccountFeaturedHashtag({
    required this.remoteId,
    required this.name,
    required this.statusesCount,
    required this.lastStatusAt,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountFeaturedHashtag &&
          runtimeType == other.runtimeType &&
          remoteId == other.remoteId &&
          name == other.name &&
          statusesCount == other.statusesCount &&
          lastStatusAt == other.lastStatusAt;

  @override
  int get hashCode =>
      remoteId.hashCode ^
      name.hashCode ^
      statusesCount.hashCode ^
      lastStatusAt.hashCode;

  @override
  String toString() => 'AccountFeaturedHashtag{'
      'remoteId: $remoteId, '
      'name: $name, '
      'statusesCount: $statusesCount, '
      'lastStatusAt: $lastStatusAt'
      '}';
}

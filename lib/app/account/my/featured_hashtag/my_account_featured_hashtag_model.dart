abstract class IMyAccountFeaturedHashtag {
  String get remoteId;

  String get name;

  int get statusesCount;

  DateTime? get lastStatusAt;
}

class MyAccountFeaturedHashtag extends IMyAccountFeaturedHashtag {
  @override
  final String remoteId;

  @override
  final String name;

  @override
  final int statusesCount;

  @override
  final DateTime? lastStatusAt;

  MyAccountFeaturedHashtag({
    required this.remoteId,
    required this.name,
    required this.statusesCount,
    required this.lastStatusAt,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyAccountFeaturedHashtag &&
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
  String toString() => 'MyAccountFeaturedHashtag{'
      'remoteId: $remoteId, '
      'name: $name, '
      'statusesCount: $statusesCount, '
      'lastStatusAt: $lastStatusAt'
      '}';
}

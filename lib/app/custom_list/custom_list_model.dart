

abstract class ICustomList {
  String get remoteId;

  String get title;
}

class CustomList extends ICustomList {
  @override
  final String remoteId;

  @override
  final String title;

  CustomList({
    required this.remoteId,
    required this.title,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomList &&
          runtimeType == other.runtimeType &&
          remoteId == other.remoteId &&
          title == other.title;

  @override
  int get hashCode => remoteId.hashCode ^ title.hashCode;

  @override
  String toString() {
    return 'CustomList{remoteId: $remoteId, title: $title}';
  }
}

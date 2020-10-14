import 'package:fedi/pleroma/history/pleroma_history_model.dart';
import 'package:flutter/widgets.dart';

abstract class IHashtag {
  String get name;

  String get url;

  List<IPleromaHistory> get history;
}

class Hashtag extends IHashtag {
  @override
  final String name;

  @override
  final List<IPleromaHistory> history;

  @override
  final String url;

  Hashtag({
    @required this.name,
    @required this.url,
    @required this.history,
  });


  @override
  String toString() {
    return 'Hashtag{name: $name, history: $history, url: $url}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Hashtag &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          history == other.history &&
          url == other.url;

  @override
  int get hashCode => name.hashCode ^ history.hashCode ^ url.hashCode;
}

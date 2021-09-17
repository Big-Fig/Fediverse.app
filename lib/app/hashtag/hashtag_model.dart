import 'package:unifedi_api/unifedi_api.dart';

abstract class IHashtag {
  String get name;

  String get url;

  IUnifediApiTagHistory? get history;
}

class Hashtag extends IHashtag {
  @override
  final String name;

  @override
  final IUnifediApiTagHistory? history;

  @override
  final String? url;

  Hashtag({
    required this.name,
    required this.url,
    required this.history,
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

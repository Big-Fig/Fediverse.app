import 'package:moor/moor.dart';

enum ChatMessageOrderByType {
  remoteId, createdAt
}

class PleromaChatMessageOrderingTermData {
  final ChatMessageOrderByType orderByType;
  final OrderingMode orderingMode;
  PleromaChatMessageOrderingTermData(
      {@required this.orderByType, @required this.orderingMode});

  @override
  String toString() {
    return 'ChatMessageOrderingTermData{orderByType: $orderByType, orderingMode: $orderingMode}';
  }
}

class OnlyLocalChatMessageFilter {
  final String localUrlHost;
  OnlyLocalChatMessageFilter(this.localUrlHost);

  @override
  String toString() {
    return 'OnlyLocalChatMessageFilter{localUrlHost: $localUrlHost}';
  }
}

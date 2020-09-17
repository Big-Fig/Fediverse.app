import 'package:fedi/pleroma/push/pleroma_push_model.dart';
import 'package:fedi/push/push_model.dart';
import 'package:hive/hive.dart';

part 'push_handler_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
@HiveType(typeId: -32 + 66)
class PushHandlerMessage {
  @HiveField(0)
  final PleromaPushMessageBody body;
  @HiveField(1)
  final PushMessage pushMessage;
  PushHandlerMessage({
    this.body,
    this.pushMessage,
  });

  @override
  String toString() {
    return 'PushHandlerMessage{body: $body, pushMessage: $pushMessage}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PushHandlerMessage &&
          runtimeType == other.runtimeType &&
          body == other.body &&
          pushMessage == other.pushMessage;
  @override
  int get hashCode => body.hashCode ^ pushMessage.hashCode;
}

import 'package:fedi/refactored/local_preferences/local_preferences_model.dart';
import 'package:fedi/refactored/pleroma/push/pleroma_push_model.dart';
import 'package:hive/hive.dart';

part 'push_handler_unhandled_local_preferences_model.g.dart';

@HiveType()
class PushHandlerUnhandledList implements IPreferencesObject {
  @HiveField(0)
  List<PleromaPushMessage> messages;

  PushHandlerUnhandledList({this.messages});

  @override
  String toString() {
    return 'PushHandlerUnhandledList{pleromaPushMessage: $messages}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PushHandlerUnhandledList &&
          runtimeType == other.runtimeType &&
          messages == other.messages;

  @override
  int get hashCode => messages.hashCode;
}

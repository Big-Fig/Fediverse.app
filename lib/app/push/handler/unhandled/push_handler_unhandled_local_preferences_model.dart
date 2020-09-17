import 'package:fedi/app/push/handler/push_handler_model.dart';
import 'package:fedi/local_preferences/local_preferences_model.dart';
import 'package:hive/hive.dart';

part 'push_handler_unhandled_local_preferences_model.g.dart';

@HiveType(typeId: -32 + 55)
class PushHandlerUnhandledList implements IPreferencesObject {
  @HiveField(0)
  List<PushHandlerMessage> messages;

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

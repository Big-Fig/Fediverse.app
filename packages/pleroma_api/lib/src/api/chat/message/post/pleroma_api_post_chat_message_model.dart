import '../../../pleroma_api_model.dart';

abstract class IPleromaApiPostChatMessage implements IPleromaApiObject {
  String? get content;

  String? get mediaId;
}

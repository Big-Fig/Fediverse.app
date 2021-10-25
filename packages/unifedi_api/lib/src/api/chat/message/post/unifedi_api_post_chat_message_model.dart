import '../../../unifedi_api_model.dart';

abstract class IUnifediApiPostChatMessage implements IUnifediApiObject {
  String? get content;

  String? get mediaId;
}

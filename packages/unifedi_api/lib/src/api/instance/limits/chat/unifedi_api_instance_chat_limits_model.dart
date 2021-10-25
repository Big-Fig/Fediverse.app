import '../../../unifedi_api_model.dart';

abstract class IUnifediApiInstanceChatLimits
    implements IUnifediApiResponsePart {
  int? get messageLimit;
}

import '../../../unifedi_api_model.dart';

abstract class IUnifediApiInstanceStatusLimits
    implements IUnifediApiResponsePart {
  int? get maxTootChars;
  int? get maxMediaAttachmentsCount;
}

import '../../../unifedi_api_model.dart';

abstract class IUnifediApiInstancePollLimits
    implements IUnifediApiResponsePart {
  int? get maxExpiration;

  int? get maxOptionChars;

  int? get maxOptions;

  int? get minExpiration;
}

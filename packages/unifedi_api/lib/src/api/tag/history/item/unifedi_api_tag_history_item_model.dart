import '../../../unifedi_api_model.dart';

abstract class IUnifediApiTagHistoryItem implements IUnifediApiResponsePart {
  int get dayInUnixTimestamp;

  int get uses;

  int get accounts;
}

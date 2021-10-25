import '../../../unifedi_api_model.dart';

abstract class IUnifediApiInstanceActivityItem
    implements IUnifediApiResponsePart {
  int get week;

  int get statuses;

  int get logins;

  int get registrations;
}

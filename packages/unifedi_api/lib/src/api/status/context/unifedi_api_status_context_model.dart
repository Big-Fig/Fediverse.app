import '../../unifedi_api_model.dart';
import '../unifedi_api_status_model.dart';

abstract class IUnifediApiStatusContext implements IUnifediApiResponsePart {
  List<IUnifediApiStatus> get descendants;

  List<IUnifediApiStatus> get ancestors;
}

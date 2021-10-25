import '../../status/unifedi_api_status_model.dart';
import '../../unifedi_api_model.dart';
import '../unifedi_api_account_model.dart';

abstract class IUnifediApiAccountReport implements IUnifediApiResponse {
  List<IUnifediApiStatus>? get statuses;

  IUnifediApiAccount? get account;

  IUnifediApiAccount? get user;
}

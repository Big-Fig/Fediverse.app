import '../account/unifedi_api_account_model.dart';
import '../status/unifedi_api_status_model.dart';
import '../unifedi_api_model.dart';

abstract class IUnifediApiConversation implements IUnifediApiResponse {
  String get id;

  bool? get unread;

  IUnifediApiStatus? get lastStatus;

  List<IUnifediApiAccount> get accounts;

  List<IUnifediApiAccount>? get recipients;
}

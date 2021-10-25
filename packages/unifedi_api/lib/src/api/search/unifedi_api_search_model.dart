import '../account/unifedi_api_account_model.dart';
import '../status/unifedi_api_status_model.dart';
import '../tag/unifedi_api_tag_model.dart';
import '../unifedi_api_model.dart';

abstract class IUnifediApiSearchResult implements IUnifediApiResponse {
  List<IUnifediApiAccount> get accounts;

  List<IUnifediApiStatus> get statuses;

  List<IUnifediApiTag> get hashtags;
}

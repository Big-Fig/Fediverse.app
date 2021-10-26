import '../pleroma_api_model.dart';
import 'masto_fe/pleroma_api_frontend_configurations_masto_fe_model.dart';
import 'pleroma_fe/pleroma_api_frontend_configurations_pleroma_fe_model.dart';
import 'soapbox_fe/pleroma_api_frontend_configurations_soapbox_fe_model.dart';

abstract class IPleromaApiFrontendConfigurations
    implements IPleromaApiResponse {
  IPleromaApiFrontendConfigurationsMastoFe? get mastoFe;

  IPleromaApiFrontendConfigurationsPleromaFe? get pleromaFe;

  IPleromaApiFrontendConfigurationsSoapboxFe? get soapboxFe;
}

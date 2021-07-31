import 'package:mastodon_fediverse_api/mastodon_fediverse_api.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/application/pleroma_api_application_model.dart';

abstract class IPleromaApiApplicationService implements IPleromaApi {
  Future<IPleromaApiClientApplication> registerApp({
    required MastodonApiApplicationRegistrationRequest registrationRequest,
  });

  Future<IPleromaApiApplication> verifyCredentials({
    required String appToken,
  });
}

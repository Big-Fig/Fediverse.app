import 'package:fedi/mastodon/api/application/mastodon_api_application_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/application/pleroma_api_application_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaApiApplicationService implements IPleromaApi {
  static IPleromaApiApplicationService of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaApiApplicationService>(context, listen: listen);

  Future<IPleromaApiClientApplication?> registerApp({
    required MastodonApiApplicationRegistrationRequest registrationRequest,
  });

  Future<IPleromaApiApplication?> verifyCredentials({
    required String appToken,
  });
}

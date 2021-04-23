import 'package:fedi/mastodon/api/application/mastodon_api_application_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_api_service.dart';
import 'package:fedi/pleroma/api/application/pleroma_api_application_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaApplicationService implements IPleromaApi {
  static IPleromaApplicationService of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaApplicationService>(context, listen: listen);

  Future<IPleromaClientApplication?> registerApp({
    required MastodonApiApplicationRegistrationRequest registrationRequest,
  });

  Future<IPleromaApplication?> verifyCredentials({
    required String appToken,
  });
}

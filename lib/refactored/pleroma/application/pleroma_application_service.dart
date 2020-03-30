import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/refactored/pleroma/application/pleroma_application_model.dart';
import 'package:fedi/refactored/mastodon/application/mastodon_application_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaApplicationService implements IPleromaApi {

  static IPleromaApplicationService of(BuildContext context, {bool listen = true}) =>
      Provider.of<IPleromaApplicationService>(context, listen: listen);

  Future<IPleromaClientApplication> registerApp(
      {@required MastodonApplicationRegistrationRequest registrationRequest});

  Future<IPleromaApplication> verifyCredentials({@required String appToken});
}

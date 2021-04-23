import 'package:fedi/pleroma/api/account/public/pleroma_api_account_public_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/oauth/pleroma_api_oauth_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaApiAccountPublicService implements IPleromaApi {
  static IPleromaApiAccountPublicService of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaApiAccountPublicService>(
        context,
        listen: listen,
      );

  Future<PleromaApiOAuthToken> registerAccount({
    required IPleromaApiAccountRegisterRequest request,
    required String appAccessToken,
  });
}

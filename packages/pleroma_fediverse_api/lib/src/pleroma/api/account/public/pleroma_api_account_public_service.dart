import 'package:pleroma_fediverse_api/src/pleroma/api/account/public/pleroma_api_account_public_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/oauth/pleroma_api_oauth_model.dart';

abstract class IPleromaApiAccountPublicService implements IPleromaApi {
  Future<PleromaApiOAuthToken?> registerAccount({
    required IPleromaApiAccountPublicRegisterRequest request,
    required String appAccessToken,
  });
}

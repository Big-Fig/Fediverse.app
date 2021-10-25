import 'package:easy_dispose/easy_dispose.dart';

import 'package:pleroma_api/pleroma_api.dart';

import '../pleroma_login_model.dart';

abstract class IPleromaLoginBrowserDriverBloc implements IDisposable {
  PleromaLoginCredentials get credentials;

  IPleromaApiClientApplication get pleromaApiClientApplication;

  Future init();

  Future<String> performLoginAndExtractAuthCode();
}

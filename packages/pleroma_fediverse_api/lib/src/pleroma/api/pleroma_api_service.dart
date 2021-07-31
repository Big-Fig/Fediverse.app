import 'package:easy_dispose/easy_dispose.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/rest/auth/pleroma_api_auth_rest_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/rest/pleroma_api_rest_service.dart';
import 'package:base_fediverse_api/base_fediverse_api.dart';
import 'package:rxdart/rxdart.dart';

typedef ResponseJsonParser<T> = T Function(Map<String, dynamic> json);

abstract class BasePleromaApiService extends DisposableOwner
    implements IPleromaApi {
  @override
  final IPleromaApiRestService restService;

  @override
  Stream<PleromaApiState> get pleromaApiStateStream =>
      restService.pleromaApiStateStream;

  @override
  PleromaApiState get pleromaApiState => restService.pleromaApiState;

  @override
  bool get isConnected => restService.isConnected;

  @override
  Stream<bool> get isConnectedStream => restService.isConnectedStream;

  BasePleromaApiService({
    required this.restService,
  });
}

mixin PleromaApiAuthMixinService on BasePleromaApiService
    implements IPleromaApiAuth {
  IPleromaApiAuthRestService get restApiAuthService;

  @override
  bool get isPleroma => restApiAuthService.isPleroma;

  @override
  bool get isMastodon => restApiAuthService.isMastodon;
}

abstract class IPleromaApi implements IDisposable {
  IRestService get restService;

  Stream<PleromaApiState> get pleromaApiStateStream;

  PleromaApiState get pleromaApiState;

  Stream<bool> get isConnectedStream;

  bool get isConnected;
}

extension IPleromaApiExtension on IPleromaApi {
  Stream<bool> get isApiReadyToUseStream => Rx.combineLatest2(
        pleromaApiStateStream,
        isConnectedStream,
        _mapIsReady,
      ).distinct();

  bool get isApiReadyToUse => _mapIsReady(
        pleromaApiState,
        isConnected,
      );
}

bool _mapIsReady(
  PleromaApiState pleromaState,
  bool isConnected,
) =>
    pleromaState == PleromaApiState.validAuth;

enum PleromaApiState {
  validAuth,
  brokenAuth,
  loggedOut,
}

abstract class IPleromaApiAuth extends IPleromaApi {
  bool get isPleroma;

  bool get isMastodon;
}

import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mastodon_api/mastodon_api.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../mastodon/access/unifedi_api_access_bloc_mastodon_adapter.dart';
import '../../../mastodon/manager/unifedi_api_manager_mastodon_adapter.dart';
import '../../../mastodon/rest/error/unifedi_api_rest_error_model_mastodon_adapter.dart';
import '../../../pleroma/access/unifedi_api_access_bloc_pleroma_adapter.dart';
import '../../../pleroma/manager/unifedi_api_manager_pleroma_adapter.dart';
import '../../../pleroma/rest/error/unifedi_api_rest_error_model_pleroma_adapter.dart';
import '../../access/unifedi_api_access_bloc.dart';
import '../../manager/unifedi_api_manager.dart';
import '../../rest/error/exception/unifedi_api_rest_error_exception_impl.dart';
import '../../rest/error/unifedi_api_rest_error_model_impl.dart';

part 'unifedi_api_instance_type_model.freezed.dart';

@freezed
class UnifediApiInstanceType with _$UnifediApiInstanceType {
  static const pleromaStringValue = 'pleroma';
  static const mastodonStringValue = 'mastodon';

  static const pleromaValue = UnifediApiInstanceType.pleroma();
  static const mastodonValue = UnifediApiInstanceType.mastodon();

  static const values = [
    pleromaValue,
    mastodonValue,
  ];

  const factory UnifediApiInstanceType.pleroma({
    @Default(UnifediApiInstanceType.pleromaStringValue) String? stringValue,
  }) = _Pleroma;

  const factory UnifediApiInstanceType.mastodon({
    @Default(UnifediApiInstanceType.mastodonStringValue) String? stringValue,
  }) = _Mastodon;

  const factory UnifediApiInstanceType.unknown({
    required String? stringValue,
  }) = _Unknown;

  static UnifediApiInstanceType fromStringValue(String stringValue) =>
      values
          .firstWhereOrNull((element) => element.stringValue == stringValue) ??
      UnifediApiInstanceType.unknown(
        stringValue: stringValue,
      );
}

extension UnifediApiInstanceTypeExtension on UnifediApiInstanceType {
  bool get isPleroma => this == UnifediApiInstanceType.pleromaValue;

  bool get isMastodon => this == UnifediApiInstanceType.mastodonValue;

  IUnifediApiManager createApiManager({
    required IUnifediApiAccessBloc apiAccessBloc,
    required ComputeImpl? computeImpl,
    required IWebSocketsModeSettingsBloc webSocketsModeSettingsBloc,
  }) =>
      map(
        pleroma: (_) => createPleromaApiManager(
          apiAccessBloc: apiAccessBloc,
          computeImpl: computeImpl,
          webSocketsModeSettingsBloc: webSocketsModeSettingsBloc,
        ),
        mastodon: (_) => createMastodonApiManager(
          apiAccessBloc: apiAccessBloc,
          computeImpl: computeImpl,
          webSocketsModeSettingsBloc: webSocketsModeSettingsBloc,
        ),
        unknown: (_) => throw UnimplementedError(),
      );
}

UnifediApiManagerPleromaAdapter createPleromaApiManager({
  required IUnifediApiAccessBloc apiAccessBloc,
  required ComputeImpl? computeImpl,
  required IWebSocketsModeSettingsBloc webSocketsModeSettingsBloc,
}) {
  var restService = HttpRestService(
    baseUri: Uri.parse(apiAccessBloc.access.url),
    encoding: IRestService.defaultEncoding,
    computeImpl: computeImpl,
    customRestResponseErrorExceptionCreator: (restError) {
      var pleromaApiRestError =
          PleromaApiRestService.convertRestErrorToPleromaError(restError);
      var unifediApiRestError =
          pleromaApiRestError.toUnifediApiRestErrorPleromaAdapter();

      return UnifediApiRestErrorException(
        unifediError: unifediApiRestError.toUnifediApiRestError(),
      );
    },
  );
  var pleromaApiAccessBlocUnifediAdapter = PleromaApiAccessBlocUnifediAdapter(
    unifediApiAccessBloc: apiAccessBloc,
  );
  var pleromaApiRestService = PleromaApiRestService(
    accessBloc: pleromaApiAccessBlocUnifediAdapter,
    restService: restService,
  );
  var pleromaApiWebSocketsService = WebSocketsService(
    webSocketsModeSettingsBloc: webSocketsModeSettingsBloc,
  );

  var pleromaApiManager = PleromaApiManager(
    accessBloc: pleromaApiAccessBlocUnifediAdapter,
    restService: restService,
    webSocketsService: pleromaApiWebSocketsService,
  );
  // ignore: cascade_invocations
  pleromaApiManager.addDisposables(
    [
      restService,
      pleromaApiRestService,
      pleromaApiWebSocketsService,
    ],
  );

  var adapter = UnifediApiManagerPleromaAdapter(
    apiManager: pleromaApiManager,
  );

  return adapter;
}

UnifediApiManagerMastodonAdapter createMastodonApiManager({
  required IUnifediApiAccessBloc apiAccessBloc,
  required ComputeImpl? computeImpl,
  required IWebSocketsModeSettingsBloc webSocketsModeSettingsBloc,
}) {
  var restService = HttpRestService(
    baseUri: Uri.parse(apiAccessBloc.access.url),
    encoding: IRestService.defaultEncoding,
    computeImpl: null,
    customRestResponseErrorExceptionCreator: (restError) {
      var mastodonApiRestError =
          MastodonApiRestService.convertRestErrorToMastodonError(restError);
      var unifediApiRestError =
          mastodonApiRestError.toUnifediApiRestErrorMastodonAdapter();

      return UnifediApiRestErrorException(
        unifediError: unifediApiRestError.toUnifediApiRestError(),
      );
    },
  );

  var mastodonApiAccessBlocUnifediAdapter = MastodonApiAccessBlocUnifediAdapter(
    unifediApiAccessBloc: apiAccessBloc,
  );
  var mastodonApiRestService = MastodonApiRestService(
    accessBloc: mastodonApiAccessBlocUnifediAdapter,
    restService: restService,
  );
  var mastodonApiWebSocketsService = WebSocketsService(
    webSocketsModeSettingsBloc: webSocketsModeSettingsBloc,
  );

  var mastodonApiManager = MastodonApiManager(
    accessBloc: mastodonApiAccessBlocUnifediAdapter,
    restService: restService,
    webSocketsService: mastodonApiWebSocketsService,
  );
  // ignore: cascade_invocations
  mastodonApiManager.addDisposables(
    [
      restService,
      mastodonApiRestService,
      mastodonApiWebSocketsService,
    ],
  );

  var adapter = UnifediApiManagerMastodonAdapter(
    apiManager: mastodonApiManager,
  );

  return adapter;
}

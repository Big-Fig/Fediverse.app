import 'package:fediverse_api/fediverse_api.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../access/pleroma_api_access_bloc.dart';
import '../feature/pleroma_api_feature_model.dart';
import '../pleroma_api_model.dart';
import 'error/pleroma_api_rest_error_model.dart';

abstract class IPleromaApiRestService implements IFediverseApiRestService {
  IMastodonApiRestService get mastodonApiRestService;

  @override
  IPleromaApiAccessBloc get accessBloc;

  Stream<IPleromaApiRestError> get pleromaApiErrorStream;

  Future<K> sendHttpRequestAndParse<T extends IRestRequest, K>({
    required T request,
    required RestResultParser<String, K> parser,
    required IPleromaApiFeature? requestFeature,
    required List<IPleromaApiFeature>? fieldFeatures,
    bool? parseInIsolateOverride,
  });

  Future<void> sendHttpRequestAndProcessEmpty<T extends IRestRequest>({
    required T request,
    required IPleromaApiFeature? requestFeature,
    required List<IPleromaApiFeature>? fieldFeatures,
  });

  Future<List<String>>
      sendHttpRequestAndParseStringList<T extends IRestRequest>({
    required T request,
    required IPleromaApiFeature? requestFeature,
    required List<IPleromaApiFeature>? fieldFeatures,
    bool? parseInIsolateOverride,
  });

  Future<K> sendHttpRequestAndParseJson<T extends IRestRequest,
      K extends IPleromaApiResponse>({
    required T request,
    required JsonParser<K> jsonParser,
    required IPleromaApiFeature? requestFeature,
    required List<IPleromaApiFeature>? fieldFeatures,
    bool? parseInIsolateOverride,
  });

  Future<List<K>> sendHttpRequestAndParseJsonList<T extends IRestRequest,
      K extends IPleromaApiResponse>({
    required T request,
    required JsonParser<K> jsonParser,
    required IPleromaApiFeature? requestFeature,
    required List<IPleromaApiFeature>? fieldFeatures,
    bool? parseInIsolateOverride,
  });
}

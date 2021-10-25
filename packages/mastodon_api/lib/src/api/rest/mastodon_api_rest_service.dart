import 'package:fediverse_api/fediverse_api.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';

import '../access/mastodon_api_access_bloc.dart';
import '../feature/mastodon_api_feature_model.dart';
import '../mastodon_api_model.dart';
import 'error/mastodon_api_rest_error_model.dart';

abstract class IMastodonApiRestService implements IFediverseApiRestService {
  @override
  IMastodonApiAccessBloc get accessBloc;

  Stream<IMastodonApiRestError> get mastodonApiErrorStream;

  Future<K> sendHttpRequestAndParse<T extends IRestRequest, K>({
    required T request,
    required RestResultParser<String, K> parser,
    required IMastodonApiFeature requestFeature,
    required List<IMastodonApiFeature>? fieldFeatures,
    bool? parseInIsolateOverride,
  });

  Future<void> sendHttpRequestAndProcessEmpty<T extends IRestRequest>({
    required T request,
    required IMastodonApiFeature requestFeature,
    required List<IMastodonApiFeature>? fieldFeatures,
  });

  Future<List<String>>
      sendHttpRequestAndParseStringList<T extends IRestRequest>({
    required T request,
    required IMastodonApiFeature requestFeature,
    required List<IMastodonApiFeature>? fieldFeatures,
    bool? parseInIsolateOverride,
  });

  Future<K> sendHttpRequestAndParseJson<T extends IRestRequest,
      K extends IMastodonApiResponse?>({
    required T request,
    required JsonParser<K> jsonParser,
    required IMastodonApiFeature requestFeature,
    required List<IMastodonApiFeature>? fieldFeatures,
    bool? parseInIsolateOverride,
  });

  Future<List<K>> sendHttpRequestAndParseJsonList<T extends IRestRequest,
      K extends IMastodonApiResponse>({
    required T request,
    required JsonParser<K> jsonParser,
    required IMastodonApiFeature requestFeature,
    required List<IMastodonApiFeature>? fieldFeatures,
    bool? parseInIsolateOverride,
  });
}

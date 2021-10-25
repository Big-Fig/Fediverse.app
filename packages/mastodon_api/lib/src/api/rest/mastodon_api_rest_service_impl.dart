import 'dart:async';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:logging/logging.dart';

import '../access/mastodon_api_access_bloc.dart';
import '../feature/mastodon_api_feature_model.dart';
import '../mastodon_api_model.dart';
import 'error/details/mastodon_api_rest_error_details_model_impl.dart';
import 'error/mastodon_api_rest_error_model_impl.dart';
import 'mastodon_api_rest_service.dart';

final _logger = Logger('mastodon_api_rest_service_impl.dart');

class MastodonApiRestService extends DisposableOwner
    implements IMastodonApiRestService {
  @override
  final IMastodonApiAccessBloc accessBloc;

  @override
  final bool isNeedCheckRequirements;
  final bool isUnknownFeatureStateAcceptable;
  final bool isForbiddenFeatureStateAcceptable;

  @override
  final IRestService restService;

  MastodonApiRestService({
    required this.accessBloc,
    required this.restService,
    this.isNeedCheckRequirements = true,
    this.isUnknownFeatureStateAcceptable = true,
    this.isForbiddenFeatureStateAcceptable = false,
  });

  void assertFeaturesState(
    Iterable<IMastodonApiFeature> features,
  ) {
    var featuresState = checkFeaturesState(features);

    featuresState.when(
      // ignore: no-empty-block
      accessible: () {
        // nothing
      },
      forbidden: (_) {
        if (!isForbiddenFeatureStateAcceptable) {
          throw FediverseApiRequirementException(
            state: featuresState,
          );
        }
      },
      unknown: (_) {
        if (!isUnknownFeatureStateAcceptable) {
          throw FediverseApiRequirementException(
            state: featuresState,
          );
        }
      },
    );
  }

  FediverseApiFeatureRequirementState checkFeaturesState(
    Iterable<IMastodonApiFeature> features,
  ) {
    var states = features.map(
      accessBloc.checkMastodonApiFeatureState,
    );

    return states.merge();
  }

  @override
  Future<K> sendHttpRequestAndParse<T extends IRestRequest, K>({
    required T request,
    required RestResultParser<String, K> parser,
    required IMastodonApiFeature requestFeature,
    List<IMastodonApiFeature>? fieldFeatures,
    bool? parseInIsolateOverride,
  }) {
    assertFeaturesState(
      [
        requestFeature,
        if (fieldFeatures != null) ...fieldFeatures,
      ],
    );

    return restService
        .sendHttpRequestAndParse(
          request: _prepareRequest(request),
          parser: parser,
          parseInIsolateOverride: parseInIsolateOverride,
        )
        .then(_processResponse);
  }

  @override
  Future<K> sendHttpRequestAndParseJson<T extends IRestRequest,
      K extends IMastodonApiResponse?>({
    required T request,
    required JsonParser<K> jsonParser,
    required IMastodonApiFeature requestFeature,
    List<IMastodonApiFeature>? fieldFeatures,
    bool? parseInIsolateOverride,
  }) {
    assertFeaturesState(
      [
        requestFeature,
        if (fieldFeatures != null) ...fieldFeatures,
      ],
    );

    return restService
        .sendHttpRequestAndParseJson(
          request: _prepareRequest(request),
          jsonParser: jsonParser,
          parseInIsolateOverride: parseInIsolateOverride,
        )
        .then(_processResponse);
  }

  @override
  Future<List<K>> sendHttpRequestAndParseJsonList<T extends IRestRequest,
      K extends IMastodonApiResponse>({
    required T request,
    required JsonParser<K> jsonParser,
    required IMastodonApiFeature requestFeature,
    List<IMastodonApiFeature>? fieldFeatures,
    bool? parseInIsolateOverride,
  }) {
    assertFeaturesState(
      [
        requestFeature,
        if (fieldFeatures != null) ...fieldFeatures,
      ],
    );

    return restService
        .sendHttpRequestAndParseJsonList(
          request: _prepareRequest(request),
          jsonParser: jsonParser,
          parseInIsolateOverride: parseInIsolateOverride,
        )
        .then(_processResponse);
  }

  @override
  Future<List<String>>
      sendHttpRequestAndParseStringList<T extends IRestRequest>({
    required T request,
    required IMastodonApiFeature requestFeature,
    List<IMastodonApiFeature>? fieldFeatures,
    bool? parseInIsolateOverride,
  }) {
    assertFeaturesState(
      [
        requestFeature,
        if (fieldFeatures != null) ...fieldFeatures,
      ],
    );

    return restService
        .sendHttpRequestAndParseStringList(
          request: _prepareRequest(request),
          parseInIsolateOverride: parseInIsolateOverride,
        )
        .then(_processResponse);
  }

  @override
  Future<void> sendHttpRequestAndProcessEmpty<T extends IRestRequest>({
    required T request,
    required IMastodonApiFeature requestFeature,
    List<IMastodonApiFeature>? fieldFeatures,
  }) async {
    assertFeaturesState(
      [
        requestFeature,
        if (fieldFeatures != null) ...fieldFeatures,
      ],
    );

    var response = await restService.sendHttpRequest(
      request: _prepareRequest(request),
    );

    if (response.content?.isNotEmpty == true) {
      _logger.warning(
        () => 'Content ${response.content} is not empty but not processed',
      );
    }
  }

  IRestRequest _prepareRequest(IRestRequest request) {
    var maxAccessToken = accessBloc.access.maxAccessToken;

    return maxAccessToken != null
        ? request.copyAndAppend(
            headers: [
              RestHeader.authorizationBearer(
                bearer: maxAccessToken,
              ),
            ],
          )
        : request;
  }

  T _processResponse<T>(IParsedRestResponse<T> response) => response.result;

  static MastodonApiRestError convertRestErrorToMastodonError(
    IRestResponseError restResponseError,
  ) {
    var contentAsJson = restResponseError.contentAsJson;

    MastodonApiRestErrorDetails? details;
    if (contentAsJson != null) {
      details = MastodonApiRestErrorDetails.fromJson(contentAsJson);
    }

    return MastodonApiRestError(
      restResponseError: restResponseError.toRestResponseError(),
      details: details,
    );
  }

  @override
  Stream<MastodonApiRestError> get mastodonApiErrorStream =>
      restService.errorStream.map(
        convertRestErrorToMastodonError,
      );
}

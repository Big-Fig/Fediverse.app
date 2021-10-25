import 'dart:async';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:logging/logging.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../access/pleroma_api_access_bloc.dart';
import '../feature/pleroma_api_feature_model.dart';
import '../pleroma_api_model.dart';
import 'error/details/pleroma_api_rest_error_details_model_impl.dart';
import 'error/exception/pleroma_api_rest_error_exception_impl.dart';
import 'error/pleroma_api_rest_error_model_impl.dart';
import 'pleroma_api_rest_service.dart';

// ignore_for_file: avoid-ignoring-return-values
final _logger = Logger('pleroma_api_rest_service_impl.dart');

class PleromaApiRestService extends DisposableOwner
    implements IPleromaApiRestService {
  @override
  final IPleromaApiAccessBloc accessBloc;

  @override
  final bool isNeedCheckRequirements;
  final bool isUnknownFeatureStateAcceptable;
  final bool isForbiddenFeatureStateAcceptable;

  @override
  final IRestService restService;

  @override
  final MastodonApiRestService mastodonApiRestService;

  PleromaApiRestService({
    required this.accessBloc,
    required this.restService,
    this.isNeedCheckRequirements = true,
    this.isUnknownFeatureStateAcceptable = true,
    this.isForbiddenFeatureStateAcceptable = false,
  }) : mastodonApiRestService = MastodonApiRestService(
          accessBloc: accessBloc.mastodonApiAccessBloc,
          restService: restService,
          isNeedCheckRequirements: isNeedCheckRequirements,
          isUnknownFeatureStateAcceptable: isUnknownFeatureStateAcceptable,
          isForbiddenFeatureStateAcceptable: isForbiddenFeatureStateAcceptable,
        ) {
    mastodonApiRestService.disposeWith(this);
  }

  void assertFeaturesState(
    Iterable<IPleromaApiFeature> features,
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
    Iterable<IPleromaApiFeature> features,
  ) {
    var states = features.map(
      accessBloc.checkPleromaApiFeatureState,
    );

    return states.merge();
  }

  @override
  Future<K> sendHttpRequestAndParse<T extends IRestRequest, K>({
    required T request,
    required RestResultParser<String, K> parser,
    required IPleromaApiFeature? requestFeature,
    required List<IPleromaApiFeature>? fieldFeatures,
    bool? parseInIsolateOverride,
  }) {
    checkFeaturesState(
      [
        if (requestFeature != null) requestFeature,
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
      K extends IPleromaApiResponse>({
    required T request,
    required JsonParser<K> jsonParser,
    required IPleromaApiFeature? requestFeature,
    required List<IPleromaApiFeature>? fieldFeatures,
    bool? parseInIsolateOverride,
  }) {
    checkFeaturesState(
      [
        if (requestFeature != null) requestFeature,
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
      K extends IPleromaApiResponse>({
    required T request,
    required JsonParser<K> jsonParser,
    required IPleromaApiFeature? requestFeature,
    required List<IPleromaApiFeature>? fieldFeatures,
    bool? parseInIsolateOverride,
  }) {
    checkFeaturesState(
      [
        if (requestFeature != null) requestFeature,
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
    required IPleromaApiFeature? requestFeature,
    required List<IPleromaApiFeature>? fieldFeatures,
    bool? parseInIsolateOverride,
  }) {
    checkFeaturesState(
      [
        if (requestFeature != null) requestFeature,
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
    required IPleromaApiFeature? requestFeature,
    required List<IPleromaApiFeature>? fieldFeatures,
  }) async {
    checkFeaturesState(
      [
        if (requestFeature != null) requestFeature,
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

  static FutureOr<K> createExceptionOnRestResponseError<K>(
    RestResponseError restError,
  ) {
    var pleromaError = convertRestErrorToPleromaError(restError);
    throw PleromaApiRestErrorException(
      pleromaError: pleromaError,
    );
  }

  static PleromaApiRestError convertRestErrorToPleromaError(
    IRestResponseError restResponseError,
  ) {
    var contentAsJson = restResponseError.contentAsJson;

    MastodonApiRestErrorDetails? mastodonApiRestErrorDetails;
    PleromaApiRestErrorDetails? details;
    if (contentAsJson != null) {
      try {
        details = PleromaApiRestErrorDetails.fromJson(contentAsJson);
      } on Exception catch (e, stackTrace) {
        _logger.warning(
          () => 'fail to parse PleromaApiRestErrorDetails',
          e,
          stackTrace,
        );
      }

      if (details == null) {
        try {
          mastodonApiRestErrorDetails =
              MastodonApiRestErrorDetails.fromJson(contentAsJson);
        } on Exception catch (e, stackTrace) {
          _logger.warning(
            () => 'fail to parse MastodonApiRestErrorDetails',
            e,
            stackTrace,
          );
        }
      }
    }

    return PleromaApiRestError(
      restResponseError: restResponseError.toRestResponseError(),
      details: details,
      mastodonDetails: mastodonApiRestErrorDetails,
    );
  }

  @override
  Stream<PleromaApiRestError> get pleromaApiErrorStream =>
      restService.errorStream.map(
        convertRestErrorToPleromaError,
      );
}

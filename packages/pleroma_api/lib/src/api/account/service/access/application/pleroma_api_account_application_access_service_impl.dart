import 'dart:convert';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:logging/logging.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../../feature/pleroma_api_feature_model.dart';
import '../../../../feature/pleroma_api_feature_model_impl.dart';
import '../../../../oauth/pleroma_api_oauth_model_impl.dart';
import '../../../../rest/error/details/pleroma_api_rest_error_details_model.dart';
import '../../../../rest/error/details/pleroma_api_rest_error_details_model_impl.dart';
import '../../../../rest/error/exception/pleroma_api_rest_error_exception.dart';
import '../../../../rest/error/exception/pleroma_api_rest_error_exception_impl.dart';
import '../../../../rest/error/pleroma_api_rest_error_model_impl.dart';
import '../../../../rest/pleroma_api_rest_service.dart';
import '../../../register/pleroma_api_register_account_model.dart';
import '../../../register/response/pleroma_api_register_account_response_model_impl.dart';
import '../public/pleroma_api_account_public_access_service_impl.dart';
import 'pleroma_api_account_application_access_service.dart';

final _logger =
    Logger('pleroma_api_account_application_access_service_impl.dart');

class PleromaApiAccountApplicationAccessService
    extends PleromaApiAccountPublicAccessService
    implements IPleromaApiAccountApplicationAccessService {
  final MastodonApiAccountApplicationAccessService
      mastodonApiAccountApplicationAccessService;

  PleromaApiAccountApplicationAccessService({
    required IPleromaApiRestService restService,
  })  : mastodonApiAccountApplicationAccessService =
            MastodonApiAccountApplicationAccessService(
          restService: restService.mastodonApiRestService,
        ),
        super(
          restService: restService,
        ) {
    mastodonApiAccountApplicationAccessService.disposeWith(this);
  }

  @override
  // ignore: long-parameter-list, long-method
  Future<PleromaApiRegisterAccountResponse> registerAccount({
    required IPleromaApiRegisterAccount registerAccount,
  }) async {
    try {
      var request = mastodonApiAccountApplicationAccessService
          .createRegisterAccountRequest(
        registerAccount: registerAccount,
      )
          .copyAndAppend(
        bodyJson: <String, dynamic>{
          if (registerAccount.fullName != null)
            'fullname': registerAccount.fullName,
          if (registerAccount.bio != null) 'bio': registerAccount.bio,
          if (registerAccount.inviteToken != null)
            'token': registerAccount.inviteToken,
          if (registerAccount.captchaToken != null)
            'captcha_token': registerAccount.captchaToken,
          if (registerAccount.captchaAnswerData != null)
            'captcha_answer_data': registerAccount.captchaAnswerData,
          if (registerAccount.captchaSolution != null)
            'captcha_solution': registerAccount.captchaSolution,
        },
      );
      var token = await restService.sendHttpRequestAndParseJson(
        requestFeature: registerAccountFeature,
        fieldFeatures: [
          if (registerAccount.reason != null) registerAccountReasonFeature,
        ],
        request: request,
        jsonParser: (json) {
          try {
            return PleromaApiOAuthToken.fromJson(json);
          } on IPleromaApiRestErrorException catch (e, stackTrace) {
            _logger.warning(
              () => 'error during parsing PleromaApiOAuthToken from $json',
              e,
              stackTrace,
            );

            // pleroma may return error with 200 code
            // TODO: hack report to pleroma
            var pleromaApiRestErrorDetails =
                PleromaApiRestErrorDetails.fromJson(json);

            throw PleromaApiRestErrorException(
              pleromaError: PleromaApiRestError(
                restResponseError: RestResponseError(
                  request: request.toRestRequest(),
                  statusCode: 200,
                  content: jsonEncode(json),
                ),
                mastodonDetails: null,
                details: pleromaApiRestErrorDetails,
              ),
            );
          }
        },
      );

      return PleromaApiRegisterAccountResponse(
        approvalRequired:
            restService.accessBloc.access.instance?.approvalRequired,
        emailConformationRequired: false,
        authToken: token,
      );
    } on IPleromaApiRestErrorException catch (e, stackTrace) {
      var restError = e.restResponseError;
      _logger.warning(
        () => 'error during registerAccount $restError',
        e,
        stackTrace,
      );

      var identifierAsPleromaApi =
          e.pleromaError.details?.identifierAsPleromaApi;

      if (identifierAsPleromaApi != null) {
        var result = identifierAsPleromaApi.maybeMap(
          missingConfirmedEmail: (_) => const PleromaApiRegisterAccountResponse(
            approvalRequired: null,
            emailConformationRequired: true,
            authToken: null,
          ),
          awaitingApproval: (_) => const PleromaApiRegisterAccountResponse(
            approvalRequired: true,
            emailConformationRequired: false,
            authToken: null,
          ),
          orElse: () => null,
        );
        if (result != null) {
          return result;
        } else {
          rethrow;
        }
      } else {
        rethrow;
      }
    }
  }

  @override
  IPleromaApiFeature get registerAccountFeature =>
      PleromaApiFeature.onlyApplicationRequirements(
        mastodonApiAccountApplicationAccessService.registerAccountFeature,
      );

  @override
  IPleromaApiFeature get registerAccountReasonFeature =>
      PleromaApiFeature.onlyApplicationRequirements(
        mastodonApiAccountApplicationAccessService.registerAccountReasonFeature,
      );
}

import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import '../../../oauth/unifedi_api_oauth_model_impl.dart';

import 'unifedi_api_register_account_response_model.dart';

part 'unifedi_api_register_account_response_model_impl.freezed.dart';

part 'unifedi_api_register_account_response_model_impl.g.dart';

// ignore_for_file: no-magic-number

@HiveType(typeId: 0)
@freezed
class UnifediApiRegisterAccountResponse
    with _$UnifediApiRegisterAccountResponse
    implements IUnifediApiRegisterAccountResponse {
  const factory UnifediApiRegisterAccountResponse({
    @JsonKey(name: 'approval_required')
    @HiveField(0)
        required bool? approvalRequired,
    @JsonKey(name: 'email_conformation_required')
    @HiveField(1)
        required bool? emailConformationRequired,
    @JsonKey(name: 'auth_token')
    @HiveField(2)
        required UnifediApiOAuthToken? authToken,
  }) = _UnifediApiRegisterAccountResponse;

  factory UnifediApiRegisterAccountResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiRegisterAccountResponseFromJson(json);
}

extension IUnifediApiRegisterAccountResponseInterfaceExtension
    on IUnifediApiRegisterAccountResponse {
  UnifediApiRegisterAccountResponse toUnifediApiRegisterAccountResponse({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiRegisterAccountResponse(
          approvalRequired: approvalRequired,
          emailConformationRequired: emailConformationRequired,
          authToken: authToken?.toUnifediApiOAuthToken(),
        ),
        forceNewObject: forceNewObject,
      );
}

extension IUnifediApiRegisterAccountResponseInterfaceListExtension
    on List<IUnifediApiRegisterAccountResponse> {
  List<UnifediApiRegisterAccountResponse>
      toUnifediApiRegisterAccountResponseList({
    bool forceNewObject = false,
  }) =>
          InterfaceToImplHelper.interfaceListToImplList(
            this,
            (IUnifediApiRegisterAccountResponse item) =>
                item.toUnifediApiRegisterAccountResponse(),
            forceNewObject: forceNewObject,
          );
}

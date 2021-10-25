import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import '../../../oauth/pleroma_api_oauth_model_impl.dart';

import 'pleroma_api_register_account_response_model.dart';

part 'pleroma_api_register_account_response_model_impl.freezed.dart';

part 'pleroma_api_register_account_response_model_impl.g.dart';

// ignore_for_file: no-magic-number

@HiveType(typeId: 0)
@freezed
class PleromaApiRegisterAccountResponse
    with _$PleromaApiRegisterAccountResponse
    implements IPleromaApiRegisterAccountResponse {
  const factory PleromaApiRegisterAccountResponse({
    @JsonKey(name: 'approval_required')
    @HiveField(0)
        required bool? approvalRequired,
    @JsonKey(name: 'email_conformation_required')
    @HiveField(1)
        required bool? emailConformationRequired,
    @JsonKey(name: 'auth_token')
    @HiveField(2)
        required PleromaApiOAuthToken? authToken,
  }) = _PleromaApiRegisterAccountResponse;

  factory PleromaApiRegisterAccountResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiRegisterAccountResponseFromJson(json);
}

extension IPleromaApiRegisterAccountResponseInterfaceExtension
    on IPleromaApiRegisterAccountResponse {
  PleromaApiRegisterAccountResponse toPleromaApiRegisterAccountResponse({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiRegisterAccountResponse(
          approvalRequired: approvalRequired,
          emailConformationRequired: emailConformationRequired,
          authToken: authToken?.toPleromaApiOAuthToken(),
        ),
        forceNewObject: forceNewObject,
      );
}

extension IPleromaApiRegisterAccountResponseInterfaceListExtension
    on List<IPleromaApiRegisterAccountResponse> {
  List<PleromaApiRegisterAccountResponse>
      toPleromaApiRegisterAccountResponseList({
    bool forceNewObject = false,
  }) =>
          InterfaceToImplHelper.interfaceListToImplList(
            this,
            (IPleromaApiRegisterAccountResponse item) =>
                item.toPleromaApiRegisterAccountResponse(),
            forceNewObject: forceNewObject,
          );
}

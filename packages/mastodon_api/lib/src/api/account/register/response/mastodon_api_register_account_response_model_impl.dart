import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import '../../../oauth/mastodon_api_oauth_model_impl.dart';

import 'mastodon_api_register_account_response_model.dart';

part 'mastodon_api_register_account_response_model_impl.freezed.dart';

part 'mastodon_api_register_account_response_model_impl.g.dart';

// ignore_for_file: no-magic-number

@HiveType(typeId: 0)
@freezed
class MastodonApiRegisterAccountResponse
    with _$MastodonApiRegisterAccountResponse
    implements IMastodonApiRegisterAccountResponse {
  const factory MastodonApiRegisterAccountResponse({
    @JsonKey(name: 'approval_required')
    @HiveField(0)
        required bool? approvalRequired,
    @JsonKey(name: 'auth_token')
    @HiveField(1)
        required MastodonApiOAuthToken? authToken,
  }) = _MastodonApiRegisterAccountResponse;

  factory MastodonApiRegisterAccountResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MastodonApiRegisterAccountResponseFromJson(json);
}

extension IMastodonApiRegisterAccountResponseInterfaceExtension
    on IMastodonApiRegisterAccountResponse {
  MastodonApiRegisterAccountResponse toMastodonApiRegisterAccountResponse({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiRegisterAccountResponse(
          approvalRequired: approvalRequired,
          authToken: authToken?.toMastodonApiOAuthToken(),
        ),
        forceNewObject: forceNewObject,
      );
}

extension IMastodonApiRegisterAccountResponseInterfaceListExtension
    on List<IMastodonApiRegisterAccountResponse> {
  List<MastodonApiRegisterAccountResponse>
      toMastodonApiRegisterAccountResponseList({
    bool forceNewObject = false,
  }) =>
          InterfaceToImplHelper.interfaceListToImplList(
            this,
            (IMastodonApiRegisterAccountResponse item) =>
                item.toMastodonApiRegisterAccountResponse(),
            forceNewObject: forceNewObject,
          );
}

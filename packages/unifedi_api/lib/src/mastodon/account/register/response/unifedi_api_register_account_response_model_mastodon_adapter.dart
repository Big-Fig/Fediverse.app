import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../../api/account/register/response/unifedi_api_register_account_response_model.dart';
import '../../../../api/oauth/unifedi_api_oauth_model.dart';
import '../../../oauth/unifedi_api_oauth_model_mastodon_adapter.dart';

part 'unifedi_api_register_account_response_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_register_account_response_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiRegisterAccountResponseMastodonAdapter
    with _$UnifediApiRegisterAccountResponseMastodonAdapter
    implements IUnifediApiRegisterAccountResponse {
  const UnifediApiRegisterAccountResponseMastodonAdapter._();

  const factory UnifediApiRegisterAccountResponseMastodonAdapter(
    @HiveField(0) MastodonApiRegisterAccountResponse value,
  ) = _UnifediApiRegisterAccountResponseMastodonAdapter;

  factory UnifediApiRegisterAccountResponseMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiRegisterAccountResponseMastodonAdapterFromJson(json);

  @override
  bool? get approvalRequired => value.approvalRequired;

  @override
  IUnifediApiOAuthToken? get authToken =>
      value.authToken?.toUnifediApiOAuthTokenMastodonAdapter();

  @override
  bool? get emailConformationRequired => null;
}

extension MastodonApiRegisterAccountResponseUnifediExtension
    on IMastodonApiRegisterAccountResponse {
  UnifediApiRegisterAccountResponseMastodonAdapter
      toUnifediApiRegisterAccountResponseMastodonAdapter() =>
          UnifediApiRegisterAccountResponseMastodonAdapter(
            toMastodonApiRegisterAccountResponse(),
          );
}

extension MastodonApiRegisterAccountResponseUnifediListExtension
    on List<IMastodonApiRegisterAccountResponse> {
  List<UnifediApiRegisterAccountResponseMastodonAdapter>
      toUnifediApiRegisterAccountResponseMastodonAdapterList() => map(
            (item) => item.toUnifediApiRegisterAccountResponseMastodonAdapter(),
          ).toList();
}

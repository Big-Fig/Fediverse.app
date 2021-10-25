import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../../api/account/register/response/unifedi_api_register_account_response_model.dart';
import '../../../../api/oauth/unifedi_api_oauth_model.dart';
import '../../../oauth/unifedi_api_oauth_model_pleroma_adapter.dart';

part 'unifedi_api_register_account_response_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_register_account_response_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiRegisterAccountResponsePleromaAdapter
    with _$UnifediApiRegisterAccountResponsePleromaAdapter
    implements IUnifediApiRegisterAccountResponse {
  const UnifediApiRegisterAccountResponsePleromaAdapter._();

  const factory UnifediApiRegisterAccountResponsePleromaAdapter(
    @HiveField(0) PleromaApiRegisterAccountResponse value,
  ) = _UnifediApiRegisterAccountResponsePleromaAdapter;

  factory UnifediApiRegisterAccountResponsePleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiRegisterAccountResponsePleromaAdapterFromJson(json);

  @override
  bool? get approvalRequired => value.approvalRequired;

  @override
  IUnifediApiOAuthToken? get authToken =>
      value.authToken?.toUnifediApiOAuthTokenPleromaAdapter();

  @override
  bool? get emailConformationRequired => value.emailConformationRequired;
}

extension PleromaApiRegisterAccountResponseUnifediExtension
    on IPleromaApiRegisterAccountResponse {
  UnifediApiRegisterAccountResponsePleromaAdapter
      toUnifediApiRegisterAccountResponsePleromaAdapter() =>
          UnifediApiRegisterAccountResponsePleromaAdapter(
            toPleromaApiRegisterAccountResponse(),
          );
}

extension PleromaApiRegisterAccountResponseUnifediListExtension
    on List<IPleromaApiRegisterAccountResponse> {
  List<UnifediApiRegisterAccountResponsePleromaAdapter>
      toUnifediApiRegisterAccountResponsePleromaAdapterList() => map(
            (item) => item.toUnifediApiRegisterAccountResponsePleromaAdapter(),
          ).toList();
}

import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'mastodon_api_register_account_model.dart';

part 'mastodon_api_register_account_model_impl.freezed.dart';

part 'mastodon_api_register_account_model_impl.g.dart';

// ignore_for_file: no-magic-number

@HiveType(typeId: 0)
@freezed
class MastodonApiRegisterAccount
    with _$MastodonApiRegisterAccount
    implements IMastodonApiRegisterAccount {
  const factory MastodonApiRegisterAccount({
    @HiveField(1) required String username,
    @HiveField(2) required String email,
    @HiveField(3) required String password,
    @HiveField(4) required bool agreement,
    @HiveField(5) required String locale,
    @HiveField(6) required String? reason,
  }) = _MastodonApiRegisterAccount;

  factory MastodonApiRegisterAccount.fromJson(Map<String, dynamic> json) =>
      _$MastodonApiRegisterAccountFromJson(json);
}

extension IMastodonApiRegisterAccountInterfaceExtension
    on IMastodonApiRegisterAccount {
  MastodonApiRegisterAccount toMastodonApiRegisterAccount({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiRegisterAccount(
          username: username,
          email: email,
          password: password,
          agreement: agreement,
          locale: locale,
          reason: reason,
        ),
        forceNewObject: forceNewObject,
      );
}

extension IMastodonApiRegisterAccountInterfaceListExtension
    on List<IMastodonApiRegisterAccount> {
  List<MastodonApiRegisterAccount> toMastodonApiRegisterAccountList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IMastodonApiRegisterAccount item) =>
            item.toMastodonApiRegisterAccount(),
        forceNewObject: forceNewObject,
      );
}

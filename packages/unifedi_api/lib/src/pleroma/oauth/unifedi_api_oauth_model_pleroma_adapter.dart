import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../api/oauth/unifedi_api_oauth_model.dart';

part 'unifedi_api_oauth_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_oauth_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiOAuthTokenPleromaAdapter
    with _$UnifediApiOAuthTokenPleromaAdapter
    implements IUnifediApiOAuthToken {
  const UnifediApiOAuthTokenPleromaAdapter._();

  const factory UnifediApiOAuthTokenPleromaAdapter(
    @HiveField(0) PleromaApiOAuthToken value,
  ) = _UnifediApiOAuthTokenPleromaAdapter;

  @override
  String get accessToken => value.accessToken;

  @override
  String get tokenType => value.tokenType;

  @override
  String? get id => value.id;

  @override
  String? get me => value.me;

  factory UnifediApiOAuthTokenPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiOAuthTokenPleromaAdapterFromJson(json);
}

extension PleromaApiOAuthTokenUnifediExtension on IPleromaApiOAuthToken {
  UnifediApiOAuthTokenPleromaAdapter toUnifediApiOAuthTokenPleromaAdapter() =>
      UnifediApiOAuthTokenPleromaAdapter(
        toPleromaApiOAuthToken(),
      );
}

extension PleromaApiOAuthTokenUnifediListExtension
    on List<IPleromaApiOAuthToken> {
  List<UnifediApiOAuthTokenPleromaAdapter>
      toUnifediApiOAuthTokenPleromaAdapterList() => map(
            (item) => item.toUnifediApiOAuthTokenPleromaAdapter(),
          ).toList();
}

extension UnifediApiOAuthTokenPleromaExtension on IUnifediApiOAuthToken {
  PleromaApiOAuthToken toPleromaApiOAuthToken() => PleromaApiOAuthToken(
        accessToken: accessToken,
        tokenType: tokenType,
        id: id,
        me: me,
      );
}

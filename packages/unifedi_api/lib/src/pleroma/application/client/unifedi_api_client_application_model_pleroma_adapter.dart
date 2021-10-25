import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../api/application/client/unifedi_api_client_application_model.dart';

part 'unifedi_api_client_application_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_client_application_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiClientApplicationPleromaAdapter
    with _$UnifediApiClientApplicationPleromaAdapter
    implements IUnifediApiClientApplication {
  const UnifediApiClientApplicationPleromaAdapter._();

  const factory UnifediApiClientApplicationPleromaAdapter(
    @HiveField(0) PleromaApiClientApplication value,
  ) = _UnifediApiClientApplicationPleromaAdapter;

  @override
  String? get clientId => value.clientId;

  @override
  String? get clientSecret => value.clientSecret;

  @override
  String? get name => value.name;

  @override
  String? get vapidKey => value.vapidKey;

  @override
  String? get website => value.website;

  factory UnifediApiClientApplicationPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiClientApplicationPleromaAdapterFromJson(json);
}

extension PleromaApiClientApplicationUnifediExtension
    on IPleromaApiClientApplication {
  UnifediApiClientApplicationPleromaAdapter
      toUnifediApiClientApplicationPleromaAdapter() =>
          UnifediApiClientApplicationPleromaAdapter(
            toPleromaApiClientApplication(),
          );
}

extension UnifediApiClientApplicationPleromaExtension
    on IUnifediApiClientApplication {
  PleromaApiClientApplication toPleromaApiClientApplication() =>
      PleromaApiClientApplication(
        name: name,
        website: website,
        vapidKey: vapidKey,
        // ignore:avoid-non-null-assertion
        clientId: clientId!,
        // ignore:avoid-non-null-assertion
        clientSecret: clientSecret!,
      );
}

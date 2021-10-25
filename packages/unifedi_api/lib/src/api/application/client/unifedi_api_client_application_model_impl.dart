import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'unifedi_api_client_application_model.dart';

part 'unifedi_api_client_application_model_impl.freezed.dart';

part 'unifedi_api_client_application_model_impl.g.dart';

// ignore_for_file: no-magic-number

@HiveType(typeId: 0)
@freezed
class UnifediApiClientApplication
    with _$UnifediApiClientApplication
    implements IUnifediApiClientApplication {
  const factory UnifediApiClientApplication({
    @HiveField(0) required String? name,
    @HiveField(1) required String? website,
    @JsonKey(name: 'vapid_key') @HiveField(2) required String? vapidKey,
    @JsonKey(name: 'client_id') @HiveField(3) required String? clientId,
    @JsonKey(name: 'client_secret') @HiveField(4) required String? clientSecret,
  }) = _UnifediApiClientApplication;

  factory UnifediApiClientApplication.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiClientApplicationFromJson(json);
}

extension IUnifediApiClientApplicationInterfaceExtension
    on IUnifediApiClientApplication {
  UnifediApiClientApplication toUnifediApiClientApplication({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiClientApplication(
          name: name,
          website: website,
          vapidKey: vapidKey,
          clientId: clientId,
          clientSecret: clientSecret,
        ),
        forceNewObject: forceNewObject,
      );
}

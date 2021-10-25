import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'pleroma_api_client_application_model.dart';

part 'pleroma_api_client_application_model_impl.freezed.dart';

part 'pleroma_api_client_application_model_impl.g.dart';

// ignore_for_file: no-magic-number

@HiveType(typeId: 0)
@freezed
class PleromaApiClientApplication
    with _$PleromaApiClientApplication
    implements IPleromaApiClientApplication {
  const factory PleromaApiClientApplication({
    @HiveField(0) required String? name,
    @HiveField(1) required String? website,
    @JsonKey(name: 'vapid_key') @HiveField(2) required String? vapidKey,
    @JsonKey(name: 'client_id') @HiveField(3) required String clientId,
    @JsonKey(name: 'client_secret') @HiveField(4) required String clientSecret,
  }) = _PleromaApiClientApplication;

  factory PleromaApiClientApplication.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiClientApplicationFromJson(json);
}

extension IPleromaApiClientApplicationInterfaceExtension
    on IPleromaApiClientApplication {
  PleromaApiClientApplication toPleromaApiClientApplication({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiClientApplication(
          name: name,
          website: website,
          vapidKey: vapidKey,
          clientId: clientId,
          clientSecret: clientSecret,
        ),
        forceNewObject: forceNewObject,
      );
}

import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'pleroma_api_application_model.dart';

part 'pleroma_api_application_model_impl.freezed.dart';

// ignore_for_file: no-magic-number
part 'pleroma_api_application_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class PleromaApiApplication
    with _$PleromaApiApplication
    implements IPleromaApiApplication {
  const factory PleromaApiApplication({
    @HiveField(3) required String? name,
    @HiveField(4) required String? website,
    @JsonKey(name: 'vapid_key') @HiveField(2) required String? vapidKey,
  }) = _PleromaApiApplication;

  factory PleromaApiApplication.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiApplicationFromJson(json);
}

extension IPleromaApiApplicationInterfaceExtension on IPleromaApiApplication {
  PleromaApiApplication toPleromaApiApplication({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiApplication(
          name: name,
          website: website,
          vapidKey: vapidKey,
        ),
        forceNewObject: forceNewObject,
      );
}

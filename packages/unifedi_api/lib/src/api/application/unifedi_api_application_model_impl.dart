import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'unifedi_api_application_model.dart';

part 'unifedi_api_application_model_impl.freezed.dart';

// ignore_for_file: no-magic-number
part 'unifedi_api_application_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class UnifediApiApplication
    with _$UnifediApiApplication
    implements IUnifediApiApplication {
  const factory UnifediApiApplication({
    @HiveField(3) required String? name,
    @HiveField(4) required String? website,
    @JsonKey(name: 'vapid_key') @HiveField(2) required String? vapidKey,
  }) = _UnifediApiApplication;

  factory UnifediApiApplication.fromJson(Map<String, dynamic> json) =>
      _$UnifediApiApplicationFromJson(json);
}

extension IUnifediApiApplicationInterfaceExtension on IUnifediApiApplication {
  UnifediApiApplication toUnifediApiApplication({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiApplication(
          name: name,
          website: website,
          vapidKey: vapidKey,
        ),
        forceNewObject: forceNewObject,
      );
}

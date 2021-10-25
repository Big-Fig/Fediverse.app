import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../unifedi_api_status_model_impl.dart';
import 'unifedi_api_status_context_model.dart';

part 'unifedi_api_status_context_model_impl.freezed.dart';

part 'unifedi_api_status_context_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class UnifediApiStatusContext
    with _$UnifediApiStatusContext
    implements IUnifediApiStatusContext {
  const factory UnifediApiStatusContext({
    @HiveField(0) required List<UnifediApiStatus> descendants,
    @HiveField(1) required List<UnifediApiStatus> ancestors,
  }) = _UnifediApiStatusContext;

  factory UnifediApiStatusContext.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiStatusContextFromJson(json);
}

extension IUnifediApiStatusContextInterfaceExtension
    on IUnifediApiStatusContext {
  UnifediApiStatusContext toUnifediApiStatusContext({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiStatusContext(
          descendants: descendants.toUnifediApiStatusList(
            forceNewObject: forceNewObject,
          ),
          ancestors: ancestors.toUnifediApiStatusList(
            forceNewObject: forceNewObject,
          ),
        ),
        forceNewObject: forceNewObject,
      );
}

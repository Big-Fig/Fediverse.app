import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../pleroma_api_status_model_impl.dart';
import 'pleroma_api_status_context_model.dart';

part 'pleroma_api_status_context_model_impl.freezed.dart';

part 'pleroma_api_status_context_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class PleromaApiStatusContext
    with _$PleromaApiStatusContext
    implements IPleromaApiStatusContext {
  const factory PleromaApiStatusContext({
    @HiveField(0) required List<PleromaApiStatus> descendants,
    @HiveField(1) required List<PleromaApiStatus> ancestors,
  }) = _PleromaApiStatusContext;

  factory PleromaApiStatusContext.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiStatusContextFromJson(json);
}

extension IPleromaApiStatusContextInterfaceExtension
    on IPleromaApiStatusContext {
  PleromaApiStatusContext toPleromaApiStatusContext({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiStatusContext(
          descendants: descendants.toPleromaApiStatusList(
            forceNewObject: forceNewObject,
          ),
          ancestors: ancestors.toPleromaApiStatusList(
            forceNewObject: forceNewObject,
          ),
        ),
        forceNewObject: forceNewObject,
      );
}

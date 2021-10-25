import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'pleroma_api_list_model.dart';

// ignore_for_file: no-magic-number

part 'pleroma_api_list_model_impl.freezed.dart';

part 'pleroma_api_list_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class PleromaApiList with _$PleromaApiList implements IPleromaApiList {
  const factory PleromaApiList({
    @HiveField(0) required String id,
    @HiveField(1) required String title,
    @JsonKey(name: 'replies_policy')
    @HiveField(2)
        required String? repliesPolicy,
  }) = _PleromaApiList;

  factory PleromaApiList.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiListFromJson(json);
}

extension PleromaApiListInterfaceExtension on IPleromaApiList {
  PleromaApiList toPleromaApiList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiList(
          id: id,
          title: title,
          repliesPolicy: repliesPolicy,
        ),
        forceNewObject: forceNewObject,
      );
}

extension PleromaApiListInterfaceListExtension on List<IPleromaApiList> {
  List<PleromaApiList> toPleromaApiListList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IPleromaApiList item) => item.toPleromaApiList(),
        forceNewObject: forceNewObject,
      );
}

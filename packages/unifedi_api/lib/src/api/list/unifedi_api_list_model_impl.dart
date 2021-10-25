import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'unifedi_api_list_model.dart';

// ignore_for_file: no-magic-number

part 'unifedi_api_list_model_impl.freezed.dart';

part 'unifedi_api_list_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class UnifediApiList with _$UnifediApiList implements IUnifediApiList {
  const factory UnifediApiList({
    @HiveField(0) required String id,
    @HiveField(1) required String title,
    @JsonKey(name: 'replies_policy')
    @HiveField(2)
        required String? repliesPolicy,
  }) = _UnifediApiList;

  factory UnifediApiList.fromJson(Map<String, dynamic> json) =>
      _$UnifediApiListFromJson(json);
}

extension UnifediApiListInterfaceExtension on IUnifediApiList {
  UnifediApiList toUnifediApiList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiList(
          id: id,
          title: title,
          repliesPolicy: repliesPolicy,
        ),
        forceNewObject: forceNewObject,
      );
}

extension UnifediApiListInterfaceListExtension on List<IUnifediApiList> {
  List<UnifediApiList> toUnifediApiListList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IUnifediApiList item) => item.toUnifediApiList(),
        forceNewObject: forceNewObject,
      );
}

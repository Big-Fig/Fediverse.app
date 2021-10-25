import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';
import '../../../../api/instance/activity/item/unifedi_api_instance_activity_item_model.dart';

part 'unifedi_api_instance_activity_item_model_pleroma_adapter.freezed.dart';
part 'unifedi_api_instance_activity_item_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiInstanceActivityItemPleromaAdapter
    with _$UnifediApiInstanceActivityItemPleromaAdapter
    implements IUnifediApiInstanceActivityItem {
  const UnifediApiInstanceActivityItemPleromaAdapter._();
  const factory UnifediApiInstanceActivityItemPleromaAdapter(
    @HiveField(0) PleromaApiInstanceActivityItem value,
  ) = _UnifediApiInstanceActivityItemPleromaAdapter;

  @override
  int get logins => value.logins;

  @override
  int get registrations => value.registrations;

  @override
  int get statuses => value.statuses;

  @override
  int get week => value.week;
  factory UnifediApiInstanceActivityItemPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiInstanceActivityItemPleromaAdapterFromJson(json);
}

extension PleromaApiInstanceActivityItemUnifediExtension
    on IPleromaApiInstanceActivityItem {
  UnifediApiInstanceActivityItemPleromaAdapter
      toUnifediApiInstanceActivityItemPleromaAdapter() =>
          UnifediApiInstanceActivityItemPleromaAdapter(
            toPleromaApiInstanceActivityItem(),
          );
}

extension PleromaApiInstanceActivityItemUnifediListExtension
    on List<IPleromaApiInstanceActivityItem> {
  List<UnifediApiInstanceActivityItemPleromaAdapter>
      toUnifediApiInstanceActivityItemPleromaAdapterList() => map(
            (item) => item.toUnifediApiInstanceActivityItemPleromaAdapter(),
          ).toList();
}

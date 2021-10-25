import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';
import '../../api/tag/history/unifedi_api_tag_history_model.dart';
import '../../api/tag/unifedi_api_tag_model.dart';

part 'unifedi_api_featured_tags_model_pleroma_adapter.freezed.dart';
part 'unifedi_api_featured_tags_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiFeaturedTagPleromaAdapter
    with _$UnifediApiFeaturedTagPleromaAdapter
    implements IUnifediApiTag {
  const UnifediApiFeaturedTagPleromaAdapter._();
  const factory UnifediApiFeaturedTagPleromaAdapter(
    @HiveField(0) PleromaApiFeaturedTag value,
  ) = _UnifediApiFeaturedTagPleromaAdapter;

  @override
  IUnifediApiTagHistory? get history => null;

  @override
  String get name => value.name;

  @override
  String? get url => null;

  @override
  String? get id => value.id;

  @override
  DateTime? get lastStatusAt => value.lastStatusAt;

  @override
  int? get statusesCount => value.statusesCount;
  factory UnifediApiFeaturedTagPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiFeaturedTagPleromaAdapterFromJson(json);
}

extension PleromaApiFeaturedTagUnifediExtension on IPleromaApiFeaturedTag {
  UnifediApiFeaturedTagPleromaAdapter toUnifediApiFeaturedTagPleromaAdapter() =>
      UnifediApiFeaturedTagPleromaAdapter(
        toPleromaApiFeaturedTag(),
      );
}

extension PleromaApiFeaturedTagUnifediListExtension
    on List<IPleromaApiFeaturedTag> {
  List<UnifediApiFeaturedTagPleromaAdapter>
      toUnifediApiFeaturedTagPleromaAdapterList() => map(
            (item) => item.toUnifediApiFeaturedTagPleromaAdapter(),
          ).toList();
}

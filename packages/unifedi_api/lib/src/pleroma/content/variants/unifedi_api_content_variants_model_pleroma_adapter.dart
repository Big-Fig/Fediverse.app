import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';
import '../../../api/content/variants/unifedi_api_content_variants_model.dart';

part 'unifedi_api_content_variants_model_pleroma_adapter.freezed.dart';
part 'unifedi_api_content_variants_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiContentVariantsPleromaAdapter
    with _$UnifediApiContentVariantsPleromaAdapter
    implements IUnifediApiContentVariants {
  const UnifediApiContentVariantsPleromaAdapter._();
  const factory UnifediApiContentVariantsPleromaAdapter(
    @HiveField(0) PleromaApiContentVariants value,
  ) = _UnifediApiContentVariantsPleromaAdapter;

  @override
  String? get textPlain => value.textPlain;
  factory UnifediApiContentVariantsPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiContentVariantsPleromaAdapterFromJson(json);
}

extension PleromaApiContentVariantsUnifediExtension
    on IPleromaApiContentVariants {
  UnifediApiContentVariantsPleromaAdapter
      toUnifediApiContentVariantsPleromaAdapter() =>
          UnifediApiContentVariantsPleromaAdapter(
            toPleromaApiContentVariants(),
          );
}

extension PleromaApiContentVariantsUnifediListExtension
    on List<IPleromaApiContentVariants> {
  List<UnifediApiContentVariantsPleromaAdapter>
      toUnifediApiContentVariantsPleromaAdapterList() => map(
            (item) => item.toUnifediApiContentVariantsPleromaAdapter(),
          ).toList();
}

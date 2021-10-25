import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';
import '../../api/card/unifedi_api_card_model.dart';
import 'type/unifedi_api_card_type_sealed_pleroma_converter.dart';

part 'unifedi_api_card_model_pleroma_adapter.freezed.dart';
part 'unifedi_api_card_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiCardPleromaAdapter
    with _$UnifediApiCardPleromaAdapter
    implements IUnifediApiCard {
  const UnifediApiCardPleromaAdapter._();
  const factory UnifediApiCardPleromaAdapter(
    @HiveField(0) PleromaApiCard value,
  ) = _UnifediApiCardPleromaAdapter;

  @override
  String? get authorName => value.authorName;

  @override
  String? get authorUrl => value.authorUrl;

  @override
  String? get description => value.description;

  @override
  String? get embedUrl => value.embedUrl;

  @override
  int? get height => value.height;

  @override
  String? get html => value.html;

  @override
  String? get image => value.image;

  @override
  String? get providerName => value.providerName;

  @override
  String? get providerUrl => value.providerUrl;

  @override
  String? get title => value.title;

  @override
  String get type => value.typeAsPleromaApi.toUnifediApiCardType().stringValue;

  @override
  String? get url => value.url;

  @override
  int? get width => value.width;
  factory UnifediApiCardPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiCardPleromaAdapterFromJson(json);
}

extension PleromaApiCardUnifediExtension on IPleromaApiCard {
  UnifediApiCardPleromaAdapter toUnifediApiCardPleromaAdapter() =>
      UnifediApiCardPleromaAdapter(
        toPleromaApiCard(),
      );
}

extension PleromaApiCardUnifediListExtension on List<IPleromaApiCard> {
  List<UnifediApiCardPleromaAdapter> toUnifediApiCardPleromaAdapterList() =>
      map(
        (item) => item.toUnifediApiCardPleromaAdapter(),
      ).toList();
}

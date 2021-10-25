import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'pleroma_api_card_model.dart';

// ignore_for_file: no-magic-number

part 'pleroma_api_card_model_impl.freezed.dart';

part 'pleroma_api_card_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class PleromaApiCard with _$PleromaApiCard implements IPleromaApiCard {
  const factory PleromaApiCard({
    @HiveField(0) @JsonKey(name: 'author_name') required String? authorName,
    @HiveField(1) @JsonKey(name: 'author_url') required String? authorUrl,
    @HiveField(2) required String? description,
    @HiveField(3) @JsonKey(name: 'embed_url') required String? embedUrl,
    @HiveField(4)
    @JsonKey(fromJson: JsonParseHelper.intFromJsonOrNullOnError)
        required int? height,
    @HiveField(5)
    @JsonKey(fromJson: JsonParseHelper.intFromJsonOrNullOnError)
        required int? width,
    @HiveField(6) required String? html,
    @HiveField(7) required String? image,
    @HiveField(8) @JsonKey(name: 'provider_name') required String? providerName,
    @HiveField(9) @JsonKey(name: 'provider_url') required String? providerUrl,
    @HiveField(10) required String? title,
    @HiveField(11) required String type,
    @HiveField(12) required String? url,
  }) = _PleromaApiCard;

  factory PleromaApiCard.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiCardFromJson(json);
}

extension IPleromaApiCardInterfaceExtension on IPleromaApiCard {
  PleromaApiCard toPleromaApiCard({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiCard(
          authorName: authorName,
          authorUrl: authorUrl,
          description: description,
          embedUrl: embedUrl,
          height: height,
          width: width,
          html: html,
          image: image,
          providerName: providerName,
          providerUrl: providerUrl,
          title: title,
          type: type,
          url: url,
        ),
        forceNewObject: forceNewObject,
      );
}

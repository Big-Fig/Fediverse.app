import 'package:base_fediverse_api/base_fediverse_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_api_content_model.g.dart';

abstract class IPleromaApiContent {
  String? get textPlain;
}

@JsonSerializable(explicitToJson: true)
class PleromaApiContent implements IPleromaApiContent, IJsonObject {
  @override
  @JsonKey(name: 'text/plain')
  final String? textPlain;

  PleromaApiContent({
    required this.textPlain,
  });

  static PleromaApiContent fromJson(Map<String, dynamic> json) =>
      _$PleromaApiContentFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PleromaApiContentToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiContent &&
          runtimeType == other.runtimeType &&
          textPlain == other.textPlain;

  @override
  int get hashCode => textPlain.hashCode;

  @override
  String toString() {
    return 'PleromaApiContent{textPlain: $textPlain}';
  }
}

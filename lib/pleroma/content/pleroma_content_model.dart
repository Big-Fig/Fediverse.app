import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'pleroma_content_model.g.dart';

abstract class IPleromaContent {
  String? get textPlain;
}

@JsonSerializable(explicitToJson: true)
class PleromaContent implements IPleromaContent {
  @override
  @JsonKey(name: "text/plain")
  final String? textPlain;

  PleromaContent({
    this.textPlain,
  });

  factory PleromaContent.fromJson(Map<String, dynamic> json) =>
      _$PleromaContentFromJson(json);

  factory PleromaContent.fromJsonString(String jsonString) =>
      _$PleromaContentFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaContentToJson(this);

  String toJsonString() => jsonEncode(_$PleromaContentToJson(this));
}

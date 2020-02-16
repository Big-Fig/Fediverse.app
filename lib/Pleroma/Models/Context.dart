import 'dart:convert';
import 'package:fedi/Pleroma/status/pleroma_status_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Context.g.dart';

@JsonSerializable()
class Context {
    List<PleromaStatus> descendants;
    List<PleromaStatus> ancestors;

    Context({
        this.descendants,
        this.ancestors,
    });

    factory Context.fromJson(Map<String, dynamic> json) =>
        _$ContextFromJson(json);

    factory Context.fromJsonString(String jsonString) =>
        _$ContextFromJson(jsonDecode(jsonString));

    Map<String, dynamic> toJson() => _$ContextToJson(this);
    String toJsonString() => jsonEncode(_$ContextToJson(this));
}

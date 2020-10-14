import 'dart:convert';

import 'package:fedi/mastodon/list/mastodon_list_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_list_model.g.dart';

abstract class IPleromaList extends IMastodonList {}

@JsonSerializable()
class PleromaList extends IPleromaList {
  @override
  String id;

  @override
  String title;
  PleromaList({this.id, this.title});

  factory PleromaList.fromJson(Map<String, dynamic> json) =>
      _$PleromaListFromJson(json);

  factory PleromaList.fromJsonString(String jsonString) =>
      _$PleromaListFromJson(jsonDecode(jsonString));

  static List<PleromaList> listFromJsonString(String str) =>
      List<PleromaList>.from(
          json.decode(str).map((x) => PleromaList.fromJson(x)));

  Map<String, dynamic> toJson() => _$PleromaListToJson(this);

  String toJsonString() => jsonEncode(_$PleromaListToJson(this));
}

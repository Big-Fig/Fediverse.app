import 'dart:convert';

import 'package:fedi/app/home/tab/timelines/item/timelines_home_tab_item_model.dart';
import 'package:fedi/local_preferences/local_preferences_model.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'timelines_home_tab_storage_model.g.dart';

@HiveType()
@JsonSerializable()
class TimelinesHomeTabStorage implements IPreferencesObject {
  @HiveField(0)
  final List<TimelinesHomeTabItem> items;

  TimelinesHomeTabStorage({@required this.items});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimelinesHomeTabStorage &&
          runtimeType == other.runtimeType &&
          items == other.items;

  @override
  int get hashCode => items.hashCode;

  TimelinesHomeTabStorage copyWith({
    List<TimelinesHomeTabItem> items,
  }) =>
      TimelinesHomeTabStorage(items: items ?? this.items);

  @override
  String toString() {
    return 'TimelinesHomeTabStorage{items: $items}';
  }

  factory TimelinesHomeTabStorage.fromJson(Map<String, dynamic> json) =>
      _$TimelinesHomeTabStorageFromJson(json);

  factory TimelinesHomeTabStorage.fromJsonString(String jsonString) =>
      _$TimelinesHomeTabStorageFromJson(jsonDecode(jsonString));

  static List<TimelinesHomeTabStorage> listFromJsonString(String str) =>
      List<TimelinesHomeTabStorage>.from(
          json.decode(str).map((x) => TimelinesHomeTabStorage.fromJson(x)));

  @override
  Map<String, dynamic> toJson() => _$TimelinesHomeTabStorageToJson(this);

  String toJsonString() => jsonEncode(_$TimelinesHomeTabStorageToJson(this));
}

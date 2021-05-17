import 'dart:convert';

import 'package:moor/moor.dart';

abstract class JsonDatabaseConverter<T> extends TypeConverter<T, String> {
  const JsonDatabaseConverter();

  T fromJson(Map<String, dynamic>? json);

  Map<String, dynamic> toJson(T obj);

  @override
  T? mapToDart(String? fromDb) {
    if (fromDb == null) {
      return null;
    }
    // todo: check

    return fromJson(json.decode(fromDb) as Map<String, dynamic>?);
  }

  @override
  String? mapToSql(T? value) {
    if (value == null) {
      return null;
    }

    var jsonMap = toJson(value);

    return json.encode(jsonMap);
  }
}

abstract class JsonListDatabaseConverter<T>
    extends TypeConverter<List<T>, String> {
  const JsonListDatabaseConverter();

  T fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson(T obj);

  @override
  List<T>? mapToDart(String? fromDb) {
    if (fromDb == null) {
      return null;
    }
    var list = json.decode(fromDb) as List;

    return list.map((jsonObject) => fromJson(jsonObject)).toList();
  }

  @override
  String? mapToSql(List<T>? list) {
    if (list?.isNotEmpty == true) {
      return json.encode(list!.map((item) => toJson(item)).toList());
    } else {
      return null;
    }
  }
}

class StringListDatabaseConverter extends TypeConverter<List<String>, String> {
  const StringListDatabaseConverter();

  @override
  List<String>? mapToDart(String? fromDb) {
    if (fromDb == null) {
      return null;
    }
    var list = json.decode(fromDb) as List;
    // todo: rework

    return list.map((i) => i as String).toList();
  }

  @override
  String? mapToSql(List<String>? list) {
    if (list == null) {
      return null;
    }

    return json.encode(list);
  }
}

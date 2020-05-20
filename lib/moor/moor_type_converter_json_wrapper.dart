import 'package:json_annotation/json_annotation.dart';
import 'package:moor/moor.dart';

class MoorTypeConverterJsonWrapper<T> extends TypeConverter<T, String> {
  final JsonConverter<T, String> jsonConverter;
  MoorTypeConverterJsonWrapper(this.jsonConverter);

  @override
  T mapToDart(String fromDb) => jsonConverter.fromJson(fromDb);

  @override
  String mapToSql(T value) => jsonConverter.toJson(value);
}

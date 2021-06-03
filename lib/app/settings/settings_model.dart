import 'package:fedi/json/json_model.dart';

abstract class ISettings<T> implements IJsonObject {
  T clone();
}

import 'package:collection/collection.dart';

// ignore_for_file: no-magic-number
// ignore_for_file: binary-expression-operand-order

const _listEquality = ListEquality();
const _mapEquality = MapEquality();

int listHash(List? list) {
  if (list == null) {
    return 0;
  } else {
    return _listEquality.hash(list);
  }
}

int mapHash(Map? map) {
  if (map == null) {
    return 0;
  } else {
    return _mapEquality.hash(map);
  }
}

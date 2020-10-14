import 'package:fedi/enum/enum_values.dart';
import 'package:flutter_test/flutter_test.dart';

enum TestEnum { value1, value2, value3 }

var enumValues = EnumValues({
  "value1": TestEnum.value1,
  "value2": TestEnum.value2,
  "value3": TestEnum.value3
});
void main() {
  test('valuesWithoutSelected', () {
    expect(enumValues.valuesWithoutSelected([TestEnum.value1]), [
      TestEnum.value2,
      TestEnum.value3,
    ]);
    expect(enumValues.valuesWithoutSelected([TestEnum.value2]), [
      TestEnum.value1,
      TestEnum.value3,
    ]);

    expect(
        enumValues.valuesWithoutSelected([
          TestEnum.value2,
          TestEnum.value1,
        ]),
        [
          TestEnum.value3,
        ]);
  });
}

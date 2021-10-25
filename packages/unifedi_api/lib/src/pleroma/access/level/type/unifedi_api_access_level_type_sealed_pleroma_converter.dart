import 'package:pleroma_api/pleroma_api.dart';
import '../../../../api/access/level/type/unifedi_api_access_level_type_sealed.dart';

import '../../../../converter/sealed_converter.dart';

const _converter = UnifediApiAccessLevelTypePleromaConverter();

class UnifediApiAccessLevelTypePleromaConverter
    implements
        SealedConverter<UnifediApiAccessLevelType, PleromaApiAccessLevelType> {
  const UnifediApiAccessLevelTypePleromaConverter();

  @override
  UnifediApiAccessLevelType convertFrom(
    PleromaApiAccessLevelType item,
  ) =>
      item.map(
        public: (_) => UnifediApiAccessLevelType.publicValue,
        application: (_) => UnifediApiAccessLevelType.applicationValue,
        user: (_) => UnifediApiAccessLevelType.userValue,
      );

  @override
  PleromaApiAccessLevelType convertTo(
    UnifediApiAccessLevelType item,
  ) =>
      item.map(
        public: (_) => PleromaApiAccessLevelType.publicValue,
        application: (_) => PleromaApiAccessLevelType.applicationValue,
        user: (_) => PleromaApiAccessLevelType.userValue,
      );
}

extension PleromaApiAccessLevelTypeUnifediExtension
    on PleromaApiAccessLevelType {
  UnifediApiAccessLevelType toUnifediApiAccessLevelType() =>
      _converter.convertFrom(this);
}

extension UnifediApiAccessLevelTypePleromaExtension
    on UnifediApiAccessLevelType {
  PleromaApiAccessLevelType toPleromaApiAccessLevelType() =>
      _converter.convertTo(this);
}

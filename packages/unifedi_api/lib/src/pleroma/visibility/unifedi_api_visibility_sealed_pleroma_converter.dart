import 'package:pleroma_api/pleroma_api.dart';

import '../../api/visibility/unifedi_api_visibility_sealed.dart';
import '../../converter/sealed_converter.dart';

const _converter = UnifediApiVisibilityPleromaConverter();

class UnifediApiVisibilityPleromaConverter
    implements SealedConverter<UnifediApiVisibility, PleromaApiVisibility> {
  const UnifediApiVisibilityPleromaConverter();

  @override
  UnifediApiVisibility convertFrom(
    PleromaApiVisibility item,
  ) =>
      item.map(
        public: (_) => UnifediApiVisibility.publicValue,
        direct: (_) => UnifediApiVisibility.directValue,
        local: (_) => UnifediApiVisibility.localValue,
        list: (_) => UnifediApiVisibility.listValue,
        unlisted: (_) => UnifediApiVisibility.unlistedValue,
        private: (_) => UnifediApiVisibility.privateValue,
        unknown: (value) => UnifediApiVisibility.unknown(
          stringValue: value.stringValue,
        ),
      );

  @override
  PleromaApiVisibility convertTo(
    UnifediApiVisibility item,
  ) =>
      item.map(
        public: (_) => PleromaApiVisibility.publicValue,
        direct: (_) => PleromaApiVisibility.directValue,
        local: (_) => PleromaApiVisibility.localValue,
        list: (_) => PleromaApiVisibility.listValue,
        unlisted: (_) => PleromaApiVisibility.unlistedValue,
        private: (_) => PleromaApiVisibility.privateValue,
        unknown: (value) => PleromaApiVisibility.unknown(
          stringValue: value.stringValue,
        ),
      );
}

extension PleromaApiVisibilityUnifediExtension on PleromaApiVisibility {
  UnifediApiVisibility toUnifediApiVisibility() => _converter.convertFrom(this);
}

extension UnifediApiVisibilityPleromaExtension on UnifediApiVisibility {
  PleromaApiVisibility toPleromaApiVisibility() => _converter.convertTo(this);
}

extension UnifediApiVisibilityPleromaListExtension
    on List<UnifediApiVisibility> {
  List<PleromaApiVisibility> toPleromaApiVisibilityList() => map(
        (item) => item.toPleromaApiVisibility(),
      ).toList();
}

extension PleromaApiVisibilityUnifediListExtension
    on List<PleromaApiVisibility> {
  List<UnifediApiVisibility> toUnifediApiVisibilityList() => map(
        (item) => item.toUnifediApiVisibility(),
      ).toList();
}

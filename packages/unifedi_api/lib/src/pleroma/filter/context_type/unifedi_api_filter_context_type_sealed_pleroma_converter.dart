import 'package:pleroma_api/pleroma_api.dart';

import '../../../api/filter/context_type/unifedi_api_filter_context_type_model.dart';
import '../../../converter/sealed_converter.dart';

const _converter = UnifediApiFilterContextTypePleromaConverter();

class UnifediApiFilterContextTypePleromaConverter
    implements
        SealedConverter<UnifediApiFilterContextType,
            PleromaApiFilterContextType> {
  const UnifediApiFilterContextTypePleromaConverter();

  @override
  UnifediApiFilterContextType convertFrom(
    PleromaApiFilterContextType item,
  ) =>
      item.map(
        home: (_) => UnifediApiFilterContextType.homeValue,
        notifications: (_) => UnifediApiFilterContextType.notificationsValue,
        public: (_) => UnifediApiFilterContextType.publicValue,
        thread: (_) => UnifediApiFilterContextType.threadValue,
        account: (_) => UnifediApiFilterContextType.accountValue,
        unknown: (value) => UnifediApiFilterContextType.unknown(
          stringValue: value.stringValue,
        ),
      );

  @override
  PleromaApiFilterContextType convertTo(
    UnifediApiFilterContextType item,
  ) =>
      item.map(
        home: (_) => PleromaApiFilterContextType.homeValue,
        notifications: (_) => PleromaApiFilterContextType.notificationsValue,
        public: (_) => PleromaApiFilterContextType.publicValue,
        thread: (_) => PleromaApiFilterContextType.threadValue,
        account: (_) => PleromaApiFilterContextType.accountValue,
        unknown: (value) => PleromaApiFilterContextType.unknown(
          stringValue: value.stringValue,
        ),
      );
}

extension PleromaApiFilterContextTypeUnifediExtension
    on PleromaApiFilterContextType {
  UnifediApiFilterContextType toUnifediApiFilterContextType() =>
      _converter.convertFrom(this);
}

extension UnifediApiFilterContextTypePleromaExtension
    on UnifediApiFilterContextType {
  PleromaApiFilterContextType toPleromaApiFilterContextType() =>
      _converter.convertTo(this);
}

extension UnifediApiFilterContextTypePleromaListExtension
    on List<UnifediApiFilterContextType> {
  List<PleromaApiFilterContextType> toPleromaApiFilterContextTypeList() => map(
        (e) => e.toPleromaApiFilterContextType(),
      ).toList();
}

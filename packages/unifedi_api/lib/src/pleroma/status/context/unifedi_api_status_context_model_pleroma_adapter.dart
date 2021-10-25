import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';
import '../../../api/status/context/unifedi_api_status_context_model.dart';
import '../../../api/status/unifedi_api_status_model.dart';

import '../unifedi_api_status_model_pleroma_adapter.dart';

part 'unifedi_api_status_context_model_pleroma_adapter.freezed.dart';
part 'unifedi_api_status_context_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiStatusContextPleromaAdapter
    with _$UnifediApiStatusContextPleromaAdapter
    implements IUnifediApiStatusContext {
  const UnifediApiStatusContextPleromaAdapter._();
  const factory UnifediApiStatusContextPleromaAdapter(
    @HiveField(0) PleromaApiStatusContext value,
  ) = _UnifediApiStatusContextPleromaAdapter;

  @override
  List<IUnifediApiStatus> get ancestors =>
      value.ancestors.toUnifediApiStatusPleromaAdapterList();

  @override
  List<IUnifediApiStatus> get descendants =>
      value.descendants.toUnifediApiStatusPleromaAdapterList();
  factory UnifediApiStatusContextPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiStatusContextPleromaAdapterFromJson(json);
}

extension PleromaApiStatusContextUnifediExtension on IPleromaApiStatusContext {
  UnifediApiStatusContextPleromaAdapter
      toUnifediApiStatusContextPleromaAdapter() =>
          UnifediApiStatusContextPleromaAdapter(
            toPleromaApiStatusContext(),
          );
}

extension PleromaApiStatusContextUnifediListExtension
    on List<IPleromaApiStatusContext> {
  List<UnifediApiStatusContextPleromaAdapter>
      toUnifediApiStatusContextPleromaAdapterList() => map(
            (item) => item.toUnifediApiStatusContextPleromaAdapter(),
          ).toList();
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';
import '../../api/application/unifedi_api_application_model.dart';

part 'unifedi_api_application_model_pleroma_adapter.freezed.dart';
part 'unifedi_api_application_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiApplicationPleromaAdapter
    with _$UnifediApiApplicationPleromaAdapter
    implements IUnifediApiApplication {
  const UnifediApiApplicationPleromaAdapter._();
  const factory UnifediApiApplicationPleromaAdapter(
    @HiveField(0) PleromaApiApplication value,
  ) = _UnifediApiApplicationPleromaAdapter;

  @override
  String? get name => value.name;

  @override
  String? get vapidKey => value.vapidKey;

  @override
  String? get website => value.website;
  factory UnifediApiApplicationPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiApplicationPleromaAdapterFromJson(json);
}

extension PleromaApiApplicationUnifediExtension on IPleromaApiApplication {
  UnifediApiApplicationPleromaAdapter toUnifediApiApplicationPleromaAdapter() =>
      UnifediApiApplicationPleromaAdapter(
        toPleromaApiApplication(),
      );
}

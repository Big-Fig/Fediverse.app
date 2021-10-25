import '../unifedi_api_model.dart';

abstract class IUnifediApiMarker implements IUnifediApiResponse {
  String? get lastReadId;

  int get version;

  DateTime? get updatedAt;

  int? get unreadCount;
}

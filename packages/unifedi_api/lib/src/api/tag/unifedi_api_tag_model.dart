import '../unifedi_api_model.dart';
import 'history/unifedi_api_tag_history_model.dart';

abstract class IUnifediApiTag implements IUnifediApiResponse {
  String get name;

  String? get url;

  IUnifediApiTagHistory? get history;

  String? get id;

  DateTime? get lastStatusAt;

  int? get statusesCount;
}

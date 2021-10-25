import '../../unifedi_api_model.dart';
import 'item/unifedi_api_tag_history_item_model.dart';

abstract class IUnifediApiTagHistory implements IUnifediApiResponsePart {
  List<IUnifediApiTagHistoryItem> get items;
}

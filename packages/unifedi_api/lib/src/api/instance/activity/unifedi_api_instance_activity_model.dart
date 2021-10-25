import '../../unifedi_api_model.dart';
import 'item/unifedi_api_instance_activity_item_model.dart';

abstract class IUnifediApiInstanceActivity implements IUnifediApiResponsePart {
  List<IUnifediApiInstanceActivityItem> get items;
}

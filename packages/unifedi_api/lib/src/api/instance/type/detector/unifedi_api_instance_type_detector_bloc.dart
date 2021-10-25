import 'package:easy_dispose/easy_dispose.dart';
import '../unifedi_api_instance_type_model.dart';

abstract class IUnifediApiInstanceTypeDetectorBloc implements IDisposable {
  Future<UnifediApiInstanceType> detectInstanceType({
    required String url,
  });
}

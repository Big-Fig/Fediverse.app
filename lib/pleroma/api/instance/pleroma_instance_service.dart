import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/instance/pleroma_instance_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaInstanceService implements IPleromaApi {
  static IPleromaInstanceService of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaInstanceService>(context, listen: listen);

  Future<IPleromaInstance> getInstance();

  Future<List<String>> getPeers();

  Future<List<IPleromaInstanceHistory>> getHistory();
}

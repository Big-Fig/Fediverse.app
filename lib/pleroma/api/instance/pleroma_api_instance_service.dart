import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/instance/pleroma_api_instance_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaApiInstanceService implements IPleromaApi {
  static IPleromaApiInstanceService of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaApiInstanceService>(context, listen: listen);

  Future<IPleromaApiInstance> getInstance();

  Future<List<String>> getPeers();

  Future<List<IPleromaApiInstanceHistory>> getHistory();
}

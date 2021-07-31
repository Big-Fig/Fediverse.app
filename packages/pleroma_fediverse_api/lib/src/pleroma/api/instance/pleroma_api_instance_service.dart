import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/instance/pleroma_api_instance_model.dart';

abstract class IPleromaApiInstanceService implements IPleromaApi {
  Future<IPleromaApiInstance> getInstance();

  Future<List<String>> getPeers();

  Future<List<IPleromaApiInstanceActivityItem>> getActivity();
}

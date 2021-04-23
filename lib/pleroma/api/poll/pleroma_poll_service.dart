import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/poll/pleroma_poll_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaPollService extends IPleromaApi {
  static IPleromaPollService of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaPollService>(
        context,
        listen: listen,
      );

  Future<IPleromaPoll> getPoll({
    required String pollRemoteId,
  });

  Future<IPleromaPoll> vote({
    required String pollRemoteId,
    required List<int> voteIndexes,
  });
}

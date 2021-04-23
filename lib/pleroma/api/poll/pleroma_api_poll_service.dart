import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/poll/pleroma_api_poll_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaApiPollService extends IPleromaApi {
  static IPleromaApiPollService of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaApiPollService>(
        context,
        listen: listen,
      );

  Future<IPleromaApiPoll> getPoll({
    required String pollRemoteId,
  });

  Future<IPleromaApiPoll> vote({
    required String pollRemoteId,
    required List<int> voteIndexes,
  });
}

import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/conversation/pleroma_conversation_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaConversationService implements IPleromaApi {
  static IPleromaConversationService of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IPleromaConversationService>(context, listen: listen);

  Future<List<IPleromaStatus>> getConversationStatuses({
    @required String conversationRemoteId,
    int limit,
    String maxId,
    String sinceId,
  });


  Future<IPleromaConversation> getConversation(
      {@required String conversationRemoteId});

  Future<IPleromaConversation> markConversationAsRead(
      {@required String conversationRemoteId});

  Future<bool> deleteConversation({@required String conversationRemoteId});

  Future<List<IPleromaConversation>> getConversations(
      {String maxId,
      String sinceId,
      String minId,
      List<String> recipientsIds,
      int limit});
}

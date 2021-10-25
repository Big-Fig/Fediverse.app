import '../../account/pleroma_api_account_model.dart';
import '../../pleroma_api_model.dart';

abstract class IPleromaApiStatusEmojiReaction implements IPleromaApiResponse {
  String get name;

  int get count;

  bool get me;

  List<IPleromaApiAccount>? get accounts;

  String? get staticUrl;

  String? get url;
}

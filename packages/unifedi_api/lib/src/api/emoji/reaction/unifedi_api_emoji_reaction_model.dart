import '../../account/unifedi_api_account_model.dart';

abstract class IUnifediApiEmojiReaction {
  String get name;

  int get count;

  bool get me;

  String? get url;

  String? get staticUrl;

  List<IUnifediApiAccount>? get accounts;
}

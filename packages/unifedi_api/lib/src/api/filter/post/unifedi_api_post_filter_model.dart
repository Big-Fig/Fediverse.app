import '../../unifedi_api_model.dart';

abstract class IUnifediApiPostFilter implements IUnifediApiObject {
  Duration? get expiresIn;

  String get phrase;

  List<String> get context;

  bool get irreversible;

  bool get wholeWord;
}

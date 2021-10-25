import 'package:easy_dispose/easy_dispose.dart';

abstract class IFediverseBrowserBloc implements IDisposable {
  Future<void> init();

  Future<void> openUrl(String url);

  Future<void> waitForSelector(String selector);

  Future<void> enterTextToSelector(String selector, String text);

  Future<void> clickOnSelector(String selector);

  Future<String?> extractPageHtmlContent();

  Future<T> evaluate<T>(String pageFunction, {List? args});
}

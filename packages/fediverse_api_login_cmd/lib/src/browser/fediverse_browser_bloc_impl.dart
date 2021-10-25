import 'package:easy_dispose/easy_dispose.dart';
import 'package:logging/logging.dart';
import 'package:puppeteer/puppeteer.dart';

import 'fediverse_browser_bloc.dart';

final _logger = Logger('fediverse_browser_bloc_impl.dart');

class FediverseBrowserBloc extends DisposableOwner
    implements IFediverseBrowserBloc {
  // ignore: avoid-late-keyword
  late Browser browser;

  // ignore: avoid-late-keyword
  late Page page;

  @override
  Future<void> init() async {
    browser = await puppeteer.launch();
    page = await browser.newPage();

    addCustomDisposable(() => page.close());
    addCustomDisposable(() => browser.close());
  }

  @override
  Future<void> openUrl(String url) {
    _logger.finest(() => 'openUrl $url');

    return page.goto(
      url,
      wait: Until.networkIdle,
    );
  }

  @override
  Future<void> clickOnSelector(String selector) {
    _logger.finest(() => 'clickOnSelector $selector');

    return page.click(selector);
  }

  @override
  Future<void> enterTextToSelector(String selector, String text) {
    _logger.finest(() => 'enterTextToSelector $selector => $text');

    return page.type(selector, text);
  }

  @override
  Future<String?> extractPageHtmlContent() {
    _logger.finest(() => 'extractPageHtmlContent');

    return page.content;
  }

  @override
  Future<void> waitForSelector(String selector) {
    _logger.finest(() => 'waitForSelector $selector');

    return page.waitForSelector(selector);
  }

  @override
  Future<T> evaluate<T>(String pageFunction, {List? args}) {
    _logger.finest(() => 'evaluate $pageFunction', args);

    return page.evaluate(pageFunction, args: args);
  }
}

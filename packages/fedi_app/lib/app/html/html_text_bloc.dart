import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/html/html_text_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/style.dart';
import 'package:provider/provider.dart';

abstract class IHtmlTextBloc implements IDisposable {
  static IHtmlTextBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IHtmlTextBloc>(
        context,
        listen: listen,
      );

  HtmlTextInputData get inputData;

  HtmlTextSettings get settings;

  Stream<String?> get linkClickedStream;

  HtmlTextResultData get htmlData;

  Map<String, Style> get htmlStyles;

  void onLinkClicked({
    required String url,
  });
}

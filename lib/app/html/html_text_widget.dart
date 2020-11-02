import 'package:fedi/app/html/html_text_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:logging/logging.dart';

var _logger = Logger("html_text_widget.dart");

class HtmlTextWidget extends StatelessWidget {
  const HtmlTextWidget();

  @override
  Widget build(BuildContext context) {
    var htmlTextBloc = IHtmlTextBloc.of(context);

    var htmlData = htmlTextBloc.htmlData;
    _logger.finest(() => "htmlData $htmlData");

    if(htmlData?.text?.isNotEmpty != true) {
      return const SizedBox.shrink();
    }

    if (htmlData.isActuallyHaveHtmlInData) {
      return Html(
        data: htmlData.text,
        shrinkWrap: htmlTextBloc.settings.shrinkWrap,
        onImageTap: (String source) {
          _logger.finest(() => "onImageTap $source");
        },
        style: htmlTextBloc.htmlStyles,
      );
    } else {
      var settings = htmlTextBloc.settings;
      return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          htmlData.text,
          style: TextStyle(
              color: settings.color,
              fontSize: settings.fontSize,
              fontWeight: settings.fontWeight,
              height: settings.lineHeight),
          textAlign: settings.textAlign,
          overflow: settings.textOverflow,
          maxLines: settings.textMaxLines,
        ),
      );
    }
  }
}

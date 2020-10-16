import 'package:flutter/widgets.dart';

class HtmlTextData<T> {
  final T source;
  final String htmlData;

  HtmlTextData({
    @required this.source,
    @required this.htmlData,
  });

  @override
  String toString() {
    return 'HtmlTextData{htmlData: $htmlData}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HtmlTextData &&
          runtimeType == other.runtimeType &&
          htmlData == other.htmlData;

  @override
  int get hashCode => htmlData.hashCode;
}

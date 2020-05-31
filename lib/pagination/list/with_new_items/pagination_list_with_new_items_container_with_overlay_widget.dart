import 'package:fedi/pagination/list/with_new_items/pagination_list_with_new_items_overlay_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaginationListWithNewItemsContainerWithOverlayWidget
    extends StatelessWidget {
  final String Function(BuildContext context, int updateItemsCount) textBuilder;
  final Widget child;
  final EdgeInsets padding;

  PaginationListWithNewItemsContainerWithOverlayWidget({
    @required this.child,
    @required this.textBuilder,
    this.padding = const EdgeInsets.only(top: 24.0),
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: padding,
              child: PaginationListWithNewItemsOverlayWidget(
                textBuilder: textBuilder,
              ),
            )),
      ],
    );
  }
}

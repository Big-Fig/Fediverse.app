import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_overlay_widget.dart';
import 'package:flutter/cupertino.dart';

const _tapToLoadTopPadding = 24.0;

class FediListTapToLoadOverlayWidget extends StatelessWidget {
  final String Function(BuildContext context, int updateItemsCount) textBuilder;

  FediListTapToLoadOverlayWidget({@required this.textBuilder});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: _tapToLoadTopPadding),
        child: CachedPaginationListWithNewItemsOverlayWidget(
          textBuilder: textBuilder,
        ),
      ),
    );
  }
}

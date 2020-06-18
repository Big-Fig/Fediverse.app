import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/pagination/list/with_new_items/pagination_list_with_new_items_overlay_widget.dart';
import 'package:flutter/cupertino.dart';

class FediListTapToLoadOverlayWidget extends StatelessWidget {
  final String Function(BuildContext context, int updateItemsCount) textBuilder;

  FediListTapToLoadOverlayWidget({@required this.textBuilder});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: FediSizes.tapToLoadTopPadding),
        child: PaginationListWithNewItemsOverlayWidget(
          textBuilder: textBuilder,
        ),
      ),
    );
  }
}
